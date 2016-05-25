class AddPhotoToUnsub < ActiveRecord::Migration
  def change
    add_column :unsubs, :photo, :string
  end
end
