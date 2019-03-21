public class DuplicateGrades {

    public static void checkForGradeDuplicates(List<Grade__c> newGrades) {
        
        // Create a List for Assessments and Grades
        // Store records in them
        List<Assessment__c> assess = [SELECT id
                                     FROM Assessment__c];
        
        List<Grade__c> oldGrades = [SELECT id, classEnrollment__c
                                   FROM Grade__c];
        
        // If ClassEnrollment.id and Assessment.id already exists, Throw an error
        for(Grade__c oldGrade : oldGrades) {
            
            for(Grade__c newGrade : newGrades) {
                
                if(newGrade.ClassEnrollment__c == oldGrade.ClassEnrollment__c && newGrade.Assessment__c == oldGrade.Assessment__c) {
                    
                    newGrade.addError('ERROR: There is already an Indentical Record: ' + newGrade.id);
                    
                }// end if
                
            }// end for
            
        }// end for
        
    }// end checkForGradeDuplicates
    
}// end DuplicateGrades