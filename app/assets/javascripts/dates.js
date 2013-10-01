$(function() {
  $( ".datepicker" ).datepicker({
    numberOfMonths: 3,
    showButtonPanel: false,
    dateFormat: "yy-mm-dd"
  });

  $( ".departure_date" ).each(function(){
  	$(this).datepicker({
  	    numberOfMonths: 3,
  	    showButtonPanel: false,
  	    dateFormat: "yy-mm-dd"
  	});
  });

  $( ".arrival_date" ).each(function(){
    $(this).datepicker({
        numberOfMonths: 3,
        showButtonPanel: false,
        dateFormat: "yy-mm-dd"
    });
  });
});

// $(document).on("change", "input.departure_date", function(){
//  $("input.departure_date").each(function(){
//    var get_departure_date = $(this).val();
//    var listElements = $( "input").hasClass(".arrival_date");
//    if(get_departure_date == "") {
//      $(this).closest(listElements).datepicker({
//        numberOfMonths: 3,
//        showButtonPanel: false,
//        dateFormat: "yy-mm-dd"
//      });
//    } else {
//      $(this).closest(".arrival_date").datepicker({
//        numberOfMonths: 3,
//        showButtonPanel: false,
//        dateFormat: "yy-mm-dd"
//      });
//    }
//  });
// });

// $( ".arrival_date" ).each(function(){
//  var get_closest_date = 
//  $(this).datepicker({
//      numberOfMonths: 3,
//      showButtonPanel: false,
//      dateFormat: "yy-mm-dd"
//  });
// });