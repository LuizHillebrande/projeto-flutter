
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final TextEditingController pesquisaController = TextEditingController();

  String mensagem = "";
  bool erro = false;

  // valida e realiza a pesquisa
  void pesquisar() {
    String consulta = pesquisaController.text.trim(); //remove espacos desnecessarios

    if (consulta.isEmpty) {
      setState(() {
        mensagem = "digite o nome de uma receita para pesquisar.";
        erro = true;
      });
    } else {
      setState(() {
        mensagem = "você pesquisou por: $consulta";
        erro = false;
      });
    }
  }

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        title: const Text("MINHAS RECEITAS"),
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
                "Bem-vindo ao Minhas Receitas!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Encontre inspiração para preparar "
                    "pratos deliciosos no seu dia a dia!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF795548),
                ),
              ),

              const SizedBox(height: 30),

              const Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: Color(0xFFE67E22),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Diversas receitas para descobrir",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5D4037),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              TextField(
                controller: pesquisaController,
                decoration: InputDecoration(
                  labelText: "Pesquisar receita",
                  hintText: "Digite o nome da receita",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: pesquisar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE67E22),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    "PESQUISAR",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: erro ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
