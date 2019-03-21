public class DMLExamples {
    //This method inserts three account records and updates an existing
    //account record.
    public static void insertAndUpdateExample() {
        List<Account> accountsToInsert = new List<Account>();
        
        //Create three account object and add to list
        //We DO NOT want to perform DML on individual sObject/records
        //so we add to a list
        for (Integer i = 0; i < 3; i++) {
            Account a = new Account(Name = 'Gabes' + i, 
                                    BillingCity = 'San Francisco');
            accountsToInsert.add(a);
            
        }// end for
        
        Account accountToUpdate; 
        
        try {
            insert accountsToInsert;
            System.debug('Gabes2: ' + accountToUpdate);
            
            // Update account Wal-Mart2
            accountToUpdate = [SELECT BillingCity 
                               FROM Account 
                               WHERE Name = 'Gabes2' 
                               LIMIT 1];
            
            // Update the billing city
            accountToUpdate.BillingCity = 'New York';
            
            update accountToUpdate;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
        System.debug('Gabes2: ' + accountToUpdate);
        
    }// end insertAndUpdateExample
    
    /*
     * You can insert records related to existing records if a relationship has already been defined
     * between the two objects. A records is associated with a related record through a foreign key ID.
     * 
     * This example add a Contact to an Account (the related record) by setting the Acount ID field
     * on the contact.
     * 
     * */
    public static void insertingRelatedRecords() {
        try {
            Account a = new Account(Name = 'SFDC Account');
            insert a;
            
            // Once the account is inserted, the sObject will be populated with an ID.
            // Get this ID.
            Id aId = a.Id;
            
            // Add a contact to this account
            Contact c = new Contact(
            	FirstName = 'Gabriel',
            	LastName = 'Nypaver',
            	Phone = '4120000000', 
            	AccountId = aId);
            
            insert c;
    	} catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
    }// end insertingRelatedRecords
    
    /*
     * Fields on related records can't be updated with the same call
     * to the DML operation and require a seprate DML call.
     * For example, if inserting a new contact, you can specify the contact's
     * related account record by setting the value of the account ID field.
     * However, you can't change the account name without updating the account
     * itself with a seperate DML call.
     * Similary, when updating on a contact, if you also want to update
     * the contact's related account, you must make two DML calls.
     * 
     * */
    public static void updatingRelatedRecords() {
        try {
            //Query for the contact, which has been associated with an account
            Contact queriedContact = [SELECT Phone, Account.Industry
                                     FROM Contact
                                     WHERE FirstName = 'Gabriel'
                                     AND LastName = 'Nypaver'
                                     LIMIT 1];
            
            //Update the contact's phone number
            queriedContact.Phone = '8881111111';
            
            //Update the related account industry
            queriedContact.Account.Industry = 'Technology';
            
           	// Make two seperate calls
           	// 1. This call is to update the contact's phone
           	update queriedContact;
            // 2. This call is to update the related account's industry field
            update queriedContact.Account;
        } catch(DMLException e) {
            
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
    }// end updatingRelatedRecords
    
    /*
     * Using the upsert operation, you can either insert or update an existing record in
     * one call. To determine if a record already exists, the upsert statement or
     * Database method uses the records's ID as the key to match records, a custom external ID,
     * or a standard field with the idLookup attrubute set to true.
     * 
     * -If the key is not matched, then a new record is created.
     * -If the key is matched once, then the existing record is updated.
     * -If the key is matched multiple times, then an error is generated and the object
     * 		is neither inserted or updated.
     * 
     * */
    public static void upsertExample() {
        List<Account> accountList = [SELECT BillingCity
                                    FROM Account
                                    WHERE BillingCity = 'San Francisco'];
        // for (Integer i = 0; i < accountList.size(); i++) {
        // accountList[i].BillingCity = '';
        // }
        
        for (Account a : accountList) {
            a.BillingCity = 'Mumbai';
        } // end for
        
        Account a = new Account (Name = 'Acme2', BillingCity = 'San Francisco');
        accountList.add(a);
        
        try {
         	upsert accountList;   
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
    }// end upsertExample
    
    /*
     * Only available for lead, contact, or account records.
     * You can merge up to three records of the same sObject type.
     * The merge operation merges up to three records into one of the records,
     * deletes the others, and reparents any related records.
     * 
     * */
    public static void mergeExample() {
        // Insert new accounts
        List<Account> ls = new List<Account> {new Account(Name = 'Dunkin Inc.'),
            								  new Account(Name = 'Dunkin')};
        insert ls;
        
        // Queries to get the inserted accounts
        Account masterAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin Inc.' LIMIT 1];
        Account mergeAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin' LIMIT 1];
        
        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName = 'Gabriel', LastName = 'Nypaver');
        c.AccountId = mergeAccount.Id;
        insert c;
        
        Account[] result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('Before merge: ' + result);
        
        try {
            merge masterAccount mergeAccount;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
        Account[] res = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('Before merge: ' + res);
        
    }// end mergeExample
    
    /*
     * You can delete records using the delete operation
     * Deleted records are not deleted permanently from Salesforce, but they are
     * placed in the Recycle Bin for 15 days form where they can be restored.
     * 
     * */
    public static void deleteExample() {
        insert new Account(Name = 'DotCom');
        Account[] doomedAccounts = [SELECT Name FROM Account WHERE name = 'DotCom'];
        System.debug('Doomed Accounts' + doomedAccounts);
        
        try {
            delete doomedAccounts;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        System.debug('Doomed Accounts: ' + [SELECT Name FROM Account WHERE name = 'DotCom']);
    }// end deleteExample
    
    public static void undeleteExample() {
        // SOQL statements can use the ALL ROWS keywords to query all records in an organization,
        // including deleted records and archived activities.
        // You can use ALL ROWS to query records in your org's Recycle Bin.
        // You CANNOT use the ALL ROWS keywords with the FOR UPDATE keywords.
        Account [] savedAccounts = [SELECT Name FROM Account WHERE name = 'DotCom' ALL ROWS];
        System.debug('Saved Accounts: ' + savedAccounts);
        
        try {
            undelete savedAccounts;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }// end try/catch
        
		System.debug('Saved Accounts: ' + [SELECT Name FROM Account WHERE name = 'DotCom']);
    }// end undeleteExample
    
    public static void queryForLoop() {
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for (Account a : accountList) {
            System.debug('a: ' + a);
        }// end for
        
        // This for loop saves memory, records not stored in memory.
        // Use if you don't plan to use the list of sObjects outside of the for loop.
        for (Account a : [SELECT Id, Name FROM Account LIMIT 5]) {
            System.debug('a: ' + a);
        }// end for
    }// end queryForLoop
    
    public static void dataBaseClass() {
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Acme1'));
        accList.add(new Account(Name = 'Acme3'));
        accList.add(new Account());
        
        /*try {
            
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }// end try/catch*/
		
        // DML Statement using Database Class
        Database.SaveResult[] srList = Database.insert(accList, false);
        
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            } else {
                //Operation failed, so get all errors
                for (Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occured.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Accounts fields that affected this error: ' + err.getFields());
                }
            }
        }
        
    }// end dataBaseClass
    
}// end DMLExamples