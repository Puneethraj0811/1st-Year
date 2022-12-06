package JAVA;

public class StrBuf {
    public static void main(String[] args) {
        StringBuffer sb=new StringBuffer("Hello");
        System.out.println("Buffer="+sb);
        System.out.println("Length="+sb.length());
        System.out.println("Capacity="+sb.capacity());
        System.out.println(sb.charAt(4));
        //sb.setLength(2);
        sb.setCharAt(1,'i');
        System.out.println("Buffer="+sb);
        //System.out.println("Buffer="+sb);
        //System.out.println("Length="+sb.length());
        //System.out.println("Capacity="+sb.capacity());
    } 
}
