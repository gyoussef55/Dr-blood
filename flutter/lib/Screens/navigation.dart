import 'package:cancer_blood/Screens/detect_screen.dart';
import 'package:cancer_blood/Screens/home_screen.dart';
import 'package:cancer_blood/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _selectedPageIndex = 1;
  Widget activePage = HomeScreen();
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;

      switch (_selectedPageIndex) {
        case 0:
          activePage = HomeScreen();
        case 1:
          activePage = const DetectScreen();
        case 2:
          signOut();
          
      }
    });
  }

  void signOut(){
    _signOut();
    Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );

  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        title: ListTile(
          title: Image.asset(
            'assets/Icon.png',
            width: 58,
            height: 89,
          ),
          subtitle: const Text(
            'Cancer Blood',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              width: 32,
              height: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/detect.png',
              width: 32,
              height: 32,
            ),
            label: 'Detect',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/exit.png',
              width: 32,
              height: 32,
            ),
            label: 'Exit',
          ),
        ],
      ),
    );
  }
}
