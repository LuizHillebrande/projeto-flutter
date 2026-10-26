
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111326),

      appBar: AppBar(
        title: const Text("IMPOSTOR"),
        backgroundColor: const Color(0xFF292044),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: const Color(0xFF27213F),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF8B5CF6),
            ),
          ),

          child: Column(
            children: [
              const Icon(
                Icons.visibility_off,
                size: 70,
                color: Color(0xFFC4B5FD),
              ),

              const SizedBox(height: 20),

              const Text(
                "Quem é o impostor?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Descubra quem está mentindo "
                    "antes que seja tarde!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB8B9D0),
                ),
              ),

              const SizedBox(height: 30),

              const Row(
                children: [
                  Icon(
                    Icons.people,
                    color: Color(0xFFC4B5FD),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "De 3 a 10 jogadores",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    "COMEÇAR JOGO",
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
