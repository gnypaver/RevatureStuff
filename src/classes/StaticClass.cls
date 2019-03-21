public class StaticClass {
	//Fields
	private static Integer numberOfObjectsCreated = 0;
    //Instance method
    private Integer secondNumber = 0;
    
    //Constructor
    public StaticClass() {
        numberOfObjectsCreated++;
        secondNumber++;
    }//end StaticClass Constructor

    public void incrementNumberOfObjectsCreated() {
        numberOfObjectsCreated++;
    }//end incrementNumberOfObjectsCreated
    
    public void incrementSecondNumber() {
        secondNumber++;
   }//end incrementSecondNumber
    
    public Integer getNumberOfObjectsCreated() {
        return numberOfObjectsCreated;
    }//end getNumberOfObjectsCreated
    
    public Integer getSecondNumber() {
        return secondNumber;
    }//end getSecondNumber
}