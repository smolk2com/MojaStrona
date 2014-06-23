$(function(){
  $('.datatable').dataTable({
	"sPaginationType": "bootstrap"
  });
  $('.wysihtml5').ready(function(i, elem) {
  	$(elem).wysihtml5();
  });
})
