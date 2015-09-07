class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :external_id
      t.string :name
    end

    create_table :items do |t|
      t.integer :external_id
      t.string :name
    end

    create_table :categories do |t|
      t.integer :external_id
      t.string :name
    end

    create_table :items_users, :id => false do |t|
      t.integer :item_id
      t.integer :user_id
    end

    create_table :categories_items, :id => false do |t|
      t.integer :category_id
      t.integer :item_id
    end
  end
end
