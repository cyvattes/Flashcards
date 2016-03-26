class CreateRounds < ActiveRecord::Migration
  def change
    create_table 'rounds' do |t|
      t.integer :score
      t.integer :total_guesses

      #Foreign Key
      t.integer :user_id
      t.integer :deck_id

      t.timestamps(null: false)
    end
  end
end
