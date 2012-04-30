hash = { 
  "red" => "rouge",
  "yellow" => "jaune",
  "green" => "vert"
}

hash.each do |entry|
  #puts "{entry[0]} (#{entry[0].class}): #{entry[0]}" 

end

hash.each_pair do |name, value|
  #puts "#{name}: #{value}"
end

hash = { 
  :red => { :french => "rouge", :italian => "rossa" },
  :yellow => { :french => "jaune", :italian => "giallo" },
  :green => { :french => "vert", :italian => "verde" }
}

hash.each do |entry|
  #puts "#{entry[0]} #{entry[0][:italian]}:#{entry[1][:italian]} #{entry[1][:french]}"
end

hash.each_pair do |name, value|
  puts "#{name} (#{name.class}): #{value[:french]}"
end

#puts hash[:red][:italian] # "красный"