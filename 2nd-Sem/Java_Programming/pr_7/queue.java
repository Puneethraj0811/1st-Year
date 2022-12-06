import java.util.Scanner;

class QueueException extends Exception{
    public void Err(){
        System.out.println("Queue is full");
    }
}
class queue1{
    int front,rear,q[];
    queue1(int n){
        front=rear=-1;
        q=new int[n];
    }
    void insert(int ele) throws QueueException{
        if(rear==q.length-1){
            throw new QueueException();
        }
        if(front==-1)
        front=rear=0;
        else
        rear+=1;
        q[rear]=ele;
    }
    int delete(){
        int ele;
        if(front==-1){
            throw new ArrayIndexOutOfBoundsException();
        }
        if(front==rear){
            ele=q[front];
            rear=front-1;
        }
        else{
            ele=q[front++];
        }
        return ele;
    }
    void display(){
        if(front==-1){
            System.out.println("Queue is empty");
            return;
        }
        System.out.println("Queue elements are:");
        for(int i=front;i<=rear;i++){
            System.out.println(q[i]+" ");
        }
    }
}
public class queue {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of the queue");
        int size=sc.nextInt();
        queue1 q1=new queue1(size);
        boolean loop=true;
        try{
            while(loop){
                System.out.println("1.Insert\n2.Delete\n3.Display\n4.Exit");
                System.out.println("Enter your choice");
                int ch=sc.nextInt();
                switch(ch){
                    case 1: System.out.println("Enter the element to insert");
                            q1.insert(sc.nextInt());
                            break;
                    case 2: System.out.println("Deleted item is="+q1.delete());
                            break;
                    case 3: q1.display();
                            break;
                    case 4: loop=false;
                            break;
                    default:System.out.println("Invalid choice");
                            return;
                }
            }
        }
        catch(QueueException exc){
            exc.Err();
        }
        catch(ArrayIndexOutOfBoundsException exc){
            System.out.println("Queue is Empty");
        }
    }
}