This is a simple implementation of an expandable floating action button.

## Features

This package gives an easy way to add an expandable floating action with fade transitions.

## Getting started

Download the package and use as in the example.

## Usage

```dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAB Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      centralButton: CentralFABData(
        onTap: () {},
        minimizedIcon: Icons.arrow_back,
        expandedIcon: Icons.alarm_off,
      ),
      buttonList: [
        FABData(onTap: () {
          print('first button tap');
        }),
        FABData(onTap: () {
          print('second button tap');
        }),
        FABData(onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          ));
        }),
      ],
      scaffoldToBeWrapped: Scaffold(
        appBar: AppBar(
          title: const Text('Appbar'),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        height: 10,
        width: 10,
        color: Colors.blue,
      )),
    );
  }
}

```
