const hamburger = document.getElementsByClassName("burger")[0]
hamburger.addEventListener('click', function () {
    const sidebar = document.getElementsByClassName("sidebar")[0]
    const content = document.getElementsByClassName("content")[0]
    sidebar.classList.toggle("collapse")
    content.classList.toggle("full-width")
})

const home =document.getElementsByClassName("menu")[0].firstElementChild;
home.addEventListener('click', function (){
    window.location.href = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2))+
        "/crm/dashboard"
})
