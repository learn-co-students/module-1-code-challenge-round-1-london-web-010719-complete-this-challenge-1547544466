class Restaurant
  attr_accessor :name
  @@all = []

  # initialize restaurant with just the name
  def initialize(name)
    @name = name
    @@all << self
  end

  # returns an array of all restaurants
  def self.all
    @@all
  end

  # given a string of restaurant name, returns the first restaurant that matches
  # return nil if no match
  def self.find_by_name (name)
    @@all.each {|restaurant| return restaurant if restaurant.name == name}
    return nil
  end

  # returns an array of all reviews for that restaurant
  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

  # returns a **unique** list of all customers who have reviewed a particular restaurant
  def customers
    reviews.map {|review| review.customer}.uniq
  end

  # returns all ratings in the past as integer in an array
  def rating_history
    reviews.map {|review| review.rating}
  end

  # returnsa all review content in the past in an array
  def review_content_history
    reviews.map {|review| review.content}
  end

  # returns the average star rating for a restaurant based on its reviews
  def average_star_rating
    rating_history.inject(0) {|sum,rating| sum + rating}.to_f / rating_history.size
    # summing all rating scores divided over the number of reviews
  end

  # returns the longest review content for a given restaurant
  def longest_review
    review_content_history.max_by {|review_content| review_content.length}
  end

  # returns the best restaurant in terms of rating of all restaurants
  def self.restaurant_of_the_year
    @@all.max_by {|restaurant| restaurant.average_star_rating}
  end

end
