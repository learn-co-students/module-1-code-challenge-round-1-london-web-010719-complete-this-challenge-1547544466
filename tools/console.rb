require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#relationship between classes:
# Restaurant -<- Review
# Customer -<- Review

## *** ADDed on top of the requirement ***
## 1. Restaurant of the year class method with .restaurant_of_the_year to select the best rated restaurant
## 2. Customer of the year class method with .reviewer_of_the_year to select the most prolific reviewer
## 3. Rating cannot be smaller than 1 or larger than 5 and will be rounded as integer


customer1 = Customer.new("Songyishu", "Yang")
customer2 = Customer.new("Lorenz", "Linn")
customer3 = Customer.new("Paige", "Hasebe")
customer4 = Customer.new("Nicolai", "VonBismack")
customer5 = Customer.new("Nicolai", "VonBismack")

restaurant1 = Restaurant.new("Toko")
restaurant2 = Restaurant.new("Indie")
restaurant3 = Restaurant.new("Tomo")

review1 = Review.new(customer1, restaurant1, 5, "aaaaaaaaaaa")
review2 = Review.new(customer2, restaurant2, 3, "aaaa")
review3 = Review.new(customer3, restaurant3, 2, "aaaa")
review4 = Review.new(customer4, restaurant1, 1, "aaaa")
review5 = Review.new(customer5, restaurant2, 3, "aaaa")
review6 = Review.new(customer1, restaurant1, 3, "aaaa")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
