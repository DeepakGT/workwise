class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :linkedin]

  has_one_attached :profile_picture

  has_many :saved_items
  has_many :saved_projects, -> { where(item_type: :Project) }, class_name: :SavedItem

  has_many :likes
  has_many :liked_projects, through: :likes, source: :likeable, source_type: 'Project'

  has_many :views

  has_many :feedbacks, as: :feedbackable

  # Followers
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  # Followings
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :following_relationships, source: :following

  has_one_attached :profile_picture
  has_one_attached :profile_picture_banner

  def rating
    self.feedbacks.average(:rating) || 0
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        password: Devise.friendly_token[0,20],
        provider: 'google'
      )
    end
    user
  end

  def self.connect_to_linkedin(auth, signed_in_resource=nil) 
    user = User.where(provider: 'linkedin', email: auth.info.email).first
    if user
      return user 
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user 
        return registered_user 
      else 
        user = User.create(first_name: auth.info.first_name, provider: 'linkedin', uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
      end 
    end 
  end
end
