class CreateJudgements < ActiveRecord::Migration[5.1]
  def change
    create_table :judgements do |t|
      t.text :title, null: false, default: ''
      t.date :released_at
      t.integer :category, null: false
      t.attachment :attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
