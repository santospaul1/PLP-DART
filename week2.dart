// ---------------------------------------------
// Global Data Structure
// ---------------------------------------------
// Item structure: { 'name': String, 'price': double }
List<Map<String, dynamic>> shoppingCart = [
  {'name': 'Laptop', 'price': 1200.00},
  {'name': 'Mousepad', 'price': 5.50},
  {'name': 'Keyboard', 'price': 85.00},
  {'name': 'USB Cable', 'price': 9.99},
  {'name': 'Monitor', 'price': 350.00},
];

// ---------------------------------------------
// 1. Filter Items (Anonymous Function)
// ---------------------------------------------
List<Map<String, dynamic>> filterCheapItems(List<Map<String, dynamic>> cart) {
  print("Filtering Items (Price < \$10) ");
  // Use .where() with an anonymous function to filter
  List<Map<String, dynamic>> filteredCart = cart
      .where((item) => item['price'] >= 10.00)
      .toList();
  
  print("Removed ${cart.length - filteredCart.length} items.");
  return filteredCart;
}

// ---------------------------------------------
// 2. Apply Discount (Higher-Order Function)
// ---------------------------------------------

// Higher-Order Function: Accepts a function (discount logic) as an argument.
List<Map<String, dynamic>> applyPriceAdjustment(
    List<Map<String, dynamic>> cart,
    Function(double) discountFunction) {
  print("\n Applying Standard Discount ");
  
  // Use .map() to apply the discount function to every item's price
  return cart.map((item) {
    double originalPrice = item['price'];
    double newPrice = discountFunction(originalPrice);
    
    // Create a new Map with the updated price
    return {...item, 'price': newPrice};
  }).toList();
}

// Discount Logic (Anonymous function for the HOF)
double percentageDiscount(double price, double percentage) {
  return price * (1.0 - percentage / 100.0);
}

// ---------------------------------------------
// 3. Calculate Total (Optional Tax)
// ---------------------------------------------
double calculateSubtotal(List<Map<String, dynamic>> cart, {double taxRate = 0.0}) {
  // Use .fold() for efficient summation
  double subtotal = cart.fold(0.0, (sum, item) => sum + item['price']);
  
  if (taxRate > 0.0) {
    double taxAmount = subtotal * taxRate;
    print("  Subtotal: \$${subtotal.toStringAsFixed(2)}");
    print("  Tax (${(taxRate * 100).toStringAsFixed(0)}%): \$${taxAmount.toStringAsFixed(2)}");
    return subtotal + taxAmount;
  }
  
  return subtotal;
}

// ---------------------------------------------
// 4. Factorial Discount (Recursive Function)
// ---------------------------------------------

// Recursive function to calculate factorial
int factorial(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}

// ---------------------------------------------
// Main Execution
// ---------------------------------------------
void main() {
  
  // Filter Items
  List<Map<String, dynamic>> step1Cart = filterCheapItems(shoppingCart);
  print("Cart after filtering: $step1Cart");
  
  // Apply Standard Discount (5% off)
  const double standardDiscountPercent = 5.0;
  List<Map<String, dynamic>> step2Cart = applyPriceAdjustment(
      step1Cart,
      // Pass an anonymous function to the higher-order function
      (price) => percentageDiscount(price, standardDiscountPercent)
  );
  print("  5% Discount Applied to all items.");
  print("Cart after standard discount: $step2Cart");

  //  Calculate Total (with 8% tax)
  const double taxRate = 0.08;
  double preFactorialTotal = calculateSubtotal(step2Cart);
  double finalTotal = calculateSubtotal(step2Cart, taxRate: taxRate);
  
  //  Apply Factorial Discount
  print("\n Applying Factorial Discount ");
  int itemCount = step2Cart.length;
  // Calculate factorial recursively: n!
  int factor = factorial(itemCount);
  // Calculate discount percentage based on factorial (e.g., n! / 1000)
  double factorialDiscountRate = factor / 1000.0; 
  
  if (factorialDiscountRate > 0.0) {
    // Ensure discount doesn't exceed a reasonable limit (e.g., 20%)
    double actualDiscountRate = factorialDiscountRate.clamp(0.0, 0.20); 
    double discountAmount = preFactorialTotal * actualDiscountRate;
    finalTotal = finalTotal - discountAmount;
    
    print("  Item Count: $itemCount");
    print("  Factorial ($itemCount!): $factor");
    print("  Extra Discount Rate: ${(actualDiscountRate * 100).toStringAsFixed(2)}%");
    print("  Discount Amount: \$${discountAmount.toStringAsFixed(2)}");
  } else {
    print("  No extra factorial discount applied.");
  }
  
  // 5. Display Final Price
  print("\n Final Calculation ");
  print("Items remaining in cart: ${step2Cart.length}");
  print("Final Total Price (Tax Incl. & Factorial Discount Applied): **\$${finalTotal.toStringAsFixed(2)}**");
}
