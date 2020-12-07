class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, {presence: true, length: {minimum: 2, maximum: 15}}
  validates :nick_name, {presence: true, length: {minimum: 2, maximum: 15}}
  validates :introduction, {presence: true, length:{maximum:30}}
  validates :email, {presence: true}

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # フォローに関する記述
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得(自分がフォローしてる人)
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得(自分をフォローしてる人)
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人(の一覧)
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人(フォロワーの一覧)

  ## フォローしますというアクション
  def follow(enduser_id)
    follower.create(followed_id: enduser_id)
  end
  # ユーザーのフォローを外すアクション
  def unfollow(enduser_id)
   follower.find_by(followed_id: enduser_id).destroy
  end
  # フォローしていればtrueを返す(フォローしてるユーザーを含みますか？)
  def following?(enduser)
    following_user.include?(enduser)
  end
  
  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: "ゲストさん", nick_name: "ゲストさん", introduction: "よろしくお願いします。", email: 'guest@example.com') do |enduser|
      enduser.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end