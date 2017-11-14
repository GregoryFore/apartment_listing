class AddPaperClipToApartments < ActiveRecord::Migration[5.1]
  def change
     add_attachment :apartments, :image
  end
end
