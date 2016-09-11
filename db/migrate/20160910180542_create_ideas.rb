class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :thought
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
