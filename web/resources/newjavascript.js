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
  var user=$(this).find('h5').justtext();
    var date=$(this).find('span').text();
    var time=$(this).find('a').text();
//alert(date);
//alert(user);
 // alert(user);
    //alert(text1);
  //var text=div.textContent;
   // alert(text);
 // var text2=document.getElementsByClassName("received_withd_msg").innerHTML+text;
    alert(time);
    alert(date);
    $("div.received_msg").text(user+" send you a game request for "+date+" at"+time+" ! Read the message: "+text1);
document.getElementById("reply").action ="/seek_play/accept.htm?username="+user;
});

jQuery.fn.justtext = function() {
  
	return $(this)	.clone()
			.children()
			.remove()
			.end()
			.text();

};