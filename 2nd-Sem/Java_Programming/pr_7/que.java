/*7. Write a JAVA program to implement a Queue using user defined Exception Handling (also make 
use of throw, throws).*/

import java.util.*;

class QueueException extends Throwable {
    public void Error() {
        System.out.println("Queue is full");
    }
}

class Queues {
    int front = -1;
    int rear = -1;
    int q[];
    Queues(int size) {
        q = new int[size];
    }
    void insert(int ele) throws QueueException {
        if (rear == q.length - 1) {
            throw new QueueException();
        }
        if (front == -1) {
            front = 0;
        }
        q[++rear] = ele;
    }

    int delete() {
        int ele;
        if (front == -1) {
            throw new ArrayIndexOutOfBoundsException();
        }
        if (front == rear) {
            ele = q[front];
            front = rear = -1;
        } else {
            ele = q[front++];
        }
        return ele;
    }

    void display() {
        if (front == -1) {
            System.out.println("Queue is Empty");
            return;
        }
        for (int i = front; i <= rear; i++) {
            System.out.print(q[i] + "\t");
        }
        System.out.println();
    }
}

class que {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the size of the queue");
        int size = scanner.nextInt();
        Queues obj = new Queues(size);
        while (true) {
        System.out.println("1.Insert\n2.Delte\n3.Display\n4.Exit");
        System.out.println("Enter your choice");
        int choice = scanner.nextInt();
        try {
        switch (choice) {
            case 1 :
                System.out.println("Enter the element to be inserted:");
                obj.insert(scanner.nextInt());
                break;
            case 2 :
                System.out.println("Removed Element is:" + obj.delete());
                break;
            case 3 :
                obj.display();
                break;
            case 4 :
                System.exit(0);
                break;
        }
        } catch (QueueException e) {
            e.Error();
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Queue is Empty");
        }
        }
    }
}
