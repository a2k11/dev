class Image < ActiveRecord::Base
  belongs_to :gallery

  validates :name, presence: true
end
