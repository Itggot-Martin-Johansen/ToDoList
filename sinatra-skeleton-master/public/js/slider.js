function pageLoad()
{
    var menus = document.getElementsByClassName("menu");
    var active = [true, true];

    console.log(menus.length);

    setInterval(function()
    {
        var index = 0;

        for(var i = 0; i < menus.length; i ++)
            if(active[i])
            {
                var menu = menus[i];
                menu.scrollLeft ++;
            }
    }, 10);

    // Set up manually due to unpredictability
    // Only temporary
    menus[0].addEventListener("mouseover", function(event)
    {
        var index = 0;

        active[index] = false;
    });

    menus[1].addEventListener("mouseover", function(event)
    {
        var index = 1;

        active[index] = false;
    });

    document.addEventListener("mouseover", function(event)
    {

    });
}

// Set up page load event
window.onload = pageLoad;