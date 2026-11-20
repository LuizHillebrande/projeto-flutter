
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String consulta;

  const Resultado({super.key, required this.consulta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        title: const Text("RESULTADOS"),
        backgroundColor: const Color(0xFFE67E22),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: const Color(0xFFFFE8D2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE67E22),
            ),
          ),

          child: Column(
            children: [
              const Icon(
                Icons.restaurant_menu,
                size: 70,
                color: Color(0xFFE67E22),
              ),

              const SizedBox(height: 20),

              const Text(
                "Resultado da pesquisa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Receitas pesquisadas: $consulta",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF795548),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Os resultados das receitas serão exibidos aqui.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF795548),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE67E22),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    "VOLTAR",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
