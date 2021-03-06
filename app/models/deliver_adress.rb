class DeliverAdress < ApplicationRecord
  belongs_to :user, optional: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  VALID_KANA_REGEX  =                 /\A[ァ-ヶー－]+\z/

  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,         presence: true, format: { with: VALID_KANA_REGEX }
  validates :postcode,                presence: true
  validates :prefecture_code,         presence: true
  validates :city,                    presence: true
  validates :adress1,                 presence: true
  validates :telephone,               uniqueness: true, allow_blank: true
end
