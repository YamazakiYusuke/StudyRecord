class InitialSchema < ActiveRecord::Migration[5.2]
  def change

    create_table :users do |t|
      t.string :name,               null: false
      t.string :email,              null: false
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :email, unique: true

    create_table :study_times do |t|
      t.float :time_length, null: false
      t.date :date, null: false
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :labels do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
