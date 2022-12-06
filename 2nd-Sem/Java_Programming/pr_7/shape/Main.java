/*a. Create a package named shape. 
b. Create some classes in the package representing some common shapes like Square, Triangle, and Circle. 
c. Import and compile these classes in other program.*/

package shape;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        circle cl=new circle();
        square sqr=new square();
        triangle tri=new triangle();
        Scanner sc=new Scanner(System.in);
        while(true){
            System.out.println("1.Circle\n2.Square\n3.Triangle");
            System.out.println("Enter your choice");
            int ch=sc.nextInt();
            switch(ch){
                case 1: System.out.println("Enter the input for circle");
                        Double c=sc.nextDouble();
                        cl.getData(c);
                        System.out.println("The area of Circle is="+cl.area());
                        break;
                case 2: System.out.println("Enter the input for square");
                        Double s=sc.nextDouble();
                        sqr.getData(s);
                        System.out.println("The area of Square is="+sqr.area());
                        break;
                case 3: System.out.println("Enter the input for triangle");
                        Double t1=sc.nextDouble();
                        Double t2=sc.nextDouble();
                        tri.getData(t1, t2);
                        System.out.println("The area of Triangle is="+tri.area());
            }
        }
    }
}
