public class PostToChatterContact {
    
    public static void postChatterContact(List<Contact> newContacts) {
    	    
        System.debug('postChatterContact is starting');
        
        for(Contact c : newContacts) {
            
            if(c.email == null) {
                
                System.debug('Contact with last name: ' + c.LastName + ' did not have an email specified');
                
            } else {
                
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), 
                                                                                             c.id, 
                                                                                             ConnectApi.FeedElementType.FeedItem, 
                                                                                             'Email this person!');
                
            }// end if/else
            
        }// end for
        
        System.debug('postChatterContact is ending');
        
    }// end postChatterContact
    
}// end PostToChatterContact