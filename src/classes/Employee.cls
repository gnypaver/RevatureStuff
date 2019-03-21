public virtual class Employee extends Person {
    
    private String Company;
    
    //getters and setters
    public String getCompany() {
        return this.company;
    }// end getCompany
    
    public void setCompany(String company) {
        this.company = company;
    }// end setCompany
        
        //Contructors
    	public Employee () {
            company = '';
        }// end default Employee Constructor
        
        public Employee (String name, String email) {
            setName(name);
            setEmail(email);
            
            this.company = '';
        }// end Employee Constructor
        
        // display method
        public override virtual void display() {
        super.display();
        System.debug('Company: ' + this.company);
    	}// end display

}// end Employee