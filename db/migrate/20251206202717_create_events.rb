class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :event_date
      t.string :location
      t.string :registration_url
      t.integer :status

      t.timestamps
    end
  end
end
