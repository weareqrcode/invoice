import flatpickr from 'flatpickr'; // 別人的函式庫先上面，在放自己的js檔
import $ from "jQuery";
// import '../sweetalert.js';

$(document).on('turbolinks:load', function() {
  $('#start_date').off()
                  .on('click', function() {
                    flatpickr('#start_date', {})
                  });
  $('#end_date').off()
                .on('click', function() {
                  flatpickr('#end_date', {})
                });
})
