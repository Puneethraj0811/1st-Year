import java.util.Scanner;

public class pr4 {
    public static void main(String[] args) {
        int i,j,temp,n;
        int a[];
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter array size");
        n=sc.nextInt();
        a=new int[n];
        System.out.println("Enter array elements");
        for(i=0;i<n;i++)
        a[i]=sc.nextInt();
        for(i=0;i<n;i++){
            for(j=0;j<n-i-1;j++){
                if(a[j]>a[j+1]){
                    temp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=temp;
                }
            }
        }
        System.out.println("sorted array is\n");
        for(i=0;i<n;i++)
        System.out.println(a[i]);
    }
}
