class AddZipCodeToCities < ActiveRecord::Migration
  def change
    add_column :cities, :zip_code, :integer
    add_index :cities, :zip_code
  end
end
