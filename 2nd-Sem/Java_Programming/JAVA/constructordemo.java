

class CONS_OVER
{
    double l;
    double b;
    double h;
    

CONS_OVER(Double l,Double b,Double h)
{
    this.l=l;
    this.b=b;
    this.h=h;
}

CONS_OVER(Double l)
{
    this.l=b=h=l;
    
}
double volume()
{
    return l*b*h;
}

void print()
{
    System.out.println("method overloaded");
}
void print(double v)
{
    System.out.printf("VOLUME OF BOX="+v);
}
}

public class constructordemo {
 public static void main(String[] args) {
    CONS_OVER cuboid=new CONS_OVER(10.0,20.0,30.0);
    CONS_OVER cube=new CONS_OVER(4.0);
    double v1=cuboid.volume();
    double v2=cube.volume();
    cuboid.print();
    cube.print();
    cuboid.print(v1);
    cube.print(v2);

        
    }

}    

