class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postal
      t.string :state
      t.string :country
      t.string :contact_info
      t.string :bm_name
      t.string :bm_phone
      t.string :bm_hours

      t.timestamps
    end
  end
end
