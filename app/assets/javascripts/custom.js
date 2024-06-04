var select2Init = function() {
  $( "#postProjectForm .category-select2-dropdown" ).select2({
    placeholder: 'category',
    allowClear: true
  });

  $( "#postProjectForm .skills-select2-dropdown" ).select2({
    placeholder: 'skills',
    allowClear: true,
    tags: true
  });

}
var togglePriceFieldsInProjectForm = function() {
  $('#postProjectForm input[name="price_type"]').change(function() {
    if ($('#postProjectForm #total_price').is(':checked')) {
      $('#postProjectForm #totalPriceFieldsSec').removeClass('d-none');
      $('#postProjectForm #perHourPriceFieldsSec').addClass('d-none');
    } else if ($('#postProjectForm #per_hour_price').is(':checked')) {
      $('#postProjectForm #perHourPriceFieldsSec').removeClass('d-none');
      $('#postProjectForm #totalPriceFieldsSec').addClass('d-none');
    }
  });
}

$(document).ready(function(){
  select2Init()
  togglePriceFieldsInProjectForm()
})
