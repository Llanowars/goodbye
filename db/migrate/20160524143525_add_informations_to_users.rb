class AddInformationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :address_complement, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
  end
end
