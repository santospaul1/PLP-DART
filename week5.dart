import 'package:flutter/material.dart';

// The main function where the application execution begins.
void main() {
  runApp(const MyApp());
}

// A StatelessWidget to define the core of the application.
// Since the structure of the overall app doesn't change, we use a StatelessWidget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We use MaterialApp to provide the base theme and navigation structure.
    return MaterialApp(
      title: 'Stunning Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Defining a vibrant primary color for a stunning look.
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

// A StatelessWidget for the main content screen.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // A constant URL for a placeholder image.
  // Using a beautiful high-contrast abstract image.
  static const String imageUrl =
      'https://picsum.photos/400/250?random=12'; 

  void _handleButtonPressed() {
    // Action to perform when the button is clicked.
    // This message will appear in the console (or terminal) where the app is running.
    print('✅ Button Clicked! Welcome message confirmed in the console.');
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual structure (AppBar, Body, etc.).
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stunning Flutter Demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      // The body contains the main content, centered for a polished look.
      body: Center(
        child: SingleChildScrollView( // Allows content to scroll if the screen is small
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to full width
            children: <Widget>[
              // 1. Image Widget (Displayed first)
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Rounded corners for aesthetics
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 250,
                      color: Colors.deepPurple[50],
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.red[100],
                      child: const Center(
                        child: Text('Failed to load image 🖼️', style: TextStyle(color: Colors.red)),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32.0), // Spacing after the image

              // 2. Welcome Message Text Widget
              const Text(
                'Welcome to the Stunning App!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 12.0), // Spacing for subtitle

              const Text(
                'Your simple, polished, and fully functional Flutter demo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40.0), // Spacing before the button

              // 3. Interactive Button (ElevatedButton)
              ElevatedButton(
                onPressed: _handleButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent, // Use accent color for contrast
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Confirm & Log Message 💬',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 20.0), // Spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
