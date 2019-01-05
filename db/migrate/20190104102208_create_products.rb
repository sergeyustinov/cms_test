class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :meta_title
      t.string :item_no, null: false
      t.string :slug, null: false
      t.string :label
      t.text :summary
      t.text :items_keywords
      t.text :overview
      t.text :ingredients
      t.text :how_to_use
      t.boolean :active, default: false
      # t.references :lancon       # This is a table for language/region
      # t.references :top_category # This is a table for one of three categories 
      t.timestamps
    end
  end
end
