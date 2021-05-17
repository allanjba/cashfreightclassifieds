product_images = Unsplash::Photo.search('semi truck', 1, 20)

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet orci venenatis, convallis enim ac, condimentum nisi. Pellentesque in lectus in nisi laoreet accumsan eu quis lacus. Phasellus volutpat felis sed nulla dignissim porttitor. Aenean elit dolor, mattis eget nunc vitae, varius elementum mi. Vivamus dolor felis, pretium eu feugiat id, aliquam id nibh. Nullam nec sem sapien. Cras massa urna, ultrices quis tortor at, sodales rutrum neque. Nulla eleifend velit ac metus sagittis, quis fringilla lorem aliquet. Cras vitae elementum orci. Sed non sapien id diam interdum placerat in in sem. Vivamus nec magna cursus orci vestibulum sodales vitae ut ex. Etiam dapibus vel tellus vitae sollicitudin. Cras non nisl in turpis viverra sollicitudin. In at tortor lobortis, euismod nisi id, fringilla enim."
is_acutions = [true, false, true ]
is_sale = [true, false, true ]
categories = Category.all
users = User.all

puts "Creating products"
10.times do |index|
    image = URI.parse(product_images[index].urls.regular).open
    product = users.sample.products.new(
        title:          Faker::Commerce.product_name, 
        price:          Faker::Commerce.price(range: 10..10000.0),
        description:    Faker::Lorem.paragraphs, 
        is_auction:      is_acutions.sample, 
        auction_starting_price:             Faker::Commerce.price(range: 10..10000.0), 
        auction_duration:  rand(1..30), 
        is_sale:           is_sale.sample, 
        sale_price:        Faker::Commerce.price(range: 10..10000.0), 
        category_ids: [categories.sample.id, categories.sample.id],
    )
    product.images.attach(io: image, filename: "product.jpg")
    if product.save
        print "Creating Products(#{index}) #{ product.title}".ljust(80) + "\r"
        $stdout.flush
    else
        print " Creating Product(#{index})".ljust(80)
    end

end
print "Products done".ljust(80)

