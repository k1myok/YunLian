function Toast()
{

}

Toast.show = function (msg) {
    $("<div class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><a>" + msg + "</a></div>")
    .css({
        display: "block",
        opacity: 1,
        position: "fixed",
        padding: "5px",
        "text-align": "center",
        width: "270px",
        left: ($(window).width() - 284) / 2,
        top: $(window).height() * 4 / 5
    })
    .appendTo($.mobile.pageContainer).delay(1500)
    .fadeOut(400, function () {
        $(this).remove();
    });
}

