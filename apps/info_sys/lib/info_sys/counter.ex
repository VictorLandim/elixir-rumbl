defmodule InfoSys.Counter do
  use GenServer, restart: :permanent

  # Client
  def inc(pid), do: GenServer.cast(pid, :inc)
  def dec(pid), do: GenServer.cast(pid, :dec)
  def val(pid), do: GenServer.call(pid, :val)

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value)
  end

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_cast(:inc, val) do
    {:noreply, val + 1}
  end

  def handle_cast(:dec, val) do
    {:noreply, val - 1}
  end

  def handle_call(:val, _from, val) do
    {:reply, val, val}
  end
end
