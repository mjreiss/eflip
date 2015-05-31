class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :buyer_email
      t.string :seller_email
      t.decimal :amount, precision: 8, scale: 2
      t.string :guid
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
