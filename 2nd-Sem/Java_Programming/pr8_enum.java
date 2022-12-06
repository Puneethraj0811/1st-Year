/*8. Write a JAVA program to create an enumeration Day of Week with seven values SUNDAY through 
SATURDAY. Add a method isWorkday() to the DayofWeek class that returns true if the value on which 
it is called is MONDAY through FRIDAY. For example, the call DayOfWeek.SUNDAY.isWorkDay () 
returns false.*/

import java.util.Scanner;

enum DayOfWeek{
    MONDAY(1),TUESDAY(2),WEDNESDAY(3),THURSDAY(4),FRIDAY(5),SATURDAY(6),SUNDAY(7);
    public int val;
    DayOfWeek(int val){
        this.val=val;
    }
    Boolean isWorkingDay(){
        if(val<6)
            return true;
        else
            return false;
    }
}
public class pr8_enum{
    public static void main(String[] args) {
        DayOfWeek Day[]=DayOfWeek.values();
        Scanner sc=new Scanner(System.in);
        // System.out.println("Enter the Day of the week");
        // String val=sc.next();
        for (DayOfWeek d : Day) {
            System.out.println(d.isWorkingDay());
        }
    }
}
