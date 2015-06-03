class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :year
      t.string :country
      t.string :genre
      t.timestamps
    end

      create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :age
      t.timestamps
    end

      create_table :reviews do |t|
      t.string :review_text
      t.integer :review_rating
      t.timestamps
    end

  end

end