defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

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
