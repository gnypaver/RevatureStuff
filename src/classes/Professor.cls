public class Professor extends Person {
	
    // Properties
    // MUST be public
    public Decimal salary {
        get {
            if (salary == null) {
                salary = 0.0;
            }// end if
            
            // If you specify an implementation for get
            // you MUST provide a return statement.
            return salary;
        }// end get
        
        set {
            // value is a keyword which represents the value a property
            // is being set to.
            if (salary < 0.0) {
                System.debug('You cannot have a negative salary. That\'s called debt.');
            } else {
                salary = value;
            }// end if
            
        }// end set
        
    }// end salary
        
        // Constructors
        /* 
         * This default constructor will automatically call the Person
         * default constructor, setting name and email to empty strings.
         * Likewise, it will set the salary field to 0.0
         * */
    	public Professor() {
            salary = 0.0;
        }// end default Professor Constructor
       
        /*
         * This constructor will call the Person constructor, setting name 
         * to the specified parameter (name).
         * Likewise, it will call the set email method from the 'parent' class
         * setting the email fields.
         * Lastly, it will set salary to a default value.
         * */
        public Professor(String name, String email) {
            super(name);
            setEmail(email);
            
            this.salary = 0.0;
        }// end Professor Constructor
    
    /*
     * The display method calls the Person display method to display
     * the name and email address.
     * Afterwards, the Professor's salary will be dispalyed.
     * */
    public override void display() {
        super.display();
        System.debug('Salary: ' + this.salary);
    }
        
    }// end Professor