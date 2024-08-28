import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    HomeScreen(),
    ScheduleScreen(),
    InformationScreen(),
    CardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleAddButtonPressed() {
    String screenName = '';
    switch (_selectedIndex) {
      case 0:
        screenName = 'Home';
        break;
      case 1:
        screenName = 'Schedule';
        break;
      case 2:
        screenName = 'Information';
        break;
      case 3:
        screenName = 'Card';
        break;
    }

    _showCustomizationDialog(screenName);
  }

  void _showCustomizationDialog(String screen) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Customize $screen'),
          content: Text('Here you can customize your $screen screen.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$screen customized!')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMKN 4 BOGOR'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _handleAddButtonPressed,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to SMKN 4 Bogor',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'We are committed to providing excellent education and resources for our students.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.blueAccent),
              title: Text('Latest News'),
              subtitle: Text('Stay updated with the latest news and events at SMKN 4 Bogor.'),
              contentPadding: const EdgeInsets.all(16),
              onTap: () {
                // Add functionality for news section
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Class Schedule',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Table(
            border: TableBorder.all(
              color: Colors.grey,
              width: 1,
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                children: [
                  TableCell(child: Center(child: Text('Time', style: TextStyle(color: Colors.white)))),
                  TableCell(child: Center(child: Text('Monday', style: TextStyle(color: Colors.white)))),
                  TableCell(child: Center(child: Text('Tuesday', style: TextStyle(color: Colors.white)))),
                  TableCell(child: Center(child: Text('Wednesday', style: TextStyle(color: Colors.white)))),
                  TableCell(child: Center(child: Text('Thursday', style: TextStyle(color: Colors.white)))),
                  TableCell(child: Center(child: Text('Friday', style: TextStyle(color: Colors.white)))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('08:00 - 09:00'))),
                  TableCell(child: Center(child: Text('Math'))),
                  TableCell(child: Center(child: Text('Physics'))),
                  TableCell(child: Center(child: Text('Biology'))),
                  TableCell(child: Center(child: Text('Chemistry'))),
                  TableCell(child: Center(child: Text('English'))),
                ],
              ),
              // Add more rows as needed
            ],
          ),
        ],
      ),
    );
  }
}

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'School Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'SMKN 4 Bogor is dedicated to providing high-quality education in various fields. Our mission is to foster academic excellence and holistic development in students.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Our facilities include state-of-the-art classrooms, laboratories, and recreational areas. We also offer a variety of extracurricular activities to enrich students\' experience.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Identity Card',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SMKN 4 Bogor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Address: Jl. Raya Bogor No. 123, Bogor, Indonesia',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Phone: (0251) 1234567',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email: info@smkn4bogor.sch.id',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
