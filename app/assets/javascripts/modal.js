$(document).ready(function(){
   $('.col-lg-2 img').click(function(e){
   		e.preventDefault();
      var src = $(this).parent().attr('href');
      $('#modal-container').fadeIn();
      $('#modal').css('background-image','url("' + src + '")');
   });

   // $('#modal').click(function(e){
   // 		e.stopPropagation();
   // });

   $('#modal-container').click(function(e){
   		$('#modal-container').fadeOut();
   });

   $(document).keyup(function(e) {
  	if (e.keyCode == 27) { $('#modal-container').fadeOut(); }   // esc
	});
})