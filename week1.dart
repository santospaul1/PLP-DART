void main() {
  //  Define Variables 
  print(" Define Variables & Print");
  defineAndPrintVariables();

  //  Type Conversion 
  print("\n Type Conversion (Manual Functions) ");
  typeConversionExamples();

  // Conversion Function 
  print("\n Conversion Function (convertAndDisplay) ");
  convertAndDisplay("42"); // Testing with an integer string
  convertAndDisplay("99.99"); // Testing with a double string

  // Control Flow 
  print("\nControl Flow ");
  controlFlowExamples();

  // Combine Data & Control Flow 
  print("\n--- 5. Combine Data & Control Flow ---");
  combineDataAndControlFlow();
}

// ---------------------------------------------
//                TASK 1
// ---------------------------------------------
void defineAndPrintVariables() {
  // int
  int age = 30;
  print("Integer (age): $age");

  // double
  double pi = 3.14159;
  print("Double (pi): $pi");

  // String
  String name = "Alice";
  print("String (name): $name");

  // bool
  bool isDartFun = true;
  print("Boolean (isDartFun): $isDartFun");

  // List<int>
  List<int> primeNumbers = [2, 3, 5, 7, 11];
  print("List<int> (primeNumbers): $primeNumbers");
}

// ---------------------------------------------
//                TASK 2 (Helper Functions)
// ---------------------------------------------

// Convert String to int
int stringToInt(String s) => int.parse(s);

// Convert String to double
double stringToDouble(String s) => double.parse(s);

// Convert int to String
String intToString(int i) => i.toString();

// Convert int to double
double intToDouble(int i) => i.toDouble();


void typeConversionExamples() {
  // String conversions
  String numStr = "123";
  String doubleStr = "45.67";
  print("  String '$numStr' -> int: ${stringToInt(numStr)}");
  print("  String '$doubleStr' -> double: ${stringToDouble(doubleStr)}");

  // int conversions
  int myInt = 100;
  print("  int $myInt -> String: '${intToString(myInt)}'");
  print("  int $myInt -> double: ${intToDouble(myInt)}");
}

// ---------------------------------------------
//                TASK 3
// ---------------------------------------------
void convertAndDisplay(String number) {
  try {
    // Convert to int
    int intValue = int.parse(number);
    print("  Input String: '$number' -> Converted to int: $intValue");

    // Convert to double
    double doubleValue = double.parse(number);
    print("  Input String: '$number' -> Converted to double: $doubleValue");
  } catch (e) {
    print("  Error converting '$number': $e");
  }
}

// ---------------------------------------------
//                TASK 4
// ---------------------------------------------
void controlFlowExamples() {
  // --- If-Else: Positive/Negative/Zero ---
  print("\n  --- If-Else: Positive/Negative/Zero ---");
  int number = -5;
  if (number > 0) {
    print("  $number is **Positive**.");
  } else if (number < 0) {
    print("  $number is **Negative**.");
  } else {
    print("  $number is **Zero**.");
  }

  // --- If-Else: Voting Eligibility ---
  print("\n  --- If-Else: Voting Eligibility ---");
  int voterAge = 20;
  int votingAge = 18;
  if (voterAge >= votingAge) {
    print("  Age $voterAge: Eligible to **Vote**.");
  } else {
    print("  Age $voterAge: Not eligible to vote. Need $votingAge+.");
  }

  // --- Switch Case: Day of the Week ---
  print("\n  --- Switch Case: Day of the Week ---");
  int day = 3;
  String dayName;
  switch (day) {
    case 1:
      dayName = "Sunday";
      break;
    case 2:
      dayName = "Monday";
      break;
    case 3:
      dayName = "Tuesday"; // Will execute this one
      break;
    case 4:
      dayName = "Wednesday";
      break;
    case 5:
      dayName = "Thursday";
      break;
    case 6:
      dayName = "Friday";
      break;
    case 7:
      dayName = "Saturday";
      break;
    default:
      dayName = "Invalid Day";
  }
  print("  Day $day is **$dayName**.");

  // --- Loops: for loop (1 to 10) ---
  print("\n  --- Loops: for loop (1 to 10) ---");
  String forOutput = "";
  for (int i = 1; i <= 10; i++) {
    forOutput += "$i ";
  }
  print("  $forOutput");

  // --- Loops: while loop (10 to 1) ---
  print("\n  --- Loops: while loop (10 to 1) ---");
  String whileOutput = "";
  int j = 10;
  while (j >= 1) {
    whileOutput += "$j ";
    j--;
  }
  print("  $whileOutput");

  // --- Loops: do-while loop (1 to 5) ---
  print("\n  --- Loops: do-while loop (1 to 5) ---");
  String doWhileOutput = "";
  int k = 1;
  do {
    doWhileOutput += "$k ";
    k++;
  } while (k <= 5);
  print("  $doWhileOutput");
}

// ---------------------------------------------
//                TASK 5
// ---------------------------------------------
void combineDataAndControlFlow() {
  List<int> numbers = [5, 22, 105, 1, 50, 11];

  print("  Iterating List: $numbers");

  for (int num in numbers) {
    String parity = (num % 2 == 0) ? "Even" : "Odd";
    String category;

    // Categorization using switch
    switch (num) {
      case >= 101:
        category = "Large (101+)";
        break;
      case >= 11:
        category = "Medium (11-100)";
        break;
      case >= 1:
        category = "Small (1-10)";
        break;
      default:
        category = "Other";
    }

    print("  Number **$num**: $parity, Category: **$category**");
  }
}
