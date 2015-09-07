class PropogateTableData < ActiveRecord::Migration
  require 'csv'

  def up
    CSV.foreach("./app/assets/csvs/mini_proj-users.csv", { :col_sep => "\t" }) do |row|
      User.create(external_id: row[0], name: row[1])
    end

    CSV.foreach("./app/assets/csvs/mini_proj-items.csv", { :col_sep => "\t" }) do |row|
      Item.create(external_id: row[0], name: row[1])
    end

    CSV.foreach("./app/assets/csvs/mini_proj-categories.csv", { :col_sep => "\t" }) do |row|
      Category.create(external_id: row[0], name: row[1])
    end

    # This takes longer, but ensures that we're adding correct data to our habtm tables
    # (also this only happens this one time anyway, so time doesn't really matter :D)
    CSV.foreach("./app/assets/csvs/mini_proj-items_users.csv", { :col_sep => "\t" }) do |row|
      item = Item.find_by_external_id(row[1]) 
      user = User.find_by_external_id(row[0])
      item.users << user if item.present? && user.present?
    end

    CSV.foreach("./app/assets/csvs/mini_proj-categories_items.csv", { :col_sep => "\t" }) do |row|
      category = Category.find_by_external_id(row[1])
      item = Item.find_by_external_id(row[0])
      category.items << item if category.present? && item.present?
    end
  end

  def down
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE users")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE items")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE categories")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE items_users")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE categories_items")
  end
end
