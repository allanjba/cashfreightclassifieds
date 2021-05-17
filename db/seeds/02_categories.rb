categories = ["Used", "New", "Ford", "Parts", "Local pickup", "4x4", "Tires", "Bodyparts", "Vintage", "Only owner", "Collectable", "Diesel", "Gasoline"]

puts "Creating Categories"
categories.each_with_index do |c, i|
    Category.create(name: c)
    print "Creating Categories(#{i}) #{ c}".ljust(80) + "\r"
    $stdout.flush
end
puts "Categories done".ljust(80)