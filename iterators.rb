def n_times(n)
  1.upto(n) do |i|
    yield i
  end
end

n_times(10) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end


