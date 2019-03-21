trigger ClassEnrollmentTrigger on ClassEnrollment__c (after insert) {
	
    if(Trigger.isAfter && Trigger.isInsert) {
        
    	CheckGrade.createNewGrades(Trigger.new);
        
    }
    
}// end ClassEnrollmentTrigger