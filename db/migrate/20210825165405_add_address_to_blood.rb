class AddAddressToBlood < ActiveRecord::Migration[6.0]
  def change
    add_column :bloods, :address, :string
  end
end
