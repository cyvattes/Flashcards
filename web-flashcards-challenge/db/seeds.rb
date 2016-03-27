

CSV.foreach('db/christmas_songs.csv', {:headers => true, :header_converters => :symbol}) do |trivia_q|
  trivia_q = trivia_q.to_hash
  Card.create(:question => trivia_q[:question], :correct_answer => trivia_q[:answer], :deck_id => 1)
end

CSV.foreach('db/geography.csv', {:headers => true, :header_converters => :symbol}) do |trivia_q|
  trivia_q = trivia_q.to_hash
  Card.create(:question => trivia_q[:question], :correct_answer => trivia_q[:answer], :deck_id => 2)
end

CSV.foreach('db/history.csv', {:headers => true, :header_converters => :symbol}) do |trivia_q|
  trivia_q = trivia_q.to_hash
  Card.create(:question => trivia_q[:question], :correct_answer => trivia_q[:answer], :deck_id => 3)
end

CSV.foreach('db/names_music.csv', {:headers => true, :header_converters => :symbol}) do |trivia_q|
  trivia_q = trivia_q.to_hash
  Card.create(:question => trivia_q[:question], :correct_answer => trivia_q[:answer], :deck_id => 4)
end

Deck.create(name: "Christmas Songs")
Deck.create(name: "Geography")
Deck.create(name: "History")
Deck.create(name: "Names in Songs")

# Create fake users
20.times do
  User.create(user_name: Faker::Internet.user_name, password: "12345")
end

# Create fake rounds
100.times do
  Round.create(score: rand(0..20), total_guesses: rand(0..20), user_id: rand(1..20), deck_id: rand(1..4))
end