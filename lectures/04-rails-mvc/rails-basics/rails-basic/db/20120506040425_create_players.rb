class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.integer :age
	  t.date :date

      t.timestamps
    end
  end
end
