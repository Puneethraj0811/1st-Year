import java.util.Scanner;

class student{
    private int USN;
    private String Name;
    student(int u,String N){
        this.USN=u;
        this.Name=N;
    }
    public void printData(){
        System.out.println(USN+"\t"+Name);
    }
}
public class pr5 {
    public static void main(String[] args) {
        //student s=new student(101, "X");
        //s.printData();
        int i;
        student [] s=new student[3];
        Scanner obj=new Scanner(System.in);
        for(i=0;i<3;i++){
            int u=obj.nextInt();
            String n=obj.next();
            s[i]=new student(u, n);
        }
        for(i=0;i<3;i++){
            s[i].printData();
        }


       
    }
}