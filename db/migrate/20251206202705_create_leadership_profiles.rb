class CreateLeadershipProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :leadership_profiles do |t|
      t.string :name
      t.string :role
      t.text :bio
      t.integer :position_order

      t.timestamps
    end
  end
end
