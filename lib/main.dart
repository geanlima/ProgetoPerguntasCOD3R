import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(MyApp());

class _PerguntaAppState extends State<MyApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto':'Preto', 'pontuacao': 10},
        {'texto':'Vermelho', 'pontuacao': 5},
        {'texto':'Verde', 'pontuacao': 3},
        {'texto':'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto':'Coelho', 'pontuacao': 10},
        {'texto':'Cobra', 'pontuacao': 5},
        {'texto':'Elefante', 'pontuacao': 3},
        {'texto':'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto':'Maria', 'pontuacao': 10},
        {'texto':'João', 'pontuacao': 5},
        {'texto':'Leo', 'pontuacao': 3},
        {'texto':'Pedro', 'pontuacao': 1},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }    
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Peguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoresponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
