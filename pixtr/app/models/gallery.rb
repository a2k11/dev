class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
