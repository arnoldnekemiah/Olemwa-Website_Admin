class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :status
      t.datetime :published_at
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
