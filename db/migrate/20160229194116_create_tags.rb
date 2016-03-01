class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :question_id
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tags, :question_id
  end
end
