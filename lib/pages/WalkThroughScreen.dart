import 'package:flutter/material.dart';
import 'package:home_services_app/auth/loginScreen.dart';
import 'package:home_services_app/pages/Homepage.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> walkthroughData = [
    {
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg09JeoGUTvZ8-cYotSuukDA-tG-2jIrnFEg&s',
      'title': 'Welcome to Home Services',
      'subtitle':
      'Your one-stop solution for all home repair and maintenance needs.',
    },
    {
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4E7XILzr5PWatPF-Utflobm3UFkJi4ILOpg&s',
      'title': 'Professional Services',
      'subtitle':
      'Find skilled professionals for every job, from plumbing to cleaning.',
    },
    {
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6XvJ_vOeN1joqBBO1PWbtP-2KSYYPLNed0w&s',
      'title': 'Easy Booking',
      'subtitle':
      'Book services quickly and conveniently at your preferred time.',
    },
  ];

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: walkthroughData.length,
              itemBuilder: (context, index) {
                final data = walkthroughData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      data['image']!,
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 20),
                    Text(
                      data['title']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        data['subtitle']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              walkthroughData.length,
                  (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: _currentPage == walkthroughData.length - 1
                  ? _navigateToHomeScreen
                  : () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                _currentPage == walkthroughData.length - 1
                    ? 'Get Started'
                    : 'Next',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
