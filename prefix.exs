prefix = fn pref -> fn suff -> "#{pref} #{suff}" end end

mrs = prefix.("Mrs")

IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
