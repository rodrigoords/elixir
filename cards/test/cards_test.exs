defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck must return 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck rendomizes it " do
    deck = Cards.create_deck
    refute deck == Cards.shuffler(deck)
  end

  test "drop hand must drop the number of cards pass and the remeing cards" do
    { hand, deck } = Cards.drop_hand 2
    assert length(hand) == 2
    assert length(deck) == 50
  end

end
