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
    [direction: :north, position: {0,0}]
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
    tokens = String.split(instructions, "") 
      |> List.pop_at(0)
      |> elem(1)
      |> List.pop_at(-1)
      |> elem(1)

    new_bot = Enum.reduce(
      tokens, 
      [direction: robot[:direction], x: elem(robot[:position], 0), y: elem(robot[:position], 1)],
      fn(x, accu) -> perform_task(x, accu) end
    )

    create(new_bot[:direction], {new_bot[:x], new_bot[:y]})
  end

  def perform_task("A", new_bot) do
    case new_bot[:direction] do
      :north -> [direction: new_bot[:direction], x: new_bot[:x], y: new_bot[:y] + 1]
      :east -> [direction: new_bot[:direction], x: new_bot[:x] + 1, y: new_bot[:y]]
      :south -> [direction: new_bot[:direction], x: new_bot[:x], y: new_bot[:y] - 1]
      :west -> [direction: new_bot[:direction], x: new_bot[:x] - 1, y: new_bot[:y]]
    end
  end

  def perform_task("L", new_bot) do
    case new_bot[:direction] do
      :north -> [direction: :west, x: new_bot[:x], y: new_bot[:y]]
      :east -> [direction: :north, x: new_bot[:x], y: new_bot[:y]]
      :south -> [direction: :east, x: new_bot[:x], y: new_bot[:y]]
      :west -> [direction: :south, x: new_bot[:x], y: new_bot[:y]]
    end
  end

  def perform_task("R", new_bot) do
    case new_bot[:direction] do
      :north -> [direction: :east, x: new_bot[:x], y: new_bot[:y]]
      :east -> [direction: :south, x: new_bot[:x], y: new_bot[:y]]
      :south -> [direction: :west, x: new_bot[:x], y: new_bot[:y]]
      :west -> [direction: :north, x: new_bot[:x], y: new_bot[:y]]
    end
  end

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
