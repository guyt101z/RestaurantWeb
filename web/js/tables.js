/**
 * Created by JetBrains PhpStorm.
 * User: Croco
 * Date: 6/20/12
 * Time: 1:47 AM
 * To change this template use File | Settings | File Templates.
 */


var theHandle = document.getElementById("title1");
var theRoot = document.getElementById("table1");
Drag.init(theHandle, theRoot);

theHandle = document.getElementById("title2");
theRoot = document.getElementById("table2");
Drag.init(theHandle, theRoot);

$(function(){
    $('.table').click(function(){
       $(this).next().fadeIn(500);
    });

    $('.close').click(function(){
        $(this).parents('.orderWrapper').fadeOut(300);
    });
});