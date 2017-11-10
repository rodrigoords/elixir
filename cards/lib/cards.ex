defmodule Cards do
  @moduledoc """
    Expose functions to create and handling a deck of cards.
  """

  @doc """
  Returns a list of String representing a dock of playing cards.

  ## Examples

      iex> Cards.create_deck
      ["Jack of Spades", "Queen of Spades", "King of Spades", ...]

  """
  def create_deck do
    values = ["Jack", "Queen", "King", "Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do      
        "#{value} of #{suit}"
    end
  end

  def shuffer(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
  Divides a deck into a hand and the reminder of a deck.
  The `hand_size` parameters indicate how many cards should be in the hand.
  
  ## Examples

      iex> deck = Cards.create_deck
      iex> { hand, deck } = Cards.deal(deck, 2)
      iex> hand

      ["Jack of Spades", "Queen of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do 
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Error to read file, Maybe that file does not exist."
    end
  end

  def drop_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffer
    |> Cards.deal(hand_size)
  end

end
