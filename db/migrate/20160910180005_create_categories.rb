class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string "topic"
      t.timestamps null: false
    end
  end
end
