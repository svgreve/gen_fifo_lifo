# GenFifoLifo

Nesse desafio, você deverá criar uma aplicação em Elixir (somente Elixir), onde nessa aplicação teremos um módulo que implementa a estrutura de dados Fila utilizando Genservers.

Uma estrutura de fila na programação é equivalente à uma fila no mundo real, onde o primeiro elemento inserido em uma lista é também o primeiro a ser removido. 
Mais detalhes sobre esse tipo de estrutura [aqui](https://www.cos.ufrj.br/~rfarias/cos121/filas.html#:~:text=Filas%20%2D%20Queue,e%20remove%2Dse%20do%20in%C3%ADcio).

A fila deve ser criada em um módulo chamado Queue, respeitando o seguinte contrato:

```bash
iex> {:ok, pid} = Queue.start_link(estado_inicial_da_fila) # ex: Queue.start_link([1,2,3])
{:ok, #PID<0.122.0>}

iex> Queue.enqueue(pid, 5)
:ok

iex> Queue.dequeue(pid)
1
```

Para a função `enqueue/2`, utilize em seu callback uma função `handle_cast/2` e para `dequeue/1` uma do tipo `handle_call/3`.
Em caso de qualquer dúvida, você pode conferir a documentação oficial do GenServer: [https://hexdocs.pm/elixir/GenServer.html](https://hexdocs.pm/elixir/GenServer.html).

No exemplo acima, a função `Queue.start_link` é chamada para iniciar a fila com uma lista contendo três valores `[1, 2, 3]`. Após isso, é chamada a função `Queue.enqueue` com o pid e um novo valor a ser acrescentado na fila e ao chamar a função `Queue.dequeue` com o pid, é removido o primeiro valor da fila que era o `1`.

Você não precisa deixar o seu GenServer rodando sobre um Supervisor nesse desafio.

## LIFO

O módulo GenFifo.Stack implementa o tratamento de pilhas 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_fifo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_fifo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gen_fifo](https://hexdocs.pm/gen_fifo).

