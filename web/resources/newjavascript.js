

var active = 'active_chat';
var $thumbs = $('.chat_people').click(function(e) {
    e.preventDefault();
    $thumbs.removeClass(active);
    $(this).addClass(active);
});

//var button = document.getElementsByClassName(".chat_people active_chat");

var name = document.getElementsByClassName(".chat_people");
$ (".chat_people" ).click(function() {


    
 var div = this.textContent;
  var text1=  $(this).find('p').text();
  var user=$(this).find('h5').justtext().trim();
    var date=$(this).find('span').text();
    var time=$(this).find('a').text();

    $("div.received_msg").text(user+" send you a game request for "+date+" at"+time+" ! Read the message: "+text1);
document.getElementById("reply").action ="/seek_play/accept.htm?username="+user+"&date="+date+"&time="+time;
//alert(user+"test");
});

jQuery.fn.justtext = function() {
  
	return $(this)	.clone()
			.children()
			.remove()
			.end()
			.text();

};

function myFunction() {
   var mainFrameOne = document.getElementById("test1"); 
   var mainFrameTwo = document.getElementById("test2");

   mainFrameOne.style.display = (
       mainFrameOne.style.display == "none" ? "block" : "none"); 
   mainFrameTwo.style.display = (
       mainFrameTwo.style.display == "none" ? "block" : "none"); 
}
