import 'package:flutter/material.dart';


void main(){
  runApp(const MaterialApp(
    home: MyApp(),
  )
  );
}

class MenuItem {
  final String title;
  final IconData icon;
  final List<MenuItem>? subItems;
  final Widget Function()? onTap;

  MenuItem({
    required this.title,
    required this.icon,
    this.subItems,
    this.onTap,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Define the light theme
      darkTheme: ThemeData.dark(), // Define the dark theme
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Flutter ML Menu',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}
class BodyComponent extends StatelessWidget{
  const BodyComponent({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Content Container
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    Text(
                      'Welcome to IKON Orchestration Platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // Description
                    Text(
                      'The only true OpenAI-enabled Orchestration Platform that will solve all your challenges and successfully implement your functional and technical roadmap.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    // Image
                    Image.asset(
                      'assets/welcome_screen_actual.png',
                      width: size.width * 0.9,
                      height: size.height * 0.35,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Settings
                      // You can navigate to a Settings screen or open a settings modal
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.1,
                      ),
                    ),
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: size.width * 0.035),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Open the modal
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.1,
                      ),
                    ),
                    child: Text(
                      'Subscribe the Apps',
                      style: TextStyle(fontSize: size.width * 0.035, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWithSubMenu extends StatefulWidget {
  // final Widget currentScreen;
  final List<MenuItem> menuItems;
  final Function(Widget) onMenuItemSelected; // Callback function
  //const MenuWithSubMenu(this.onMenuItemSelected, {super.key});
  const MenuWithSubMenu(this.menuItems, this.onMenuItemSelected, {super.key});

  @override
  State<MenuWithSubMenu> createState() => _MenuWithSubMenuState();
}

class _MenuWithSubMenuState extends State<MenuWithSubMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: widget.menuItems.map((menuItem) {
            if (menuItem.subItems != null && menuItem.subItems!.isNotEmpty) {
              return Card(
                child: ExpansionTile(
                  title: Text(menuItem.title),
                  leading: Icon(menuItem.icon),
                  children: menuItem.subItems!.map((subItem) {
                    return ListTile(
                      title: Text(subItem.title),
                      trailing: Icon(subItem.icon),
                      onTap: () {
                        Navigator.pop(context);
                        if (subItem.onTap != null) {
                          // subItem.onTap!();
                          widget.onMenuItemSelected(subItem.onTap!());
                        }
                      },
                    );
                  }).toList(),
                ),
              );
            } else {
              return Card(
                child: ListTile(
                  title: Text(menuItem.title),
                  leading: Icon(menuItem.icon),
                  onTap: () {
                    Navigator.pop(context);
                    if (menuItem.onTap != null) {
                      // menuItem.onTap!();
                      widget.onMenuItemSelected(menuItem.onTap!());
                    }
                  },
                ),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentScreen = const BodyComponent();

  void updateScreen(Widget newScreen) {
    setState(() {
      currentScreen = newScreen; // Update the screen
    });
  }

  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Top Products',
      icon: Icons.production_quantity_limits,
      subItems: List.generate(3, (index) {
        return MenuItem(
          title: 'Product ${index + 1}',
          icon: Icons.production_quantity_limits,
          onTap: () {
            // Perform navigation or actions here
            return Center(child: Text('Product ${index + 1}'));
          },
        );
      }),
    ),
    MenuItem(
      title: 'Home',
      icon: Icons.home,
      subItems: [
        MenuItem(
          title: 'Chart',
          icon: Icons.ac_unit,
          onTap: () {
            // Perform navigation or actions here
            return Text("Chart Screen");
          },
        ),
        MenuItem(
          title: 'Feedback Form',
          icon: Icons.ac_unit,
          onTap: () {
            // Perform navigation or actions here
            return Text("Feedback Form Screen");
          },
        ),
        MenuItem(
          title: 'Alert',
          icon: Icons.ac_unit,
          onTap: () {
            // Perform navigation or actions here
            return Text("Alert Screen");
          },
        ),
        MenuItem(
          title: 'Calender',
          icon: Icons.ac_unit,
          onTap: () {
            // Perform navigation or actions here
            return Text("Calender Screen");
          },
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        drawer: Drawer(
          // Use Drawer widget here
          // child: MenuWithSubMenu(updateScreen),
          child: MenuWithSubMenu(menuItems, updateScreen),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Menu Submenu Sidebar",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: currentScreen,
      ),
    );
  }
}