class CreateThirdusers < ActiveRecord::Migration
  def change
    create_table :thirdusers do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps null: false
    end
  end
end
