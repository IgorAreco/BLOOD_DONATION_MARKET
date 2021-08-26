class CreateBloods < ActiveRecord::Migration[6.0]
  def change
    create_table :bloods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :blood_type, null: false, default: ''
      t.boolean :offer, null: false, default: true
      t.float :latitude
      t.float :longitude
      t.boolean :available, null: false, default: true

      t.timestamps
    end
  end
end
