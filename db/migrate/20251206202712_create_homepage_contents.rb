class CreateHomepageContents < ActiveRecord::Migration[8.0]
  def change
    create_table :homepage_contents do |t|
      t.string :hero_title
      t.text :hero_subtitle
      t.text :about_snippet

      t.timestamps
    end
  end
end
