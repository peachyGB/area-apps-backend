class CreateInteractions < ActiveRecord::Migration[6.1]
  def change
    create_table :interactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true
      t.boolean :bookmark
      t.boolean :download
      t.boolean :error_report
      t.integer :rating

      t.timestamps
    end
  end
end
