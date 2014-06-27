class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :businessName
      t.string :streetAddress
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :mdu
      t.decimal :units
      t.text :content
      t.references :users, index: true

      t.timestamps
    end
  end
end
