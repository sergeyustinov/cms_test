class CreateDataSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sheets do |t|
      t.string :filename
      t.boolean :active, default: false
      t.text :search_terms
      # t.references :lancon
      # t.references :top_category, foreign_key: true
      t.timestamps
    end
  end
end
