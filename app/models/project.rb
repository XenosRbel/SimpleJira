class Project < ApplicationRecord
  belongs_to :team
  has_many :posts
  has_many :tasks
end
