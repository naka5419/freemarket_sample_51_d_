class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :nickname, presence: true, length: { maximum: 6 }
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :selling_products, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Product"

  # VALID_NAMEKANZI_REGEX = /\A[一-龥]+\z/
  # validates :firstname, format: { with: VALID_NAMEKANZI_REGEX }
  # validates :lastname, format: { with: VALID_NAMEKANZI_REGEX }
  # VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  # validates :firstname_kana, format: { with: VALID_NAMEKANA_REGEX }
  # validates :lastname_kana, format: { with: VALID_NAMEKANA_REGEX }

  # # 空ではないこと
  # validates :firstname, presence: true
  # validates :lastname, presence: true
  # validates :firstname_kana, presence: true
  # validates :lastname_kana, presence: true
  # validates :birthday, presence: true

  # 都道府県
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :sns_credentials, dependent: :destroy

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    # binding.pry

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
      #binding.pry

    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        # binding.pry
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
        # binding.pry
      end
    end
    # binding.pry
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
  end

end
