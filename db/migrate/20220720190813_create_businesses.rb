class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :busName
      t.string :appName
      t.string :link
      t.string :appImage
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
