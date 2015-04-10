class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :commenter , presence: true 
  validates :body , presence: true
  validates :body , length: {maximum: 200}
end


