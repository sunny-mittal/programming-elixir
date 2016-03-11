# defmodule Spawn do
#   def greet do
#     receive do
#       { sender, msg } ->
#         send sender, { :ok, "Hello, #{msg}" }
#     end
#   end
# end

defmodule Erik do
  def example do
    receive do
      { sender, msg } ->
        send sender, { :ok, "Confused yet? #{msg}" }
    end
  end
end

pid = spawn(Erik, :example, [])
send pid, { self, "Maybe..." }

receive do
  { :ok, message } -> IO.puts message
end

pid = spawn(Erik, :example, [])
send pid, { self, "K yep, definitely" }

receive do
  { :ok, message } -> IO.puts message
end

pid = spawn(Spawn, :greet, [])

send pid, { self, "World!" }

receive do
  { :ok, message } ->
    IO.puts message
end

send pid, { self, "Kermit!" }

receive do
  { :ok, message } ->
    IO.puts message
  after 500 ->
    IO.puts "The greeter has gone away"
end
