// The main function executes all the demonstrations
void main() {
  print("--- Dart OOP Adventure Begins! 🚀 ---\n");

  // 1. Encapsulation Demonstration
  print("--- 1. Encapsulation (Protecting Data) ---");
  var user = UserAccount('Alice', 500.00);
  print('Initial Balance for ${user.username}: \$${user.balance.toStringAsFixed(2)}');
  user.deposit(150.00);
  user.withdraw(20.00);
  // Attempting to directly access _balance is prevented by the language/linter.
  // user._balance = 1000000; // ERROR: Private access prevented!
  print('Final Balance for ${user.username}: \$${user.balance.toStringAsFixed(2)}\n');


  // 2. & 3. Inheritance and Polymorphism Demonstration
  print("--- 2. Inheritance & 3. Polymorphism (Shapes) ---");
  // Polymorphism: Treating objects of different classes (Circle, Rectangle) 
  // as objects of a common superclass (Shape).
  List<Shape> shapes = [
    Circle(5.0),
    Rectangle(4.0, 6.0),
    Rectangle(3.0, 3.0), // A square is a rectangle
  ];

  for (var shape in shapes) {
    // Polymorphism in action: The same 'calculateArea()' method 
    // executes different code based on the actual object type.
    print('${shape.name} Area: ${shape.calculateArea().toStringAsFixed(2)}');
    shape.printInfo(); // Inherited method
  }
}

// =========================================================
// 4. Abstraction Mastered 🎨
// =========================================================

/// Abstract class defines a blueprint and common methods/properties.
abstract class Shape {
  // Concrete property that all derived classes share
  String name; 
  
  // Constructor for the abstract class
  Shape(this.name);

  /// Abstract method: No body. Must be implemented by all non-abstract subclasses.
  double calculateArea();

  /// Concrete method: Provides shared functionality through inheritance.
  void printInfo() {
    print('  This is a $name.');
  }
}

// =========================================================
// 2. Inheritance & 3. Polymorphism Embraced 🎭
// =========================================================

/// Subclass inherits from the abstract class Shape.
class Circle extends Shape {
  double radius;

  // Calls the superclass constructor to set the name.
  Circle(this.radius) : super('Circle');

  /// Polymorphism (Method Overriding): Provides a unique implementation
  /// for the abstract method defined in the superclass.
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

/// Another subclass demonstrating unique implementation.
class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width) : super('Rectangle');

  /// Polymorphism (Method Overriding): Provides the area calculation 
  /// specific to a rectangle.
  @override
  double calculateArea() {
    return length * width;
  }
}


// =========================================================
// 1. Encapsulation Implemented 🔒
// =========================================================

/// Class demonstrating Encapsulation principles.
class UserAccount {
  String username;
  
  // Private variable (using the underscore prefix)
  double _balance; 

  UserAccount(this.username, this. _balance);

  // Getter: Controlled Read Access (Read-only access to the private data)
  double get balance => _balance;

  /// Public Method: Controlled Write Access (Deposit)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('${username} deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  /// Public Method: Controlled Write Access (Withdrawal with logic)
  void withdraw(double amount) {
    if (amount > 0 && _balance >= amount) {
      _balance -= amount;
      print('${username} withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else if (_balance < amount) {
      print('Withdrawal failed: Insufficient funds.');
    } else {
      print('Withdrawal amount must be positive.');
    }
  }
}
