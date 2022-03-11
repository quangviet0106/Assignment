/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function paggerManager(id, pageindex, totalpage,gap)
{
    var container = document.getElementById(id);
    var result1 = '';
    //generate first
    if(pageindex - gap > 1)
        result1 +='<a href="manager?page=1">First</a>';
    
    for(var i = pageindex - gap; i < pageindex ; i++)
    {
        if(i >=1)
        {
            result1 +='<a href="manager?page='+i+'">'+i+'</a>';
        }
    }
    
    // generate span for pageindex
    
        result1 += '<span>'+pageindex+'</span>';
    
    
    
    
    for(var i = pageindex +1; i <= pageindex+gap ; i++)
    {
        if(i <= totalpage)
        {
            result1 +='<a href="manager?page='+i+'">'+i+'</a>';
        }
    }
    
    //generate last
    if(pageindex + gap < totalpage)
        result1 +='<a href="manager?page='+totalpage+'">Last</a>';
    
    container.innerHTML = result1;
}

