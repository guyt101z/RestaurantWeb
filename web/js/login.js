$(function(){
    $('.formFields li').click(function(){
       $(this).find('label').fadeOut(200);
       $(this).find('input').focus();
    });
    $('.formFields input').blur(function(){
        if ($(this).val()=='') {
            $(this).prev().fadeIn(200);
        }
    });
});