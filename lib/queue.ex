defmodule GenFifo.Queue do
  use GenServer

  # Client side

  def start_link(initial_queue) when is_list(initial_queue) do
    reversed_list = Enum.reverse(initial_queue)
    GenServer.start_link(__MODULE__, reversed_list)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  # Callbacks

  @impl true
  def init(queue) do
    {:ok, queue}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    reversed_list = [head | tail]
    queue = Enum.reverse(reversed_list)
    [head | tail] = queue
    new_reversed_list = Enum.reverse(tail)
    {:reply, head, new_reversed_list}
  end

  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_cast({:enqueue, element}, reversed_list) do
    new_reversed_list = [element | reversed_list]
    {:noreply, new_reversed_list}
  end
end
