class Customer
  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  # return **all** of the customer instances
  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # given a string of a **full name**, returns the **first customer** whose full name matches
  # return nil if not found
  def self.find_by_name (full_name)
    @@all.each {|customer| return customer if customer.full_name == full_name}
    return nil
  end

  # given a string of a first name, returns an **array** containing all customers with that first name
  def self.find_all_by_first_name (first_name)
    @@all.select {|customer| customer.first_name == first_name}
  end

  # return an **array** of all of the customer full names
  def self.all_names (full_name)
    @@all.map {|customer| customer.full_name}
  end

  # given a **restaurant object**, some review content (as a string), and a star rating (as an integer), creates a new review and associates it with that customer and restaurant.
  def add_review(restaurant, content, rating)
    Review.new(self, restaurant, content, rating)
  end

  # return all reviews the customer has given
  def all_reviews
    Review.all.select {|review| review.customer == self}
  end

  # returns the total number of reviews that a customer has authored
  def num_reviews
    all_reviews.count
  end

  # returns a **unique** array of all restaurants a customer has reviewed
  def restaurants
    all_reviews.map {|review| review.restaurant}.uniq
  end

  # returns the customer that give the most amount of reviews
  def self.reviewer_of_the_year
    @@all.max_by {|customer| customer.num_reviews}
  end



end
