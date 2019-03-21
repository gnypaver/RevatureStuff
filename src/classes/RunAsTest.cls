@isTest(SeeAllData = true)
public class RunAsTest {

    @isTest Static void viewClasses() {
        
        User u = [SELECT Id FROM User WHERE Id = '0051U000004dcQCQAY'];
        
        List<Class__c> classes = [SELECT Id, Name FROM Class__c];
        System.debug('classes first: ' + classes);
        
        System.runAs(u) {
            
            classes = [SELECT Id, Name FROM Class__c];
            System.debug('classes runAs: ' + classes);
            
        }// end runAs
        
        System.debug('classes Last: ' + classes);
        
    }// end viewClasses
    
}// end RunAsTest