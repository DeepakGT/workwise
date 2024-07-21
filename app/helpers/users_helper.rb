module UsersHelper
  def profile_picture_url
    if current_user.profile_picture.attached?
      url_for(current_user.profile_picture)
    else
      asset_path('resources/user-pro-img.png')
    end
  end

  def profile_picture_banner_url
    if current_user.profile_picture_banner.attached?
      url_for(current_user.profile_picture_banner)
    else
      asset_path('resources/cover-img.jpg')
    end
  end
end
