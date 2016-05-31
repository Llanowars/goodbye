class Service < ActiveRecord::Base
  has_many :unsubs
  validates :name, :uniqueness => true
end

