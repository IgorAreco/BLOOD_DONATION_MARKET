class Donation < ApplicationRecord
  belongs_to :blood
  belongs_to :user
end
