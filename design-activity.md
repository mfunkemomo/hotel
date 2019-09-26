1. What classes does each implementation include? Are the lists the same?
  - Implementation A and B both have the same number of classes and the same classes:
    - CartEntry
    - ShoppingCart
    - Order 

2. Write down a sentence to describe each class.
  - CartEntry: is a class that takes in an item that takes in a unit price and quantity that gets put in the cart.
  - ShoppingCart: is a class that contains an array of items and its quantities
  - Order: is a class that takes in the entries and calculates the total cost of those entries.

3. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  - It looks like Order takes in or is composed of ShoppingCart and ShoppingCart is composed of CartEntry. 

4. What data does each class store? How (if at all) does this differ between the two implementations?
  - CartEntry: is integers for the unit price and quantities. 
  - ShoppingCart: is an array of the unit price and quantities. 
  - Order: takes in a class of ShoppingCart which accesses the unit prices and quantities and returns a total price (integer) for everything in the ShoppingCart instance. 
  - In Implementation A, it seems like the first two classes are just meant for storing and the actual methods are being done in Order but in Implementation B each class has a method that calculates its relevant total prices so that not all the calculation is done in Order.

5. What methods does each class have? How (if at all) does this differ between the two implementations?
  - CartEntry: Both implementations instantiates but Implementation B includes a method that calculates the price for the entry and its quantities. 
  - ShoppingCart: Both implementations instantiates but Implementation B includes a method that calculates the price for the entire array of entries. 
  - Order: Both implementations instantiates but Implementation B's method has been broken down in the other classes so now it simply takes the total from ShoppingCart and adds tax to get a true total price. 

6. Consider the Order#total_price method. In each implementation:
  a. Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  - Implementation A retains and does all the computation in Order. 
  - Implementation B delegates lower level pricing calculation to the other classes so that Order does not do all of it. 
  b. Does total_price directly manipulate the instance variables of other classes?
  - Implementation A accesses the instance variable of ShoppingCart and CartEntry. 
  - Implementation B accesses the instance variable of ShoppingCart and ShoppingCart method. 

7. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  - Since CartEntry takes in the item that is being adding to ShoppingCart, I think it would make sense to implement this in CartEntry. If quantity = :bulk, there can be a method in CartEntry that calculates the discounted price for the bulk item. 

8. Which implementation better adheres to the single responsibility principle?
  - Implementation B better adheres to the single responsibility principle as it's single behavior and state. 

9. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  - EntryCart and ShoppingCart are loosely coupled as ShoppingCart relies on what EntryCart puts into ShoppingCart. 