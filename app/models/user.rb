class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:twitter, :facebook, :vkontakte]
          
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid

      case user.provider
      when "facebook"
        user.email = auth.info.email
        user.username = auth.info.name
      when "vkontakte"
        user.email = auth.info.email.nil? ? "vk#{auth.uid}@tut.by": auth.info.email
        user.username = auth.info.name
      when "twitter"
        user.email = auth.info.email.nil? ? (auth.info.nickname + '@tut.by') : auth.info.email
        user.username = auth.info.name        
      end
      user.password = Devise.friendly_token[0,20]
    end
  end

   def has_role?(role)
     roles == role
   end

   def roles
     role.user_role.to_sym unless role.nil?
   end

   def as_json(options = {})
    # super(options.merge(include: :user))
    super options.merge(:methods => [:role])
  end
end
