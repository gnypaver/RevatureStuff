public class Associate extends Employee {
    
    // Employee Object
    Employee trainer = new Employee();
    
    // Fields
    private String trainingTrack;
    
    // Getters
    public String getTrainingTrack() {
        return this.trainingTrack;
    }
    
    // Setters
    public void setTrainingTrack(String trainingTrack) {
        this.trainingTrack = trainingTrack;
    }
    
    // Constructors
    public Associate() {
        trainingTrack = '';
    }
    
    public Associate(String associateName, String associateEmail, 
                     Employee trainer) {
        setName(associateName);
        setEmail(associateEmail);
        this.trainer = trainer;
    }
    
    public override void display() {
        System.debug('Associate Information');
        super.display();
        System.debug('Training Track: ' + this.trainingTrack);
        System.debug('Trainer Information');
        trainer.display();
    }

}