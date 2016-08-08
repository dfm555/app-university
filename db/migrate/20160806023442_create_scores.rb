class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.decimal :partial_one
      t.string :partial_two
      t.string :final

      t.timestamps null: false
    end
  end
end
