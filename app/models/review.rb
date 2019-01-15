class Review

  #Returns values of the review including customer, restaurant, rating and content
  #None of them should be able to change after initialization (after creation)
  attr_reader :customer, :restaurant, :rating, :content
  @@all = []

  #initialize the review based on all content parts
  def initialize (customer, restaurant, rating, content)
    @customer = customer
    @restaurant = restaurant
    @content = content

    # making sure the rating is within the range of acceptable values
    if rating > 5
      rating = 5
      puts "rating cannot be larger than 5"
    elsif rating <1
      rating = 1
      puts "rating cannot be smaller than 1"
    end

    @rating = rating.round.to_i

    @@all << self
  end

  #Returns all of the reviews
  def self.all
    @@all
  end


end
