import 'package:flutter/material.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier, 
      builder: (_, ThemeMode mode, __) {
        return MaterialApp( 
          debugShowCheckedModeBanner: false, 

          theme: ThemeData(
            scaffoldBackgroundColor:
                const Color.fromARGB(255, 243, 217, 228),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade200,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          darkTheme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(144, 30, 2, 31),
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
                foregroundColor: Colors.white70,
                side: const BorderSide(color: Colors.white24), // 👈 visible outline
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
     ),
            textTheme: const TextTheme(
             headlineMedium: TextStyle(
              fontSize: 24,
             fontWeight: FontWeight.bold,
             color: Colors.white70,
             ),
            ),

            iconTheme: const IconThemeData(
              color: Colors.white70, 
            ),
          ),
          themeMode: mode,

          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  //final VoidCallback onThemeToggle;
  //final bool isDarkMode;
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Portfolio"), centerTitle: true, backgroundColor:  const Color.fromARGB(255, 227, 141, 177),),
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Text(
          "Menu",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      
      SwitchListTile(
        title: const Text("Dark Mode"),
        secondary: const Icon(Icons.dark_mode),
        value: themeNotifier.value == ThemeMode.dark,
        onChanged: (value) {
          themeNotifier.value =
              value ? ThemeMode.dark : ThemeMode.light;
        },
      ),
      Padding(
  padding: const EdgeInsets.all(16.0),
  child: ElevatedButton.icon(
    icon: const Icon(Icons.person),
    label: const Text("Go to Profile"),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 48), // full width
    ),
    onPressed: () {
      // Close drawer
      Navigator.pop(context);},),),
    ],
  ),
),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 25),
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('portfolio.jpeg'),
                ),
                const SizedBox(width: 25),
                Column(
                  children: [
                    Text( 
                      "AVNI GOEL", 
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "IGDTUW CSE'29",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Tech-Enthusiast",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "avnigoel54@gmail.com",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
             Center(
              child: Text(
                "SKILLS",
                style: TextStyle(
                  color:  Color.fromARGB(208, 18, 2, 22),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 38),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    Skill(title: "DSA"),
                    const SizedBox(height: 10),
                    Skill(title: "Flutter Dev"),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(width:25),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Skill(title: "Machine Learning"),
                    const SizedBox(height: 10),
                    Skill(title: "Web Dev"),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(width: 15),
              ],
            ),
            const Divider(),
            Center(
              child: Text(
                "PROJECTS",
                style: TextStyle(
                  color: Color.fromARGB(208, 18, 2, 22),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Project(
                icon: Icons.checklist_rounded,
                title: "CheckList App",
                subtitle: "Cross-Platform Task Manager",
              ),
              Project(
                icon: Icons.person,
                title: "Mini PortFolio",
                subtitle: "A simple portfolio app using Flutter",
              ),
              Project(
                icon: Icons.wb_sunny,
                title: "Weather App",
                subtitle: "Real-time Weather Forecasting",
              ),
          ],
        ),
      ));
  }
}

class Skill extends StatelessWidget {
  final String title;

  const Skill({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
    margin: const EdgeInsets.only(bottom: 8),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(
          color: Color.fromARGB(255, 217, 142, 227), // border color
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color:  Color.fromARGB(255, 118, 2, 133),
          ),
        ),
      ),
    );
  }
}
class Project extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const Project({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, size: 32,// color: const Color.fromARGB(255, 44, 40, 47)),
            color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 207, 108, 232)
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 211, 155, 220)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  
