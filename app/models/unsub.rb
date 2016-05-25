class Unsub < ActiveRecord::Base
  belongs_to :service

  mount_uploader :photo, PhotoUploader
end
