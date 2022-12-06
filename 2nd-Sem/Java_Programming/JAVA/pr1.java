import java.util.Scanner;

public class pr1 {
    public static void main(String[] args) {
        System.out.println("Welcome to JAVA Programming");
        int a;
        double b;
        System.out.println("Enter values for variables");
        Scanner sc=new Scanner(System.in);
        a=sc.nextInt();
        b=sc.nextDouble();
        double c=a+b;
        System.out.println("The result is:"+c);
    }
}
