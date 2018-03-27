jQuery(document).ready(function (jQuery) {

    jQuery(".nav > li:has(ul)").addClass("drop");
    jQuery(".nav > li.drop > ul").addClass("dropdown");
    jQuery(".nav > li.drop > ul.dropdown ul").addClass("sup-dropdown");
    jQuery(window).on('load', function () {
        "use strict";
        jQuery('#loader').fadeOut(1000);
    });

});