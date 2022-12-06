package shape;

public class square {
    double side;
    public void getData(Double temp){
        side=temp;
    }
    public double area(){
        return (side*side);
    }
}