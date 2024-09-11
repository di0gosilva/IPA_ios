import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String textInfo = "Insire seus dados!";

  void reset() {
    setState(() {
      peso.text = "";
      altura.text = "";
      textInfo = "Insire seus dados!";
    });
  }

  void calcularIMC() {
    setState(() {
      double imc = 0.0;
      double novoPeso = double.parse(peso.text);
      double novaAltura = double.parse(altura.text);
      imc = novoPeso / ((novaAltura / 100) * (novaAltura / 100));
      textInfo = "Seu IMC é ${imc.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 81, 185),
        actions: [
          IconButton(
            onPressed: reset,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person,
              size: 144,
              color: Color.fromARGB(255, 147, 81, 185),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: peso,
              decoration: const InputDecoration(
                labelText: "Peso (kg)",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 147, 81, 185))),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 147, 81, 185),
                  fontSize: 24,
                ),
              ),
              style: const TextStyle(
                  color: Color.fromARGB(255, 147, 81, 185), fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: altura,
              decoration: const InputDecoration(
                labelText: "Altura (cm)",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 147, 81, 185))),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 147, 81, 185),
                  fontSize: 24,
                ),
              ),
              style: const TextStyle(
                  color: Color.fromARGB(255, 147, 81, 185), fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: calcularIMC,
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 147, 81, 185),
                  fixedSize: const Size(0, 65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text(
                "Calcular",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textInfo,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 147, 81, 185),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
