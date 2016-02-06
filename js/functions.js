$(document).ready(function(){
    
    window.setInterval(bug, 100);
    
    var total_width = $(window).width();
    
    function bug(){
        var scroll = $(window).scrollTop();
            if(scroll < 20){ 
                $('#logo2').hide();
                $('#b2').hide();
                $('#scrollup').hide();
            }
    }
    
    function scroller(){
    var scroll = $(window).scrollTop();
            if (scroll >= 20){
                $('#subheader').css("margin-top", "0px");
                $('#subheader').css("height", "50px");
                $('.sizable').css("height", "40px");
                $('.sizable').css("padding-top", "5px");
                $('.borde').css("height", "50px");
                $('#scrollup').fadeIn(500);
                $('#logo2').fadeIn(500);
                if(movido){
                    $('#searchc').animate({"margin-right": '-='+input_width}, "slow");
                    $('#usermenu').animate({"margin-right": '-='+input_width}, "slow"); 
                    movido=false;
                }
                if($('#searchheader').is(":visible")){
                    $('#searchheader').css("margin-top", "50px");
                    $('#content').css("margin-top", "190px")
                }
            }else{
                $('#subheader').css("margin-top", "90px");
                $('#subheader').css("height", "35px");
                $('.sizable').css("height", "30px");
                $('.sizable').css("padding-top", "0px");
                $('.borde').css("height", "35px");
                $('#scrollup').hide();
                $('#logo2').hide();
                $('#acs').hide();
                if($('#searchheader').is(":visible")){
                    $('#searchheader').css("margin-top", "125px");
                    $('#content').css("margin-top", "160px")
                }                
            }
    }
    
    function mobile(){
        var total_width = $(window).width();
        if(total_width<1034){
            $('#lupa').hide();
            $('#rayas').hide();
            $('#nombre').hide();
            $('#date').hide();
            $('#subheader').hide();
            $('#dmenu').show();
            $('#header').css("position", "fixed");
            $('#usr').css("margin-top", "0px");
            $('#usr').css("margin-right", "18px");
            $('#header').css("height", "90px");
            $('#logo').css("height", "30px");
            $('#content').css("margin-top", "80px");
            $('#limage').css("margin-left", "-50px");
            $('#usermenu').css("margin-left", "-10px");
            $('#tri2').css("margin-right", "-60px");
            if(movido){
                    $('#searchc').animate({"margin-right": '-='+input_width}, "slow");
                    $('#usermenu').animate({"margin-right": '-='+input_width}, "slow"); 
                    movido=false;
            }
        }else{
            $('#usr').css("margin-top", "0px");
            $('#usr').css("margin-right", "10px");
            $('#lupa').show();
            $('#rayas').show();
            $('#nombre').show();
            $('#date').show();
            $('#subheader').show();
            $('#dmenu').hide();
            $('#header').css("position", "absolute");
            $('#header').css("height", "90px");
            $('#logo').css("height", "40px");
            $('#content').css("margin-top", "130px");
            $('#usermenu').css("margin-left", "0px");
            $('#tri2').css("margin-right", "0px");
            $('#limage').css("margin-left", "0px");
        }
    }
    
    function searchf(){
        if($('#searchheader').is(":hidden")){
            $('#searchheader').show();
            $('#content').css("margin-top", "160px");
        }else{
            $('#searchheader').hide();
            $('#content').css("margin-top", "130px");
        }
    }
    
    $('#scrollup').hide();
    $('#logo2').hide();
    $('#usermenu').hide();
    $('#dmenu').hide();
    $('#searchheader').hide();
    
    var movido = false;
    
    var input_width = $('#big').width()+70;
    
    function animateBk(id, color){
        $(id).css("background-color", color);
        $(id).css("color", "white");
    }
    
    function animateBki(id){
        $(id).css("background-color", "white");
        $(id).css("color", "black");
    }
    
    $(window).scroll(function () {
        var total_width = $(window).width();
        var scroll = $(window).scrollTop();
        if (scroll >= 20)   $("#scrollup").show();
        if(total_width>1035){
           scroller();
        }
    });
    
    $('#lupa').click(function(){
        searchf();
    });
    
    mobile();
    
	$('#exit').mouseover(function () {
        this.src = 'images/exit2.svg';
    });
    
	$('#exit').mouseout(function () {
        this.src = 'images/exit1.svg';
    });

    $('#1').mouseover(function(){animateBk('#1', "#5F64B7");});
    $('#2').mouseover(function(){animateBk('#2', "#68B4FA");});
    $('#3').mouseover(function(){animateBk('#3', "#C53139");});
    $('#4').mouseover(function(){animateBk('#4', "green");});
    $('#5').mouseover(function(){animateBk('#5', "#EF8B13");});
    $('#6').mouseover(function(){animateBk('#6', "#52206E");});
    
    $('#1').mouseout(function(){animateBki('#1');});
    $('#2').mouseout(function(){animateBki('#2');});
    $('#3').mouseout(function(){animateBki('#3');});
    $('#4').mouseout(function(){animateBki('#4');});
    $('#5').mouseout(function(){animateBki('#5');});
    $('#6').mouseout(function(){animateBki('#6');});
    
    $('#exit').click(function(){
        $('#searchc').animate({"margin-right": '-='+input_width}, "slow");
        if(movido){
            $('#usermenu').animate({"margin-right": '-='+input_width}, "slow");
        }
        movido = false;
    });

    $('#usr').click(function(){
        if($('#usermenu').is(":visible")){
            $('#usermenu').hide();
        }else{
            $('#usermenu').show();
        }
    });
    
    $("#scrollup").click(function() {
        $('html, body').animate({
            scrollTop: $("#target").offset().top}, 2000);
    });
    
    $( window ).resize(function() {
        var total_width = $(window).width();
        scroller();
        mobile();
    });
});