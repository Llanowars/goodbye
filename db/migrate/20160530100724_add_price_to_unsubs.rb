class AddPriceToUnsubs < ActiveRecord::Migration
  def change
    add_monetize :unsubs, :price, currency: { present: false }
    add_column :unsubs, :sku, :string
  end
end
