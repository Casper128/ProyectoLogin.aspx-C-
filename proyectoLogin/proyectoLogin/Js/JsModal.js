$(document).ready(function () {
    //Esconder footer del modal

    $("#nav-profile-tab-2").click(function () {
        $(".footer-2").toggleClass("d-none", true);
    });

    $(".desactiveOff").click(function () {
        $(".footer-2").toggleClass("d-none", false);
    });
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();
    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function () {
        if (this.checked) {
            checkbox.each(function () {
                this.checked = true;
            });
        } else {
            checkbox.each(function () {
                this.checked = false;
            });
        }
    });
    checkbox.click(function () {
        if (!this.checked) {
            $("#selectAll").prop("checked", false);
        }
    });
});

