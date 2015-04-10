class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	validates :title , presence: true
	validates :title , uniqueness: true
	validates :title , length: {minimum: 5}
	validates :title , length: {maximum: 30}
	validates :text , presence: true
	validates :text , length: {maximum: 500}
end
