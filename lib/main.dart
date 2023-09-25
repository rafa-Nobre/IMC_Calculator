import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC Calculator',
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
  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  TextEditingController weightFieldController = TextEditingController();
  TextEditingController heightFieldController = TextEditingController();
  String _resultText = '';

  void _calculateIMC() {
    setState(() {
      double weight = double.parse(weightFieldController.text);
      double height = double.parse(heightFieldController.text) / 100;
      double imcResult = weight / (height * height);

      if (imcResult < 18.6) {
        _resultText = "Abaixo do peso (${imcResult.toStringAsPrecision(4)})";
      } else if (imcResult >= 18.6 && imcResult < 24.9) {
        _resultText = "Peso ideal (${imcResult.toStringAsPrecision(4)})";
      } else if (imcResult >= 24.9 && imcResult < 29.9) {
        _resultText = "Levemente acima do peso (${imcResult.toStringAsPrecision(4)})";
      } else if (imcResult >= 29.9 && imcResult < 34.9) {
        _resultText = "Obesidade Grau I (${imcResult.toStringAsPrecision(4)})";
      } else if (imcResult >= 34.9 && imcResult < 39.9) {
        _resultText = "Obesidade Grau II (${imcResult.toStringAsPrecision(4)})";
      } else if (imcResult >= 40) {
        _resultText = "Obesidade Grau III (${imcResult.toStringAsPrecision(4)})";
      }
    });
  }

  void _clearResult() {
    _formController.currentState!.reset();
    weightFieldController.clear();
    heightFieldController.clear();
    setState(() {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 200,
                  color: Colors.brown,
                ),
                TextFormField(
                  controller: weightFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Peso(Kg)')),
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: heightFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Altura(cm)')),
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () {
                      if (_formController.currentState!.validate()) _calculateIMC();
                    },
                    child: const Text('Calcular')),
                Text(
                  _resultText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
