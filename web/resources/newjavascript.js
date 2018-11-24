//
//$(document).ready(function(){  
//$(".chat_list").click(function() {
//    $(this).toggleClass("active_chat");
//});
//});

var active = 'active_chat';
var $thumbs = $('.chat_people').click(function(e) {
    e.preventDefault();
    $thumbs.removeClass(active);
    $(this).addClass(active);
});

//var button = document.getElementsByClassName(".chat_people active_chat");

var name = document.getElementsByClassName(".chat_people");
$ (".chat_people" ).click(function() {

 // var div = this.textContent;
  var text1=  $(this).find('p').text();
    //alert(text1);
  //var text=div.textContent;
   // alert(text);
 // var text2=document.getElementsByClassName("received_withd_msg").innerHTML+text;
    //alert(text2);
    $("div.received_msg").text(text1);

});