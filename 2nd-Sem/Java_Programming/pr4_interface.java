/*. Write a JAVA program to demonstrate Inheritance.
Simple Program on Java for the implementation of Multiple inheritance using interfaces to 
calculate the area of a rectangle and triangle.*/

interface triangle{
    float area_tri(float x,float y);
}
interface rectangle{
    float area_rect(float x,float  y);
}
class area implements triangle,rectangle{
    public float area_tri(float x,float y){
        return((x*y)/2);
    }
    public float area_rect(float x,float y){
        return(x*y);
    }
}
public class pr4_interface {
    public static void main(String[] args) {
        area a=new area();
        System.out.println("Area of Triangle="+a.area_tri(10, 20));
        System.out.println("Area of Rectangle="+a.area_rect(10, 20));
    }
}
