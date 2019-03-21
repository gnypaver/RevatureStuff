trigger AssessmentTrigger on Assessment__c (after insert) {

    if(Trigger.isAfter && Trigger.isInsert) {
        
        CreateGradesForStudents.createNewGradeForStudent(Trigger.new);
        
    }// end if
    
}// end AssessmentTrigger