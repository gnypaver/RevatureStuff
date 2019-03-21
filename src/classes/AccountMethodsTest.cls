@isTest
public class AccountMethodsTest {

    /*testSetup static void setup() {
        
        List<Account> accs = new List<Account>();
        
        accs.add(new Account(Name = 'Test1', NumberOfEmployees = 15, NumberOfLocations__c = 1));
        accs.add(new Account(Name = 'Test2', NumberOfEmployees = 1500, NumberOfLocations__c = 4));
        accs.add(new Account(Name = 'Test3', NumberOfEmployees = 15000, NumberOfLocations__c = 12));
        
        insert accs;
        
        TestDataFactory.createTestAccounts(200);
        
    }// end  setup
*/
    
    @isTest(SeeAllData = true)
    static void testUpdateAccountSizeFromNumberOfEmployees() {
        
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        List<Account> accsList = [SELECT Size__c, NumberOfLocations__c FROM Account];
        
        System.debug('accsList: ' + accsList);
        
        for(Account a : accsList) {

            if(a.NumberOfLocations__c > 0 && a.NumberOfLocations__c < 3){

                System.assertEquals('Small', a.Size__c);

            } else if(a.NumberOfLocations__c > 3 && a.NumberOfLocations__c < 6){

                System.assertEquals('Medium', a.Size__c);

            } else {

                System.assertEquals('Large', a.Size__c);

            }// end if/else
         }// end for
        
    }// end testUpdateAccountSizeFromNumberOfEmployees
    
}// end AccountMethodsTest