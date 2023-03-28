class Moto < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :resevations, dependent: :destroy
end
