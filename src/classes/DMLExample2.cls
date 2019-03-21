public class DMLExample2 {
    
    public static void insertRecordsExample() {
        
        // Creates the class record and inserts it
        // Gets the class id when done
        List<Class__c> classesToInsert = new List<Class__c>();
     
            Class__c c = new Class__c(Name = 'Class Test for Gabriel Nypaver', ClassSubject__c = 'Math', ClassTopic__c = 'Algebra');
            classesToInsert.add(c);
         try {
            insert classesToInsert;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }// end try/catch
    	Id cId = c.id;
    
        // Creates the assessment record and inserts it
        // Gets the assessment id when done
        List<Assessment__c> assessmentsToInsert = new List<Assessment__c>();
            Assessment__c a = new Assessment__c(Name = 'GeoAssess', Class__c = c.id);
            assessmentsToInsert.add(a);
        try { 
            insert assessmentsToInsert;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }// end try/catch
        
         Id aId = a.id;
        
        
        // Creates the grade record and inserts it
        // Gets the grade id when done
        List<Grade__c> gradesToInsert = new List<Grade__c>();
            Grade__c g = new Grade__c(Grade__c = 90, Assessment__c = aId);
            gradesToInsert.add(g);
        try {
            insert gradesToInsert;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
        // Creates the student record and inserts it
        // Gets the student id when done
        List<Student__c> studentsToInsert = new List<Student__c>();
            Student__c s = new Student__c(Name = 'Me');
            studentsToInsert.add(s);
        try {
            insert studentsToInsert;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
        
        Id sId = s.id;
        
        
        // Creates the classEnrollment record and inserts it
        // Gets the classEnrollment id when done
        List<ClassEnrollment__c> classEnrollmentsToInsert = new List<ClassEnrollment__c>();
            ClassEnrollment__c cE = new ClassEnrollment__c(Class__c = cId, Student__c = sId);
            classEnrollmentsToInsert.add(cE);
        try {
            insert classEnrollmentsToInsert;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
            
        }// end try/catch
    }// end insertRecordsExample
}