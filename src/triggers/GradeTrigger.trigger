trigger GradeTrigger on Grade__c (after insert) {
	
    if(Trigger.isBefore && Trigger.isInsert) {
        
        DuplicateGrades.checkForGradeDuplicates(Trigger.new);
        
    }// end if
    
}// end GradeTrigger