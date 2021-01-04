// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// jquery datepicker - used in coordinator edit applicant form 
$(function() {
	$("input#applicant_date_due").datepicker({dateFormat: 'D, M dd yy'});
	$("input#teacher_recommendation_date_submitted").datepicker({dateFormat: 'D, M dd yy'});
});

// Function to make sort and search ajax on applicant index page
$(function() {
	$(document).on("click","#applicants_ajax_table th a", function() {
	  $.getScript(this.href);
	  return false;
	});
	$(document).keyup("#applicants_search input", function() {
		$.get($("#applicants_search").attr("action"), $("#applicants_search").serialize(), null, "script");
		return false;
	});
});

// Hides search button on applicant index page
$(function() {
	$("#search_button").hide();
})

// show track descriptions on mouseover
$(function() {
	$(document).ready(function() {
	    $('#tracks').hover(function() {
	        $('#trackdescription').show();
	    }, function() {
	        $('#trackdescription').hide();
	    });
	});
});

$(function() {
    $("#applicant_form select").bind("change", function() { 
        if ($("#schoolchoice :selected").text() === "Bassett High School" ||
			$("#schoolchoice :selected").text() === "Magna Vista High School"||
			$("#schoolchoice :selected").text() === "Martinsville High School" ||
			$("#schoolchoice :selected").text() === "Carlisle School") {
		           $("#applicant_track_engineering").attr('checked', false);
		 		   $("#applicant_track_engineering").attr('disabled', false);
		 		   $("#applicant_track_technology").attr('disabled', false);
        } else {
           $("#applicant_track_engineering").attr('checked', true);
		   $("#applicant_track_engineering").attr('disabled', true);
		   $("#applicant_track_technology").attr('disabled', true);
        }
    });
});

// Copy to clipboard
document.addEventListener('turbolinks:load', () => {
  document.querySelector('#clipButton').addEventListener('click', function() {
    document.querySelector('#clipMe').select();

    var succeed;
    try {
      succeed = document.execCommand('copy');
    } catch (e) {
      succeed = false;
    }

    if(succeed) {
      document.querySelector('#copyMsg').style.visibility = 'visible';
    }
  });
});
