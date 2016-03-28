class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  attr_reader :cards, :answered_cards, :correct_answers, :total_guesses


  # def new_deck
  # @cards = Card.where(deck_id: self.id).to_a
  # @cards.shuffle
  # end

  # def pick_a_card
  #   if @cards.length == 0
  #     if @answered_cards.length == 0
  #        return "game over"
  #     end
  #     @cards = @answered_cards.where(answered_correctly: 0)
  #     @answered_cards = []
  #   end
  #   card = @cards.pop
  #   @answered_cards << card
  #   return card
  # end

  def submit_answer(answer)
    card = @answered_cards.last
    if card.correct_answer == answer
      card.answered_correctly = 1
      @correct_answers += 1 if card.times_answered == 0
    end
    card.times_answered += 1
    @total_guesses += 1
  end

  def reset
    finished_cards = Card.where(deck_id: self.id)
    finished_cards.each do |card|
      card.answered_correctly = 0
      card.times_answered = 0
    end
    @correct_answers = 0
    @total_guesses = 0
    @deck = nil
  end
end
