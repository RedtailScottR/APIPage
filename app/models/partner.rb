class Partner < ActiveRecord::Base
  attr_accessible :company, :email, :name, :url
	validates :company, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :name, presence: true, length: { maximum: 50 }
	validates :url, presence: true

end
