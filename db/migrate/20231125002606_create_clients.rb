class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :card_id
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
