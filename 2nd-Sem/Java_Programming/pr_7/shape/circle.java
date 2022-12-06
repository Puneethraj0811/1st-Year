package shape;

public class circle {
    Double radius;
    public void getData(Double temp){
        radius=temp;
    }
    public double area(){
        return (3.1428*radius*radius);
    }
}
