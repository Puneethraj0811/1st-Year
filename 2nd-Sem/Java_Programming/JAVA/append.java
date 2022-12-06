public class append {
    public static void main(String[] args) {
       String s;
       int a=42;
       StringBuffer sb=new StringBuffer(4);
       s=sb.append("a=").append(a).append("!").toString();
       System.out.println(s);
    }
    
}
