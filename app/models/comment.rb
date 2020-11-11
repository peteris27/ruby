class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true, length: { minimum: 5 }, uniqueness: true
  validates_presence_of :body
end
