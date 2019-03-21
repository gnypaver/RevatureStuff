public virtual class Person {

    

    // Fields

    private String name;
    private String email;

    

    

    // Constructors

    

    // Default Constructor

    public Person() {
    
        System.debug('Hello World!');
        
        System.debug('Hello World!');        

        this.name = '';

        this.email = '';

    }//end Default Person Constructor

    

    public Person(String name) {

        this.name = name;

    }//end Person Constructor

    

    // Accessors or Getters

    

    public String getName() {

        // Check if user has permission

        return this.name;

    }//end getName

    

    public String getEmail() {

        // Check if user has permission

        return this.email;

    }//end getEmail

    

    // Mutators or Setters

    public void setName(String name) {

        this.name = name;

    }//end setName

    

    public void setEmail(String email) {

        // We use setters to validate the values we're setting

        this.email = email;

    }//end setEmail

    
    // Marking the method as virtual means it can be overriding,
    // but it doesn't need to be.
    public virtual void display() {

        System.debug('Name: ' + this.name);
        System.debug('Email: ' + this.email);

    }//end display

    

    

}