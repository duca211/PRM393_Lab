import 'package:flutter/material.dart';

//test commit
class Lab4 extends StatelessWidget {
  const Lab4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Lab 4 - Flutter UI Fundamentals")),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _menuItem(
              context,
              "Exercise 1 - Core Widgets Demo",
              const Exercise1Page(),
            ),
            _menuItem(
              context,
              "Exercise 2 - Input Controls Demo",
              const Exercise2Page(),
            ),
            _menuItem(
              context,
              "Exercise 3 - Layout Demo",
              const Exercise3Page(),
            ),
            _menuItem(
              context,
              "Exercise 4 - App Structure & Theme",
              const Exercise4Page(),
            ),
            _menuItem(
              context,
              "Exercise 5 - Common UI Fixes",
              const Exercise5Page(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}

class Exercise1Page extends StatelessWidget {
  const Exercise1Page({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Exercise 1 - Core Widgets Demo")),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome to Fultter UI",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.video_file, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Image.network('https://picsum.photos/300/150', height: 150),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.star, size: 40, color: Colors.grey),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Movie Item",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                // children: [
                                //   TextSpan(
                                //     text: "ListTile inside Card",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.normal,
                                //     ),
                                //   ),
                                // ],
                              ),
                            ),
                            const Text(
                              "This is a sample ListTitle inside a Card.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise2Page extends StatefulWidget {
  const Exercise2Page({super.key});
  @override
  State<Exercise2Page> createState() => _Exercise2PageState();
}

class _Exercise2PageState extends State<Exercise2Page> {
  int _rating = 50;
  bool _isActive = false;
  String _selectedGenre = "None";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Exercise 2 - Input Controls Demo")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rating (Slider)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: _rating.toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: const Color(0xFF5C6BC0),
                onChanged: (value) {
                  setState(() {
                    _rating = value.toInt();
                  });
                },
              ),
              Text(
                "Current value: $_rating",
                style: const TextStyle(color: Colors.black54),
              ),

              const SizedBox(
                height: 24,
              ), //tao khoang cach giua phan slider voi phan nay

              const Text(
                "Active (Switch)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: const Text(
                  "Is movie active?",
                  style: TextStyle(color: Colors.black87),
                ),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              const Text(
                "Genre (RadioListTile)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Action"),
                value: "Action",
                groupValue: _selectedGenre,
                onChanged: (value) {
                  setState(() {
                    _selectedGenre = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Comedy"),
                value: "Comedy",
                groupValue: _selectedGenre,
                onChanged: (value) {
                  setState(() {
                    _selectedGenre = value.toString();
                  });
                },
              ),
              Text(
                "Selected genre: $_selectedGenre",
                style: const TextStyle(color: Colors.black54),
              ),
              SizedBox(
                width: double.infinity, // Nút bấm dài hết chiều ngang
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F9),
                    foregroundColor: const Color(0xFF5C6BC0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                  },
                  child: const Text("Open Date Picker"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Movie {
  final String title;
  final String description;
  Movie({required this.title, required this.description});
}

class Exercise3Page extends StatelessWidget {
  const Exercise3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      Movie(title: "Avatar", description: "Sample description"),
      Movie(title: "Inception", description: "Sample description"),
      Movie(title: "Interstellar", description: "Sample description"),
      Movie(title: "Joker", description: "Sample description"),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Exercise 3 - Layout Demo")),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  "Now Playing",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItemCard(movie: movies[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieItemCard extends StatelessWidget {
  final Movie movie;
  const MovieItemCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE8EAF6),
              radius: 25,
              child: Text(
                movie.title[0],
                style: const TextStyle(
                  color: Color(0xFF3949AB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              movie.title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            subtitle: Text(
              movie.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final int index;
  const ItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: CircleAvatar(child: Text("$index"))),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Item: ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Title $index",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text("Sub-description here"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise4Page extends StatefulWidget {
  const Exercise4Page({super.key});
  @override
  State<Exercise4Page> createState() => _Exercise4PageState();
}

class _Exercise4PageState extends State<Exercise4Page> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Exercise 4 - App Structure & Theme"),
            actions: [
              Switch(
                value: _isDark,
                onChanged: (v) => setState(() => _isDark = v),
              ),
            ],
          ),
          body: const Center(
            child: Text("This is a simple screen with a theme toggle."),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class Exercise5Page extends StatelessWidget {
  const Exercise5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Exercise 5 - Common UI Fixes")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Correct ListView inside Column using Expanded",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.movie),
                      title: Text("Movie ${String.fromCharCode(65 + index)}"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
