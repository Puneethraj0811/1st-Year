import java.util.LinkedList;
import java.util.Scanner;

public class pr11_ll {
    public static void main(String[] args) {
        Character ele;
        int ch,size;
        Scanner sc=new Scanner(System.in);
        LinkedList<Character> ll=new LinkedList<Character>();
        while(true){
            System.out.println("1.INSERT BEGIN\n2.INSERT END\n3.INSERT SPECIFIC\n4.DELETE BEGIN\n5.DELETE END\n6.DELETE SPECIFIC\n7.EXIT");
            System.out.println("Enter your choice");
            ch=sc.nextInt();
            switch(ch){
                case 1: System.out.println("Enter the character to insert");
                        ele=sc.next().charAt(0);
                        ll.addFirst(ele);
                        System.out.println(ll);
                        break;
                case 2: System.out.println("Enter the character to insert");
                        ele=sc.next().charAt(0);
                        ll.addLast(ele);
                        System.out.println(ll);
                        break;
                case 3: System.out.println("Enter the character to insert");
                        ele=sc.next().charAt(0);
                        System.out.println("Enter the position");
                        ll.add(sc.nextInt()-1,ele);
                        System.out.println(ll);
                        break;
                case 4: if(!ll.isEmpty()){
                            ll.removeFirst();
                            System.out.println("Element removed");
                            System.out.println(ll);
                        }
                        else{
                            System.out.println("Lit is Empty");
                        }
                        break;
                case 5: if(!ll.isEmpty()){
                            ll.removeLast();
                            System.out.println("Element removed");
                            System.out.println(ll);
                        }
                        else{
                            System.out.println("Lit is Empty");
                        }
                        break;
                case 6: if(!ll.isEmpty()){
                            System.out.println("Enter the element to remove");
                            ele=sc.next().charAt(0);
                            ll.remove(ele);
                            System.out.println("Element removed");
                            System.out.println(ll);
                        }
                        else{
                            System.out.println("Lit is Empty");
                        }
                        break;
                case 7: System.exit(0);
                default:System.out.println("Enter valid choice");
            }
        }
    }
}
