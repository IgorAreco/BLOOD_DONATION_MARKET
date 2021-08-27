class Blood < ApplicationRecord
  BLOOD_TYPE = %w[A+ A- B+ B- AB+ AB- O+ O- De\ Barata Frio Quente Fervendo Azul]

  belongs_to :user
  has_many :donations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true
  validates :blood_type, inclusion: { in: BLOOD_TYPE }
end
