class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.string :article_type
      t.string :teaser
      t.text :main_body
      t.text :directions
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
