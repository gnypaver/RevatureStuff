public abstract class Rectangle extends Shape {
    public Integer height {
        get;
        set;
    }
    public Integer width { 
        get;
        set;
    }
    
    //Constructors
    public Rectangle() {
        setNumberOfSides(4);
    }// end Default Rectangle Constructor
    
    public Rectangle(Integer height, Integer width) {
        this.height = height;
        this.width = width;
        setNumberOfSides(4);
    }// end Rectangle Constructor
    
    public void draw() {
        System.debug('Drawing a rectangle with width: ' + width + ' and height: ' + height);
    }
    
    public Integer calculatableArea (){
        return width * height;
    }
    
    public Integer calculatablePerimeter() {
        return 2* (width + height);
    }
    
}// end Rectangle