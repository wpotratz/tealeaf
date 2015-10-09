

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages

ages.delete_if { |k,v| v >= 100 }

p ages


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages

ages.keep_if { |k,v| v < 100 }

p ages