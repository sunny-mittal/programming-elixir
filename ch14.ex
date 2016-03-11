# defmodule Ch14 do
#   import :timer, only: [ sleep: 1 ]
#
#   def echo do
#     receive do
#       { sender, name } -> send sender, name
#       echo
#     end
#   end
#
#   def notify(parent) do
#     send parent, "Bloop"
#     exit :error
#   end
#
#   def receive_messages do
#     receive do
#       message ->
#         IO.puts "#{inspect message}"
#     after 500 ->
#       exit :ok
#     end
#     receive_messages
#   end
#
#   def run do
#     spawn_link(Ch14, :notify, [ self ])
#     sleep 500
#     receive_messages
#   end
# end
#
# Ch14.run
#
# # pid = spawn(Ch14, :echo, [])
# # send pid, { self, :fred }
# #
# # receive do
# #   name -> IO.inspect name
# # end
# #
# # pid = spawn(Ch14, :echo, [])
# # send pid, { self, :betty }
# #
# # receive do
# #   name -> IO.inspect name
# # end
#
#
# defmodule Monitors do
#   import :timer, only: [sleep: 1]
#
#   def shitty_baby(parent) do
#     send parent, :hello
#     # exit :sleepy_time
#   end
#
#   def main do
#     spawn_link(Monitors, :shitty_baby, [self])
#     sleep 500
#     receive do
#       message ->
#         IO.puts message
#     end
#   end
# end
#
# Monitors.main

defmodule Monitors do
  import(:timer, only: [sleep: 1])

  def baby(pid) do
    send(pid, :hello)
    exit(:boom)
  end

  def main do
    Process.flag(:trap_exit, true)
    spawn_link(Monitors, :baby, [self])
    sleep 500
    receive do
      msg ->
        IO.puts "#{inspect msg}"
      after 500 ->
        exit :ok
    end
  end
end

Monitors.main
