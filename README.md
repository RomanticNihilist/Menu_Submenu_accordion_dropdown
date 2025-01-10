# Flutter ML Menu

Flutter ML Menu is a versatile and customizable Flutter package that provides a dynamic menu system with support for submenus, theming, and flexible navigation. Ideal for applications that require multi-level menus, it includes built-in widgets to facilitate navigation and screen transitions.

## Features

- **Customizable Menus**: Define your menu items with titles, icons, submenus, and on-tap actions.
- **Theming Support**: Built-in support for light, dark, and system themes.
- **Nested Submenus**: Create nested menus with unlimited depth.
- **Screen Management**: Dynamically update the current screen based on menu selection.
- **Material Design**: Built with Flutter's Material Design principles for a clean and modern UI.

## Screenshot

![Alt text](https://i.imgur.com/tj76cmT.png "a title")

## Getting Started

### Installation
Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  Menu_Submenu_accordion_dropdown:
  git:
    url: https://github.com/RomanticNihilist/Menu_Submenu_accordion_dropdown.git
    ref: master
```

Then, run:

```sh
flutter pub get
```

### Usage

#### Basic Example
Here is a simple implementation to get you started:

```dart
import 'package:flutter/material.dart';
import 'package:Menu_Submenu_accordion_dropdown/menu_submenu_accordion_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentScreen = Center(child: Text('Welcome to Flutter ML Menu'));

  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Home',
      icon: Icons.home,
      onTap: () => Center(child: Text('Home Screen')),
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.settings,
      subItems: [
        MenuItem(
          title: 'Profile',
          icon: Icons.person,
          onTap: () => Center(child: Text('Profile Screen')),
        ),
      ],
    ),
  ];

  void updateScreen(Widget newScreen) {
    setState(() {
      currentScreen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter ML Menu')),
      drawer: Drawer(
        child: MenuWithSubMenu(menuItems, updateScreen),
      ),
      body: currentScreen,
    );
  }
}
```

### MenuItem Class
The `MenuItem` class allows you to define menu properties:

```dart
void main(){
  MenuItem(
    title: 'Menu Title',
    icon: Icons.example_icon,
    subItems: [
      MenuItem(
        title: 'Submenu Title',
        icon: Icons.sub_example_icon,
        onTap: () => Widget(),
      ),
    ],
    onTap: () => Widget(),
  ); 
}
```

## Screenshots
Hehe, No screenshots, nije run kore joto khushi dakho

## Contributing
Contributions are welcome! Pakamo marar aage amak jiggesh kore nebe

## License
[MIT License](LICENSE)
