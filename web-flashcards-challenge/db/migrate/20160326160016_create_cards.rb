class CreateCards < ActiveRecord::Migration
  def change
    create_table 'cards' do |t|
      t.string :question
      t.string :correct_answer
      t.integer :answered_correctly, :default => 0
      t.integer :times_answered, :default => 0

      #Foreign Key
      t.integer :deck_id

      t.timestamps(null: false)
    end
  end
end
