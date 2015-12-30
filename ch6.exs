defmodule Ch6 do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  def float_to_string(x) do
    :erlang.float_to_list(x, [ { :decimals, 2 } ])
  end

  def get_env(var) do
    System.get_env var
  end

  def get_ext(filename) do
    Path.extname filename
  end

  def getwd, do: System.cwd

  def shell_cmd(cmd), do: :os.cmd cmd
end
