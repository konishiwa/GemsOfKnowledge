$(function() {
    /**
     * Display a warning on capslock
     */
    $('.detectCapslocks input').keypress(function(e) {
        // Detect current character & shift key
        var character = e.keyCode ? e.keyCode : e.which;
        var sftKey = e.shiftKey ? e.shiftKey : ((character == 16) ? true : false);
        // Is caps lock on?
        isCapsLock = (((character >= 65 && character <= 90) && !sftKey) || ((character >= 97 && character <= 122) && sftKey));
        // Display warning and set css

        if (isCapsLock == true) {
            var parent = $(this).parent();
            parent.addClass('capslock');
            $('.capsLockMessage').remove();
            parent.append('<div class="capsLockMessage">' + parent.data('message') + '</div>');
        }
        else {
            if($('.capsLockMessage').length)
                $('.capsLockMessage').remove();
        }
    });
});