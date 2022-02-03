class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.text :concept, null: false
      t.text :explanation, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
