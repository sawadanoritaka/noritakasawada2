class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :email
      t.text :message
      t.timestamps null: false
    end
  end
end
