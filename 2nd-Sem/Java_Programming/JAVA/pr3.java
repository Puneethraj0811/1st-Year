import java.util.Scanner;

public class pr3 {
    public static void main(String[] args) {
        int []a;
        int i;
        a=new int[3];
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter array values");
        for(i=0;i<5;i++)
        a[i]=sc.nextInt();
        System.out.println("Array values:");
        for(i=0;i<3;i++)
        System.out.println(a[i]);
    }
}
