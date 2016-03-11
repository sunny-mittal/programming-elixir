defmodule Monitor do
  import :timer, only: [ sleep: 1 ]
  def sad_method do
    sleep 500
    exit :boom
  end

  def run do
    res = spawn_monitor(Monitor, :sad_method, [])
    IO.puts inspect res
    receive do
      msg ->
        IO.puts "Message: #{inspect msg}"
    after 1000 ->
      IO.puts "Nothing happened"
    end
  end
end

Monitor.run
