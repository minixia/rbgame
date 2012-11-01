class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :game
      t.string :team
      t.integer :round
      t.string :vote
      t.integer :score

      t.timestamps
    end
  end
end
