@isTest
public class ProjectZeroTest {
    
    @isTest static void testFibonacci() {
        
        // Single Action - Positive
        System.assertEquals(1, ProjectZero.fibonacci(1));
        System.assertEquals(1, ProjectZero.fibonacci(2));
        System.assertEquals(2, ProjectZero.fibonacci(3));
        System.assertEquals(89, ProjectZero.fibonacci(11));
        System.assertEquals(6765, ProjectZero.fibonacci(20));
        System.assertEquals(196418, ProjectZero.fibonacci(27));
        
        // Single Action - Negative
        System.assertEquals(-1, ProjectZero.fibonacci(-5));
        
    }// end testFibonacci
    
    @isTest static void testSortArray() {
        
        // Single Action - Positive
        List<Integer> unsortedArray = new List<Integer>{2,4,5,1,3,1};
        List<Integer> sortedArray = new List<Integer>{1,1,2,3,4,5};
        List<Integer> returnedArray = ProjectZero.sortArray(unsortedArray);
        
        for(Integer i = 0; i < sortedArray.size(); i++) {
            
            System.assertEquals(sortedArray[i], returnedArray[i]);
            
        }// end for
        
    }// end testSortArray
    
    @isTest static void testFactorial() {
        
        // Single Action - Positive
        System.assertEquals(1, ProjectZero.factorial(1));
        System.assertEquals(0, ProjectZero.factorial(0));
        System.assertEquals(120, ProjectZero.factorial(5));
        
    }// end testFactorial
    
    @isTest static void testRotateLeft() {
        
        // Single Action - Positive
        List<Integer> beforeRotateArray = new List<Integer>{1,2,3,4,5};
        List<Integer> afterRotateArray = new List<Integer>{4,5,1,2,3};
        List<Integer> returnedArray = ProjectZero.rotateLeft(beforeRotateArray, 3);
        
        for(Integer i = 0; i < beforeRotateArray.size(); i++) {
            
            System.assertEquals(afterRotateArray[i], returnedArray[i]);
            
        }// end for
        
    }// end testRotateLeft
    
    @isTest static void testBalancedBrackets() {
        
    }// end testBalancedBrackets
    
    @isTest static void testUpdateAccountSize() {
        
        // Test Signle Action - Positive
        List<Account> accsList = new List<Account>();
        accsList.add(new Account(Name = 'Test12345', NumberOfEmployees = 1));
        accsList.add(new Account(Name = 'Test123456', NumberOfEmployees = 1001));
        accsList.add(new Account(Name = 'Test1234567', NumberOfEmployees = 11000));
        ProjectZero.updateAccountSize();
        
        Account a1 = [SELECT Size__c FROM Account WHERE Name = 'Test12345' LIMIT 1];
        System.assertEquals('Small', a1.Size__c);
        Account a2 = [SELECT Size__c FROM Account WHERE Name = 'Test123456' LIMIT 1];
        System.assertEquals('Medium', a2.Size__c);
        Account a3 = [SELECT Size__c FROM Account WHERE Name = 'Test1234567' LIMIT 1];
        System.assertEquals('Large', a3.Size__c);
        
        // Test Bulk Action - Positive
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account a : accs) {
            
            if(a.numberOfEmployees < 1000) {
                
                System.assertEquals('Small', a.Size__c);
                
            } else if(a.numberOfEmployees > 1000 && a.numberOfEmployees < 10000) {
                
                System.assertEquals('Medium', a.Size__c);
                
            } else {
                
                System.assertEquals('Large', a.Size__c);
                
            }
            
        }// end for
        
    }// end testUpdateAccountSize
    
    @isTest static void testUpdateCALeads() {
        
        // Test Single Action - Positive
        List<Lead> leadList = new List<Lead>();
        leadList.add(new Lead(LastName = 'Mr. Test', Company = 'Test Inc', State = 'CA'));
        leadList.add(new Lead(LastName = 'Mrs. Test', Company = 'Test Inc', State = 'CA'));
        leadList.add(new Lead(LastName = 'Ms. Test', Company = 'Test Inc', State = 'CA'));
        insert leadList;
        ProjectZero.updateCALeads();
        
        Lead l = [SELECT Status, Description FROM Lead WHERE LastName = 'Mr. Test' LIMIT 1];
        System.assertEquals('Closed - Not Converted', l.Status);
        System.assertEquals('We  are no longer doing business in California.', l.Description);
        
        // Test Bulk Action - Positive
        List<Lead> ld = [SELECT Status, Description FROM Lead WHERE LastName = '%Test'];
        for(Lead lead : ld) {
            
            System.assertEquals('Closed - Not Converted', lead.Status);
            System.assertEquals('We  are no longer doing business in California.', lead.Description);
            
        }// end for
        
    }// end testUpdateCALeads
    
    @isTest static void testUpdateOpportunitiesPastClosedDate() {
        
        
        
    }// end testUpdateOpportunitiesPastClosedDate
        
}// end ProjectZeroTest