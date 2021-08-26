class Blood < ApplicationRecord
  BLOOD_TYPE = %w[A+ A- B+ B- AB+ AB- O+ O- De\ Barata Frio Quente Fervendo Azul]
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
