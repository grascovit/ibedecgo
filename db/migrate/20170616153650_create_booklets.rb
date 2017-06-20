class CreateBooklets < ActiveRecord::Migration[5.1]
  def change
    create_table :booklets do |t|
      t.text :title, null: false, default: ''
      t.text :description
      t.integer :year, null: false
      t.integer :category, null: false
      t.attachment :attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
