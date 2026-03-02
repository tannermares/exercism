defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice) when category === :full_house do 
    sorted = Enum.sort(dice)
    tuple_dice = List.to_tuple(sorted)
    cond do
      elem(tuple_dice, 0) === elem(tuple_dice, 1) && elem(tuple_dice, 2) === elem(tuple_dice, 3) && elem(tuple_dice, 3) === elem(tuple_dice, 4) && elem(tuple_dice, 0) !== elem(tuple_dice, 4) -> Enum.sum(dice)
      elem(tuple_dice, 0) === elem(tuple_dice, 1) && elem(tuple_dice, 1) === elem(tuple_dice, 2) && elem(tuple_dice, 3) === elem(tuple_dice, 4) && elem(tuple_dice, 0) !== elem(tuple_dice, 4) -> Enum.sum(dice)
      true -> 0
    end
  end

  def score(category, dice) when category === :four_of_a_kind do 
    sorted = Enum.sort(dice)
    tuple_dice = List.to_tuple(sorted)
    cond do
      elem(tuple_dice, 0) === elem(tuple_dice, 1) && elem(tuple_dice, 1) === elem(tuple_dice, 2) && elem(tuple_dice, 2) === elem(tuple_dice, 3) -> elem(tuple_dice, 0) + elem(tuple_dice, 1) + elem(tuple_dice, 2) + elem(tuple_dice, 3)
      elem(tuple_dice, 1) === elem(tuple_dice, 2) && elem(tuple_dice, 2) === elem(tuple_dice, 3) && elem(tuple_dice, 3) === elem(tuple_dice, 4) -> elem(tuple_dice, 1) + elem(tuple_dice, 2) + elem(tuple_dice, 3) + elem(tuple_dice, 4)
      true -> 0
    end
  end

  def score(category, dice) when category === :little_straight do
    if(Enum.sort(dice) === [1, 2, 3, 4, 5], do: 30, else: 0)
  end

  def score(category, dice) when category === :big_straight do 
    if(Enum.sort(dice) === [2, 3, 4, 5, 6], do: 30, else: 0)
  end

  def score(category, dice) when category === :choice do 
    Enum.sum(dice)
  end

  def score(category, dice) when category === :yacht do 
    if(length(Enum.uniq(dice)) === 1, do: 50, else: 0)
  end

  def score(category, dice) do
    case category do
      :ones -> sum_only(dice, 1)
      :twos -> sum_only(dice, 2)
      :threes -> sum_only(dice, 3)
      :fours -> sum_only(dice, 4)
      :fives -> sum_only(dice, 5)
      :sixes -> sum_only(dice, 6)
    end
  end
  
  defp sum_only(dice, digit) do
    Enum.reduce(
      dice, 
      0,
      fn (x, score) -> if(x === digit, do: score + digit, else: score) end
    )
  end
end
