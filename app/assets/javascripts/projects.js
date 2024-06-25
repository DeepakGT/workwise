var bindClickEventOnLikeButton = function() {
  $('.project-container .like-com a').click(function(event){
    event.preventDefault();

    var $this = $(this);
    var likeable_type = $this.data('likeable_type');
    var likeable_id = $this.data('likeable_id');

    $.ajax({
      url: '/likes/toggle_like_dislike',
      method: 'POST',
      data: {
        likeable_type: likeable_type,
        likeable_id: likeable_id
      },
      success: function(response) {
        if(response.status == 'liked') {
          $this.addClass('active');
          prevLikeount = parseInt($this.parent().find('span').html())
          $this.parent().find('span').html(prevLikeount+1)
        } else {
          $this.removeClass('active');
          prevLikeount = parseInt($this.parent().find('span').html())
          $this.parent().find('span').html(prevLikeount-1)
        }

      }
    });
  });
};

$(document).ready(function(){
  bindClickEventOnLikeButton()
})
