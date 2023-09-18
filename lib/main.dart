import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formController = GlobalKey<FormState>();
  TextEditingController weightFieldController = TextEditingController();
  TextEditingController heightFieldController = TextEditingController();
  String _resultText = '';

  void _clearResult() {
    setState(() {
      weightFieldController.clear();
      heightFieldController.clear();
      _formController.currentState!.reset();
      _resultText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Calculadora IMC'),
        actions: <Widget>[
          IconButton(onPressed: _clearResult, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.person,
                size: 200,
                color: Colors.brown,
              ),
              Text(
                _resultText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
