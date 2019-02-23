window.onscroll=function(){
    var scrollTop=
        document.documentElement.scrollTop;
    if(scrollTop>=40)
        toTop.style.display="block"
    else
        toTop.style.display="none"
}
