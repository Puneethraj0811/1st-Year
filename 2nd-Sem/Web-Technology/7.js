function prog()
{
var pb=document.getElementById('pro');
var count=0,i;
var text=document.getElementsByName('frst');
for(i=0;i<text.length;i++)
{
    if(text[i].validity.valid)
    {
        count++;
    }
}
pb.value=count*(100/text.length);

}


