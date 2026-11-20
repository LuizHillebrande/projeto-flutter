
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        title: const Text("SOBRE"),
        backgroundColor: const Color(0xFFE67E22),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          width: double.infinity,

          decoration: BoxDecoration(
            color: const Color(0xFFFFE8D2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE67E22),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.restaurant,
                size: 70,
                color: Color(0xFFE67E22),
              ),

              const SizedBox(height: 20),

              const Text(
                "Minhas Receitas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Um aplicativo desenvolvido para "
                    "facilitar a busca e descoberta de receitas.",
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
                  child: const Text("VOLTAR"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
