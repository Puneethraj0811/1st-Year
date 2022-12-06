// var a1=parseInt(prompt("Enter a1"));
// var a2=parseInt(prompt("Enter a2"));
// var a3=parseInt(prompt("Enter a3"));
// var a4=parseInt(prompt("Enter a4"));
// var a5=parseInt(prompt("Enter a5"));
// var n=0,lar=0,a=[a1,a2,a3,a4,a5];
// while(n<=5)
// {
//     if(lar<a[n])
//     {
//         lar=a[n];
//     }
//     n++;
    
// }
// document.write("Largest element is "+lar);

var start=parseInt(prompt("Enter the start"));
var end=parseInt(prompt("Enter the end"));
var even_s=0,odd_s=0;
document.write("Even Numbers:<br/>");
for(var i=start;i<=end;i++)
{
    if(i%2==0){
        document.write(" "+i);
        even_s +=i;       
    }
}
document.write(" = "+even_s+"<br/>Odd Numbers:<br/>");
for(var i=start;i<=end;i++)
{
    if(i%2!=0)
    {
        document.write(" "+i);
        odd_s += i; 
    }
}
document.write(" = "+odd_s);