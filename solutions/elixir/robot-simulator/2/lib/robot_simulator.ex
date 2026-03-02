defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}  
  def create() do
    %{direction: :north, position: {0,0}}
  end

  def create(direction, _position) when not direction in [:north, :east, :south, :west] do
    {:error, "invalid direction"}
  end

  def create(_direction, position) when not is_tuple(position) or tuple_size(position) !== 2 or not is_number(position |> elem(0)) or not is_number(position |> elem(1)) do
    {:error, "invalid position"}
  end

  def create(direction, position) do
    [direction: direction, position: position]
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    if(
      String.match?(instructions, ~r/\A[ARL]*\z/), 
      do: new_bot(robot, instructions), 
      else: {:error, "invalid instruction" }
    )
  end

  def new_bot(robot, instructions) do
    new_bot = Enum.reduce(
      String.graphemes(instructions), 
      %{direction: robot[:direction], x: elem(robot[:position], 0), y: elem(robot[:position], 1)},
      &perform_task/2)

    create(new_bot[:direction], {new_bot[:x], new_bot[:y]})
  end

  def perform_task("A", %{direction: :north, y: y} = new_bot), do: %{new_bot | y: y + 1}
  def perform_task("A", %{direction: :east, x: x} = new_bot), do: %{new_bot | x: x + 1}
  def perform_task("A", %{direction: :south, y: y} = new_bot), do: %{new_bot | y: y - 1}
  def perform_task("A", %{direction: :west, x: x} = new_bot), do: %{new_bot | x: x - 1}

  def perform_task("L", %{direction: :north} = new_bot), do: %{new_bot | direction: :west}
  def perform_task("L", %{direction: :east} = new_bot), do: %{new_bot | direction: :north}
  def perform_task("L", %{direction: :south} = new_bot), do: %{new_bot | direction: :east}
  def perform_task("L", %{direction: :west} = new_bot), do: %{new_bot | direction: :south}

  def perform_task("R", %{direction: :north} = new_bot), do: %{new_bot | direction: :east}
  def perform_task("R", %{direction: :east} = new_bot), do: %{new_bot | direction: :south}
  def perform_task("R", %{direction: :south} = new_bot), do: %{new_bot | direction: :west}
  def perform_task("R", %{direction: :west} = new_bot), do: %{new_bot | direction: :north}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    robot[:position]
  end
end
