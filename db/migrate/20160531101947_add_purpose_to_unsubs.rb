class AddPurposeToUnsubs < ActiveRecord::Migration
  def change
    add_column :unsubs, :purpose, :string
    add_column :unsubs, :reason, :string
  end
end
