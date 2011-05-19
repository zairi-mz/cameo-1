// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
  
//Dropdown Start
$(function(){

    $("ul.dropdown li").hover(function(){
    
        $(this).addClass("hover");
        $('ul:first',this).css('visibility', 'visible');
    
    }, function(){
    
        $(this).removeClass("hover");
        $('ul:first',this).css('visibility', 'hidden');
    
    });
    
    $("ul.dropdown li ul li:has(ul)").find("a:first").append(" &raquo; ");

});

//Dropdown End


// commands go here
})
