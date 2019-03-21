public class DuplicateChecker {
    public static void checkForContactDuplicates(List<Contact> newContacts) {
        
        // Step 1: Extract email from new Contacts
        set<String> newEmailSet = new set<String>();
        
        for(Contact newContact : newContacts) {
            
            if(newContact.email != null) {
                
                newEmailSet.add(newContact.email);
                
            }// end if
            
        }// end for
        
        // Step 2: Find duplicate contact from database
        Map<String, Contact> existingContactMap = new Map<String, Contact>();
        
        for(Contact existingContact : [SELECT id, Name, Email
                       FROM Contact
                       WHERE Email in :newEmailSet]) {
            
            existingContactMap.put(existingContact.email, existingContact);
            
        }// end for
        
        // Step 3: Compare and throw error
        for(Contact newContact : newContacts) {
            
            Contact duplicateContact = existingContactMap.get(newContact.email);
            
            if(duplicateContact != null) {
                
                newContact.addError('ERROR: There is already an Indentical Record: ' + duplicateContact.id);
                
            }// end if
            
        }// end for
        
    }// end checkForContactDuplicates
    
}// end DuplicateChecker