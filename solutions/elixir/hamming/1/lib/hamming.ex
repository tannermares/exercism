defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    cond do
      length(strand1) !== length(strand2) -> {:error, "strands must be of equal length"}
      length(strand1) === 0 && length(strand2) === 0 -> {:ok, 0}
      length(strand1) === length(strand2) -> {:ok, safe_hamming_distance(strand1, strand2)}
    end
  end

  def safe_hamming_distance(strand1, strand2) do
    strand_length = Enum.to_list(0..length(strand1) - 1)
    tuple1 = List.to_tuple(strand1)
    tuple2 = List.to_tuple(strand2)

    Enum.reduce(
      strand_length,
      0,
      fn x, accu -> accu + if(tuple1 |> elem(x) === tuple2 |> elem(x), do: 0, else: 1) end
    )
  end
end
