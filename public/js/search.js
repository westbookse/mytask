$(window).on("scroll",function(){
  var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
  if(scrollTop>=200)
    toTop.style.display="block";
  else  
    toTop.style.display="none";
})


