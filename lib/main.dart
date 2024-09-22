import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "learning_approach",
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pages = [
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(color: Colors.pink),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.amber,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigation Rail",
          style: TextStyle(fontSize: 35),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Row(
        children: [
          NavigationRail(
              onDestinationSelected: (int index) {
                _selectedIndex = index;
                setState(() {});
              },
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.blueGrey,
              indicatorColor: Colors.blue,
              elevation: 5,
              //extended: true,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  label: Text("Search"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_bag),
                  label: Text("Shopping"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text("Favorite"),
                ),
              ],
              selectedIndex: _selectedIndex),
          Expanded(
            child: _pages[_selectedIndex],
          )
        ],
      ),
    );
  }
}
