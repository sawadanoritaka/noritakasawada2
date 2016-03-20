class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
has_many :blogs, dependent: :destroy

#【サインアップ時Email重複防止】facebook認証時
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)

   user = User.where(provider: auth.provider, uid: auth.uid).first

unless user
user = User.create(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email:User.create_unique_email, password: Devise.friendly_token[0,20])
end
user

end
#【サインアップ時Email重複防止】twitter認証時
def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  user = User.where(provider: auth.provider, uid: auth.uid).first

unless user
user = User.create(name: auth.info.nickname, provider: auth.provider, uid: auth.uid, email: User.create_unique_email, password: Devise.friendly_token[0,20])
end
user
end

#Twitter認証時のemail用にuuidな文字列を生成する処理を実装する
    def self.create_unique_string
     SecureRandom.uuid
    end
    def self.create_unique_email
     User.create_unique_string + "@example.com"
    end
  def password_required?
    super && provider.blank?
  end
 private
  def user_params
    params.require(:user).permit(:name, :description, :image)
  end

end
