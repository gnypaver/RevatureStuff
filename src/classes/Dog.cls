public abstract class Dog extends Animal {
    //public override void sound() {
    //    System.debug('Bark');
    //}
    
    public override abstract void sound();
    
    // Concreate method
    public void wagsTail() {
        System.debug('Wags tail');
    }
}