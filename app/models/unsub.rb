class Unsub < ActiveRecord::Base
  belongs_to :service
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  monetize :price_cents
end
