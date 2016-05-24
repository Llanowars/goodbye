class CreateUnsubs < ActiveRecord::Migration
  def change
    create_table :unsubs do |t|
      t.json :form_complete
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
