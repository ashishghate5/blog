class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  delegate :email, to: :user, prefix: true
end
