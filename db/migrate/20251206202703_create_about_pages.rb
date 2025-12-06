class CreateAboutPages < ActiveRecord::Migration[8.0]
  def change
    create_table :about_pages do |t|
      t.text :mission
      t.text :vision
      t.text :main_content
      t.text :history

      t.timestamps
    end
  end
end
