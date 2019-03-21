public class CheckGrade {

    public static void createNewGrades(List<ClassEnrollment__c> newClassEnrollment) {
            
        System.debug('createNewGrades is starting');
        
        // Select Classes and Assessments
        List<Class__c> classes = [SELECT id FROM Class__c];
        
        List<Assessment__c> assessment = [SELECT id, Class__c From Assessment__c];
        
        List<Grade__c> grades = new List<Grade__c>();

        // Loop through Classes, looking for matches to Class__c in ClassEnrollment
        // Loop through Assessments, looking for Class__c in classes
        for(ClassEnrollment__c classEnroll : newClassEnrollment) {
            for(Class__c cl : classes) {
                
                // Check if classEnroll.Class__c is equal to cl.Name
                if(classEnroll.Class__c == cl.id) {
                
                for(Assessment__c assess : assessment) {
                    
                    if(assess.Class__c == cl.id) {
                        
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
        
        /*
         * Not used, Failed first attempt.
         * DO NOT UNCOMMENT! 
         * */
        // Get all Grades where Enrollment lookup equals classEnrollment
        /*List<Grade__c> newGradeList = new List<Grade__c>();
        
        for(Grade__c nullGrade : [SELECT ClassEnrollment__c, Grade__c
                       FROM Grade__c
                       WHERE Grade__c = null]) {
            
            newGradeList.add(nullGrade);
            
        }// end for
        
        // Update any null Grade fields
        for(Grade__c updateGrades : newGradeList) {
            
            updateGrades.Grade__c = 0;
            
        }// end for
        
        //upsert new Grades
        upsert newGradeList;
        
        System.debug('checkingLookup is ending');*/
        /*
         * End failed first attempt.
         * DO NOT UNCOMMENT!
         * */
        
        System.debug('createNewGrades is ending');
        
    }// end checkGrades
    
}// end CheckGrade