class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :link
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
