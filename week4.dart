import 'dart:io';
import 'dart:convert'; // For json encoding/decoding

// --- Core Utility Functions (Pure Logic) ---

/// 🔤✨ Handles string manipulation tasks.
class StringUtility {
  // Concatenation
  static String concatenate(String a, String b) => a + ' ' + b;

  // Reversing
  static String reverse(String input) {
    return input.split('').reversed.join('');
  }

  // Changing Case (to Title Case)
  static String toTitleCase(String input) {
    if (input.isEmpty) return '';
    return input.toLowerCase().split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }
}

/// 📊 Handles collection manipulation tasks.
class CollectionUtility {
  // Use a List
  static List<String> processList(List<String> list, String newItem) {
    final updatedList = List<String>.from(list); // Create a mutable copy
    updatedList.add(newItem);
    return updatedList;
  }

  // Use a Set (to find unique words)
  static Set<String> findUniqueWords(String sentence) {
    final words = sentence.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '').split(RegExp(r'\s+'));
    return words.where((word) => word.isNotEmpty).toSet();
  }

  // Use a Map (to count word frequency)
  static Map<String, int> countWordFrequency(String sentence) {
    final words = sentence.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '').split(RegExp(r'\s+'));
    final wordCounts = <String, int>{};
    for (var word in words) {
      if (word.isNotEmpty) {
        wordCounts[word] = (wordCounts[word] ?? 0) + 1;
      }
    }
    return wordCounts;
  }
}

/// ⏳🗓️ Handles date and time operations.
class DateTimeUtility {
  // Get formatted date and time
  static String getFormattedDateTime(DateTime dateTime) {
    return '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} '
           '${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}';
  }

  // Calculate time difference (in days)
  static int calculateDifferenceInDays(DateTime start, DateTime end) {
    final difference = end.difference(start);
    // Convert to absolute days difference
    return difference.inDays.abs();
  }

  // Helper for padding single digits
  static String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

/// 📂✍️ Handles file read/write operations with error management.
class FileHandler {
  final String inputFilePath;
  final String outputFilePath;

  FileHandler(this.inputFilePath, this.outputFilePath);

  /// Reads content from the input file.
  Future<String> readFile() async {
    try {
      final file = File(inputFilePath);
      // Check if the file exists before reading
      if (!await file.exists()) {
        print('Warning: Input file not found. Returning empty string.');
        return '';
      }
      // Read the file content as a single string
      return await file.readAsString();
    } on FileSystemException catch (e) {
      print('Error reading file: ${e.message}');
      return '';
    } catch (e) {
      print('An unknown error occurred while reading the file: $e');
      return '';
    }
  }

  /// Writes content to the output file.
  Future<void> writeFile(String content) async {
    try {
      final file = File(outputFilePath);
      // Write the content string to the file
      await file.writeAsString(content);
      print('Successfully wrote to $outputFilePath');
    } on FileSystemException catch (e) {
      print('Error writing file: ${e.message}');
    } catch (e) {
      print('An unknown error occurred while writing the file: $e');
    }
  }
}

// --- Main Application Logic ---

Future<void> main() async {
  print('✨ Dart Utility Application Started ✨');
  final fileHandler = FileHandler('input.txt', 'output.txt');

  // 1. Get User Input
  stdout.write('Enter a string for manipulation: ');
  final userInput = stdin.readLineSync() ?? 'default input string';

  final entryTime = DateTime.now();

  // 2. String Manipulation
  print('\n--- String Manipulation ---');
  final reversed = StringUtility.reverse(userInput);
  final titleCase = StringUtility.toTitleCase(userInput);
  final concatenated = StringUtility.concatenate(userInput, 'processed by utility');

  print('Original: "$userInput"');
  print('Reversed: "$reversed"');
  print('Title Case: "$titleCase"');
  print('Concatenated: "$concatenated"');

  // 3. Collections
  print('\n--- Collections ---');
  final uniqueWords = CollectionUtility.findUniqueWords(userInput);
  final wordFrequency = CollectionUtility.countWordFrequency(userInput);
  final list = CollectionUtility.processList(['apple', 'banana'], 'cherry');

  print('Unique Words: $uniqueWords');
  print('Word Frequency: $wordFrequency');
  print('Updated List: $list');

  // 4. Date and Time
  print('\n--- Date and Time ---');
  final formattedTime = DateTimeUtility.getFormattedDateTime(entryTime);
  final pastDate = DateTime(entryTime.year - 1, entryTime.month, entryTime.day);
  final daysDifference = DateTimeUtility.calculateDifferenceInDays(entryTime, pastDate);

  print('Entry Time (Formatted): $formattedTime');
  print('Days since one year ago: $daysDifference days');

  // 5. File Handling & Combining Elements (Logging Results)
  print('\n--- File Handling ---');

  // Read existing content (or empty string if file doesn't exist)
  final existingContent = await fileHandler.readFile();
  
  // Prepare the new log entry as a Map for easy JSON serialization
  final logEntry = {
    'timestamp': entryTime.toIso8601String(), // ISO format for storage
    'formatted_time': formattedTime,
    'user_input': userInput,
    'reversed_string': reversed,
    'unique_words_count': uniqueWords.length,
    'list_example': list,
  };

  // The content to be written: existing content + new JSON log entry
  final newContent = existingContent + jsonEncode(logEntry) + '\n';
  
  await fileHandler.writeFile(newContent);
  print('Log entry added to output.txt: ${jsonEncode(logEntry)}');
  
  print('\n✨ Dart Utility Application Finished ✨');
}
