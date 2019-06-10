class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }

  VALID_NAMEKANZI_REGEX = /\A[一-龥]+\z/
  validates :firstname, format: { with: VALID_NAMEKANZI_REGEX }
  validates :lastname, format: { with: VALID_NAMEKANZI_REGEX }
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :firstname_kana, format: { with: VALID_NAMEKANA_REGEX }
  validates :lastname_kana, format: { with: VALID_NAMEKANA_REGEX }

  # # 空ではないこと
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birthday, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
