// ignore_for_file: empty_constructor_bodies, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_pessoa/card.dart';
import 'package:lista_pessoa/model/Pessoa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Criar Pessoa",
      home: telaInicial(),
    );
  }
}

class telaInicial extends StatefulWidget {
  telaInicial({super.key});

  @override
  State<telaInicial> createState() => _telaInicialState();
}

class _telaInicialState extends State<telaInicial> {
  final controllerNome = TextEditingController();
  final controllerSobrenome = TextEditingController();
  final controllerIdade = TextEditingController();
  final controllerCPF = TextEditingController();

  List<Pessoa> listaP = [];

  void removerPessoa(int index) {
    setState(() {
      listaP.removeAt(index);
    });
  }

  void adicionarPessoa(String nome, int idade, String sobrenome, String cpf) {
    setState(() {
      listaP.add(
          Pessoa(nome: nome, idade: idade, sobrenome: sobrenome, cpf: cpf));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista de Pessoal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amberAccent[400],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.amber[200]),
          child: Center(
            child: SizedBox(
              width: 900,
              child: ListView.builder(
                itemCount: listaP.length,
                itemBuilder: (context, index) {
                  return CardP(
                      nome: listaP[index].nome,
                      sobrenome: listaP[index].sobrenome,
                      idade: listaP[index].idade.toString(),
                      onRemove: () => removerPessoa(index), CPF: listaP[index].cpf);
                },
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 500,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Adicionar Pessoa",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              width: 500,
                              child: TextField(
                                controller: controllerNome,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Nome",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              child: TextField(
                                controller: controllerSobrenome,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Sobrenome",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              child: TextField(
                                controller: controllerIdade,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Idade",
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              child: TextField(
                                controller: controllerCPF,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "CPF",
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(11),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(30)),
                            SizedBox(
                              width: 300,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    adicionarPessoa(
                                      controllerNome.text, 
                                      int.parse(controllerIdade.text), 
                                      controllerSobrenome.text, 
                                      controllerCPF.text);

                                      controllerNome.clear();
                                      controllerCPF.clear();
                                      controllerIdade.clear();
                                      controllerSobrenome.clear();
                                  },
                                  foregroundColor: Colors.amber[400],
                                  backgroundColor: Colors.white,
                                  child: const Text(
                                    "Adicionar Pessoa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            foregroundColor: Colors.amber[400],
            backgroundColor: Colors.white,
            child: const Icon(Icons.add)));
  }
}
