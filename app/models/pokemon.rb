class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, presence: true, uniqueness: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

end
