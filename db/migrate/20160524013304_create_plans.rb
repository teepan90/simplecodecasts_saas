class CreatePlans < ActiveRecord::Migration
  # This will create a new TABLE with a string column for name and a decimal column for price, AMAZING RIGHT!
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      
      t.timestamps
    end
  end
end
