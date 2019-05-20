class Brand < ApplicationRecord
	mount_uploader :logo, LogoUploader
	has_many :products
	validates :name, :description, :logo, :presence => true
	validates :name, uniqueness: true
end
