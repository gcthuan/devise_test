class Question < ActiveRecord::Base
	validates :name, presence: true
	has_many :packagations
	has_many :packages, :through => :packagations 
end
