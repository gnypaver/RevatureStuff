public virtual class Play {
    //Fields
    private String title;
    private String author;
    private String genre;
    
    //Constructors
    public Play(){
        title = '';
        author = '';
        genre = '';
    }//end Default Play Constructor
    
    public Play(String aTitle, String anAuthor, String aGenre) {
        title = aTitle;
        author = anAuthor;
        genre = aGenre;
    }//end Play Constructor
    
    //Methods
    //Mutaturs or Setters
    public void setTitle(String aTitle) {
        title = aTitle;
    }//end setTitle
    
    public void setAuthor(String anAuthor) {
        author = anAuthor;
    }//end setAuthor
    
    public void setGenre(String aGenre) {
        genre = aGenre;
    }//end setGenre
    
    //Accessors or Getters
    public String getTitle() {
        return title;
    }//end getTitle
    
    public String getAuthor() {
        return author;
    }//end getAuthor
    
    public String getGenre() {
        return genre;
    }//end getGenre
    //end setters and getters
    
    public void display(){
        System.debug('Title: ' + title);
        System.debug('Author: ' + author);
        System.debug('Genre: ' + genre);
    }//end display
    
}//end Play