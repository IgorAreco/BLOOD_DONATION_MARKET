class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :donations
  has_many :bloods
  validates :cpf, presence: { if: -> { cnpj.blank? } }
  validates :cnpj, presence: { if: -> { cpf.blank? } }
  validates :address, :name, presence: true
end
