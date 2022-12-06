public class string_buffer {
    public static void main(String[] args) {
       StringBuffer sb=new StringBuffer("welcome") ;
        
       System.out.println("buffer before="+sb);
       System.out.println("charAt(1) before="+sb.capacity());
       System.out.println("charAt(1) before="+
       sb.charAt(1));
       sb.setCharAt(1, 'i');
       sb.setLength(2);
       System.out.println("buffer after="+sb);
    
      
       System.out.println("charAt(1) after="+sb.charAt(1));

System.out.println("charAt(1) after="+sb.capacity());
    }
}
