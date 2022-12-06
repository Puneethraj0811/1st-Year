package JAVA;
public class append {
    public static void main(String[] args) {
        //StringBuffer sb=new StringBuffer("Hello");
        //sb.append(" World");
        //System.out.println(sb);
        /*String s;
        int a=42;
        StringBuffer sb=new StringBuffer(40);
        s=sb.append("a=").append(a).append("!").toString();
        System.out.println(s);*/
        StringBuffer sb=new StringBuffer("I Java!!");
        sb.insert(2,"Like ");
        System.out.println("After insert="+sb);
        sb.reverse();
        System.out.println(sb);
        sb.delete(3,7);
        System.out.println(sb);
    }
}
