const hamburger = document.getElementsByClassName("burger")[0]
hamburger.addEventListener('click', function () {
    const sidebar = document.getElementsByClassName("sidebar")[0]
    const content = document.getElementsByClassName("content")[0]
    sidebar.classList.toggle("collapse")
    content.classList.toggle("full-width")
})
