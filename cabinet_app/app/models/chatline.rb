class Chatline < ActiveRecord::Base
  belongs_to :user
  attr_accessible :message, :email
end
