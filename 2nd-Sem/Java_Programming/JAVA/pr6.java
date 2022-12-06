import java.sql.Struct;
import java.util.Scanner;

class emp{
    private int eno;
    private String ename,desig;
    private double sal;
    emp(int en,String enm,String d,double s)
    {
        this.eno=en;
        this.ename=enm;
        this.desig=d;
        this.sal=s;
    }
    public void printData(){
        System.out.println(eno+"\t"+ename+"\t"+desig+"\t"+sal);
    }
}
public class pr6 {
    public static void main(String[] args) {
        int i;
        emp []e=new emp[3];
        Scanner ob=new Scanner(System.in);
        for(i=0;i<2;i++){
            int en=ob.nextInt();
            String enm=ob.next();
            String d=ob.next();
            Double s=ob.nextDouble();
            e[i]=new emp(en, enm, d, s);
        }
        for(i=0;i<2;i++){
            e[i].printData();
        }
    }
}