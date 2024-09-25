import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardP extends StatelessWidget {
  final String nome;
  final String sobrenome;
  final String idade;
  final String CPF;
  final Function() onRemove;

  const CardP(
      {required this.nome,
      required this.sobrenome,
      required this.idade,
      required this.onRemove,
      required this.CPF});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[900],
      shadowColor: Colors.black45,
      elevation: 20,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "$nome",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),
                    ),
                    Text(
                      "$sobrenome",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "$idade anos",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
                ),
                const Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "CPF: $CPF",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                onRemove();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
