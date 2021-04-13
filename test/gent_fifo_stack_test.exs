defmodule  GenFifo.StackTest do
  use ExUnit.Case

  alias GenFifo.Stack

  test "stacks 1000 numbers and then pops the last one (1000)" do
    {:ok, pid} = Stack.start_link([])

    Enum.map(1..1000, fn x -> Stack.push(pid, x) end)

    assert 1000 = Stack.pop(pid)
  end

end
