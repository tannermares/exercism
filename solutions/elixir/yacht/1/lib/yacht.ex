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
  def score(category, dice) when category === :yacht do 
    Enum.reduce(dice, 50, fn (x, score) -> if(x !== 5, do: 0, else: score) end)
  end

  def score(category, dice) when category === :ones do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 1, do: score + 1, else: score) end)
  end

  def score(category, dice) when category === :twos do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 2, do: score + 2, else: score) end)
  end

  def score(category, dice) when category === :threes do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 3, do: score + 3, else: score) end)
  end

  def score(category, dice) when category === :fours do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 4, do: score + 4, else: score) end)
  end

  def score(category, dice) when category === :fives do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 5, do: score + 5, else: score) end)
  end

  def score(category, dice) when category === :sixes do 
    Enum.reduce(dice, 0, fn (x, score) -> if(x === 6, do: score + 6, else: score) end)
  end

  def score(category, dice) when category === :full_house do 
    sorted = Enum.sort(dice)
    tuple_dice = List.to_tuple(sorted)
    cond do
      elem(tuple_dice, 0) === elem(tuple_dice, 1) && elem(tuple_dice, 2) === elem(tuple_dice, 3) && elem(tuple_dice, 3) === elem(tuple_dice, 4) && elem(tuple_dice, 0) !== elem(tuple_dice, 4) -> Enum.reduce(dice, 0, fn (x, score) -> x + score end)
      elem(tuple_dice, 0) === elem(tuple_dice, 1) && elem(tuple_dice, 1) === elem(tuple_dice, 2) && elem(tuple_dice, 3) === elem(tuple_dice, 4) && elem(tuple_dice, 0) !== elem(tuple_dice, 4) -> Enum.reduce(dice, 0, fn (x, score) -> x + score end)
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
    sorted = Enum.sort(dice)
    tuple_dice = List.to_tuple(sorted)
    if(elem(tuple_dice, 0) === 1 && elem(tuple_dice, 1) === 2 && elem(tuple_dice, 2) === 3 && elem(tuple_dice, 3) === 4 && elem(tuple_dice, 4) === 5,
    do: 30,
    else: 0)
  end

  def score(category, dice) when category === :big_straight do 
    sorted = Enum.sort(dice)
    tuple_dice = List.to_tuple(sorted)
    if(elem(tuple_dice, 0) === 2 && elem(tuple_dice, 1) === 3 && elem(tuple_dice, 2) === 4 && elem(tuple_dice, 3) === 5 && elem(tuple_dice, 4) === 6,
    do: 30,
    else: 0)
  end

  def score(category, dice) when category === :choice do 
    Enum.reduce(dice, 0, fn (x, score) -> x + score end)
  end
end
