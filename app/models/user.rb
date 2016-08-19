class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :likes


    acts_as_voter
      acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests

  has_many :tags


  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end

   def has_liked?(comment)
    likes.where(comment_id: comment.id).present?
  end
end
end
