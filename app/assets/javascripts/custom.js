$(document).ready(function(){
  $( "#postProjectForm .category-select2-dropdown" ).select2({
    placeholder: 'category',
    allowClear: true
  });

  $( "#postProjectForm .skills-select2-dropdown" ).select2({
    placeholder: 'skills',
    allowClear: true,
    tags: true
  });
})
