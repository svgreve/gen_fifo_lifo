defmodule  GenFifo.QueueTest do
  use ExUnit.Case

  alias GenFifo.Queue

  test "enqueues 1000 numbers and then dequeues the first one (1)" do
    {:ok, pid} = Queue.start_link([])

    Enum.map(1..1000, fn x -> Queue.enqueue(pid, x) end)

    assert 1 = Queue.dequeue(pid)
  end

end
