trigger ContactTrigger on Contact (after insert) {
    
    // Use trigger context variables to pinpoint trigger types
    if(Trigger.isAfter && Trigger.isInsert) {
        
    	postToChatterContact.postChatterContact(Trigger.new);
        
    } else if(Trigger.isBefore && Trigger.isInsert) {
        
        DuplicateChecker.checkForContactDuplicates(Trigger.new);
        
    }// end if/else
    
    /*if(Trigger.isBefore) {
        
        if(Trigger.isInsert) {
            // Do Some Stuff
        }
    } else {
        if(Trigger.isInsert) {
            postToChatterContact.postChatterContact(Trigger.new);
        }
    }*/
    
}// end ContactTrigger