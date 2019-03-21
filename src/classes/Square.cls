public class Square extends Rectangle {
	
    //Constructor
    public Square(Integer sideLength) {
        setHeight(sideLength);
        setWidth(sideLength);
    }
    
    public void setHeight(Integer height) {
        this.height = height;
    }
    
    public void setWidth(Integer width) {
        this.width = width;
    }
}