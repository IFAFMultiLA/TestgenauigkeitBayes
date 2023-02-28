/**
 * Extend JQuery with a function to get URL parameters.
 */
$.urlParam = function(name, url) {
    if (!url) {
     url = window.location.href;
    }
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(url);
    if (!results) {
        return undefined;
    }
    return results[1] || undefined;
}


/**
 * Set up the application using the configuration object `config`.
 */
function setup(config) {
    // handling excluding elements by selector
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
    
    // load additional JS files
    config.js.forEach(function(jsfile) {
        console.log("loading additional JS file", jsfile);
        $.getScript("./www/" + jsfile, function() {
            console.log("done loading JS file", jsfile);
        });
    });
    
    // load additional CSS files
    config.css.forEach(function(cssfile) {
        console.log("loading additional CSS file", cssfile);
        $('head').append('<link rel="stylesheet" type="text/css" href="./www/' +  cssfile + '">');
    });
}

/**
 * Global variables
 */

var sess = null;   // session ID

/**
 * Initialize the application when the HTML document was fully loaded.
 */
$(document).ready(function() {
    // get session ID
    if ($.urlParam('sess') !== undefined) {
        sess = $.urlParam('sess');
        console.log("using session ID", sess);
    }
    
    // load config from JSON
    fetch('./www/config.json')
        .then((response) => response.json())
        .then((config) => setup(config));
});