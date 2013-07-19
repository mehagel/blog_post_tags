class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
    validates :body, :presence => true
    validates :title, :presence => true
end
