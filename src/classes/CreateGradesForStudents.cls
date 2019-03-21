public class CreateGradesForStudents {

    public static void createNewGradeForStudent(List<Assessment__c> newAssessment) {
        
        System.debug('createNewGradeForStudent is starting');
        
        // First, query records for Class__c and ClassEnrollment__c.
        // Store them in lists.
        // Create a list for the new grades
		List<Class__c> classes = [SELECT id FROM Class__c];   
        
        List<ClassEnrollment__c> ce = [SELECT id, Class__c FROM ClassEnrollment__c];
        
        List<Grade__c> grades = new List<Grade__c>();
        
        // Loop through Assessments
        // Loop through Classes, looking for matches to Class__c in Assessments.
        for(Assessment__c assess : newAssessment) {
            for(Class__c cl : classes) {
                
                if(assess.Class__c == cl.id) {
                    
                	// Loop through ClassEnrollments, Looking for matches to Class__c in Classes
                    for(ClassEnrollment__c classEnroll : ce) {
                        
                        if(classEnroll.Class__c == cl.id) {
                        // Create a new grade, referencing assess.Name and 
                        // looking up to classEnroll.Name
                        Grade__c grade = new Grade__c(Assessment__c = assess.id, ClassEnrollment__c = classEnroll.id, Grade__c = 0);
                        
                        // Store grade in a list
                        grades.add(grade);
                            
                        }// end if
                        
                    }// end for
                    
                }// end if
                
            }// end for
            
        }// end for
        
        // Add records
        insert grades;
        
        System.debug('createNewGradeForStudent is ending');
        
    }// end createNewGradeForStudent
        
}// end CreateGradesForStudents