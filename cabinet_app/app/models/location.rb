class Location < ActiveRecord::Base
  attr_accessible :lat, :lng, :name, :pwd, :address
  validates :lat, presence: true
  validates :lng, presence: true
  validates :name, presence: true
  validates :address, presence: true

  has_and_belongs_to_many :users
end
