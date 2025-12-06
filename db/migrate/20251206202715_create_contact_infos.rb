class CreateContactInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_infos do |t|
      t.string :phone
      t.string :email
      t.text :location
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url

      t.timestamps
    end
  end
end
