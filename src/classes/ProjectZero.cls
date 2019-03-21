public class ProjectZero extends Employee {
    
    // Fibonacci
    public static Integer fibonacci(Integer input) {
         
        Integer x = 0;
        Integer y = 1;
        Integer result = 1;
        
        if (input == 0) {
            return 0;
        } else {
            for (Integer i = input; i != 1; i--) {
                result = x + y;
                x = y;
                y = result;
            }// end for
            
            return result;
            
        }// end if/else
        
    }// end fibonacci
    
    // Array Sort
    public static List<Integer> sortArray(List<Integer> sortList) {
        
        // Could not figure this one out.
        
        return sortList;
        
    }// end sortArray
    
    // Factorial
    public static Integer factorial(Integer input) {
        
        Integer result = 1;
        
        if (input == 0) {
            
            return 0;
        
        } else {
            
            List<Integer> factorialList = new List<Integer>();
            
            for (Integer i = input; i != 0; i--) {
            
                factorialList.add(i);
            
            }// end for
            
            for (Integer i : factorialList) {
                result *= i;
            }
            
            return result;
            
        }// end if/else
        
    }// end factorial
    
    // Array Rotate Values
    public static List<Integer> rotateLeft(List<Integer> arrayList, Integer input) {
        
        Integer index = arrayList.size() - 1;
        
        if (input >= 1) {
            
            //for loop goes as long as input not equal to 0
            //removes item at 0
            //add removed item at index
            for (Integer i = input; i != 0; --i) {
                
                Integer itemToMove = arrayList.get(0);
                arrayList.remove(0);
                arrayList.add(itemToMove);
                
            }// end for
            
            return arraylist;
            
        } else {
            
            System.debug('Input must be greater than or equal to one.');
            return arrayList;
            
        }// end if/else
        
    }// end rotateLeft
    
    // Compare method made for balencedBrackets
    public static Integer compare (String arrayItem, String bracket, Integer addOrSub) {
            
            if (arrayItem == bracket) {
                return addOrSub;
            } else {
                return 0;
            }// end if/else
            
        }
    
    // Balenced Brackets
    public static boolean balancedBrackets(List<String> arrayList) {
        
        // fields: Integer parentheses, Integer curlyBrace, Integer squareBracket
        Integer parentheses = 0;
        Integer curlyBrace = 0;
        Integer squareBracket = 0;
        // for loop goes through the whole list
        // if bracket open, adds one to the corresponding bracket counter.
        // if bracket closed, subtracts one from the corresponding bracket counter.
        // After loop, if all counters are equal to 0, return true.
        // Else, return false.
        
        for (String b : arrayList) {
            
            parentheses += compare(b, '(', 1);
            parentheses += compare(b, ')', -1);
            curlyBrace += compare(b, '{', 1);
            curlyBrace += compare(b, '}', -1);
            squareBracket += compare(b, '[', 1);
            squareBracket += compare(b, ']', -1);
            
        }// end for
        
        if (parentheses == 0 && curlyBrace == 0 && squareBracket == 0) {
            return true;
        } else {
            return false;
        }// end if/else
        
    }// end balancedBrackets
    
    // Update All Accounts
    public static void updateAccountSize() {
        
        Account[] accountList = [SELECT Name, NumberOfEmployees, Size__c 
                                 FROM Account];
        
        System.debug('Before Update: ' + accountList);
        
        for (Account a : accountList) {
            if (a.NumberOfEmployees >= 1 && a.NumberOfEmployees <= 1000) {
                a.Size__c = 'Small';
            } else if (a.NumberOfEmployees >= 1001 && a.NumberOfEmployees <= 10000) {
                a.Size__c = 'Medium';
            } else if (a.NumberOfEmployees > 10000) {
                a.Size__c = 'Large';
            } else {
                System.debug('No Employees found for ' + a.Name);
            }// end if/else
            
        }// end for
        
        update accountList;
        
        System.debug('After Update: ' + accountList);
        
    }// end updateAccountSize
    
    // Lead Update for Location equal to 'CA'
    public static void updateCALeads() {
        
        // Create a list and insert all leads containing
        // 'CA' in Address.
        Lead[] leadList = [SELECT Name, Address, Status, Description
                          FROM Lead
                          WHERE State LIKE '%ca%'];
        
        System.debug('Before Update: ' + leadList);
        
        // Create a for loop that will go through 
        // the leadList and change Lead Status to
        // 'Closed - Not Converted' and Description to
        // 'We  are no longer doing business in California.'
        for (Lead l : leadList) {
            
            l.Status = 'Closed - Not Converted';
            l.Description = 'We  are no longer doing business in California.';
            
        }// end for
        
            update leadList;
            
            System.debug('After Update: ' + leadList);
        
    }// end updateCALeads
    
    // Check Opportunities Closed Won
    public static void updateOpportunitiesPastClosedDate() {
             
        Opportunity[] opportunityList = [SELECT Name, CloseDate, StageName  
                                        FROM Opportunity
                                        WHERE StageName != 'Closed Won' AND CloseDate < Today];
        
        System.debug('Before Update: ' + opportunityList);
        
        for (Opportunity o : opportunityList) {
            o.StageName = 'Closed Lost';
        }// end if
        
        update opportunityList;
        
        System.debug('After Update: ' + opportunityList);
        
    }// end updateOpportunitiesPastClosedDate
    
} // end ProjectZero