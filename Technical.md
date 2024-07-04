1. Describe the difference between module and class?

- Module cannot be instantiated but class can to create objects
- Module cannot inherit from modules / classes but can be mixed into classes. Class can do inheritance
- Module is used to encapsulate reusable code, class is to define a blueprint of object

2. Describe the difference between the class variable and the class instance variable?

- Class variable prefixed with `@@` and Class instance variable prefixed with `@`
- Class variable is shared across the entire inheritance hierarchy, if changes in child class it can affect the parent class and vice versa. Class instance variable is not affected if changes in child class
- Class variable is accessible within class methods and instance methods. Class instance variable only within class methods unless explicitly accessed via getter methods

3. What is polymorphism and give an example for that in a model class?

- Polymoprhism is a concept that allows different classes to be treated as an objects of a common superclass or parent.
- Example:

```ruby
class Food
    def recipe
        raise NotImplementedError, 'Subclassess must define recipe'
    end
end

class Burger < Food
    def recipe
        puts "100 g Minched Meat and Bun"
    end
end

class Steak < Food
    def recipe
        puts "100 g Good Grade Meat"
    end
end

def read_recipe(food)
    food.recipe
end

burger = Burger.new
steak = Steak.new

read_recipe(burger)
read_recipe(steak)
```

4. How do you handle N+1 performance issues?

- So N+1 performance issues occur when database query is executed in a loop, resulting in unnecessary queries. To handle this issues we can use Eager Loading.
- In ruby rails, we can use `includes`, `preload`, `joins`, and `eager_load`

5. Describe what is Lazy Load, and when to use it?

- Lazy load is a technique for postponing the loading of data until it is needed, which can improve performance and reduce memory usage.
- Lazy load is use when memory efficiency is needed and when conditional loading is needed.

6. How to handle Unique Records in Concurrent Process?

- Database level validation unique
- Optimistic Locking
- Using `find_or_create_by` with Transactions
