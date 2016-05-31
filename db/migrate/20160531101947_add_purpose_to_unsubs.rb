class AddPurposeToUnsubs < ActiveRecord::Migration
  def change
    add_column :unsubs, :purpose, :string
    add_column :unsubs, :reason, :string
    add_column :unsubs, :content, :string
  end
end
