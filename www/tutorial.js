function setup(config) {
    config.exclude.forEach(function(selector) {
        // hide element
        $(selector).hide();
        
        // hide main navigation menu item
        $('#tutorial-topic ul li a').each(function() {
            var link = $(this);
            if (link.attr('href') == selector) {
                link.parent().hide();
            }
        });
    });
    
    config.css.forEach(function(cssfile) {
        $('head').append('<link rel="stylesheet" type="text/css" href="./www/' +  cssfile + '">');
    });
}


$(document).ready(function() {
    // load config from JSON
    fetch('./www/config.json')
        .then((response) => response.json())
        .then((config) => setup(config));
});