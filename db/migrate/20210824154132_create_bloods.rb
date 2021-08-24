class CreateBloods < ActiveRecord::Migration[6.0]
  def change
    create_table :bloods do |t|
      t.references :user, null: false, foreign_key: true
      t.text :location

      t.timestamps
    end
  end
end
