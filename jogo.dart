import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  static AssetImage imagemApp = const AssetImage("images/padrao.png");
  static List <String> msgs = [
    "JokePo",
    "Escolha do App:",
    "Escolha do Usuário:",
    "Você Perdeu!",
    "Você Ganhou!!",
    "Empatou!"
  ];
  static String placar = msgs[2];
  // Métodos
  opcaoSelecionada(String escolhaUsuario) {
    List<String> opcoes = [
      "pedra",
      "papel",
      "tesoura"
    ];
    int numero = Random().nextInt(3);
    String escolhaApp = opcoes[numero];
    switch(escolhaApp) {
      case "pedra" :
        setState( () => {
          imagemApp = const AssetImage("images/pedra.png")
        });
        break;
      case "papel" :
        setState(() => {
          imagemApp = const AssetImage("images/papel.png")
        });
        break;
      case "tesoura" :
        setState( () => {
          imagemApp = const AssetImage("images/tesoura.png")
        });
        break;
    }
    // Validação do ganhador
    if(
      (escolhaUsuario == "pedra" &&  escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
        placar = msgs[4];
    }
    else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaUsuario == "papel" && escolhaUsuario == "pedra")
    ) {
        placar = msgs[3];
    }
    else {
        placar = msgs[5];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          msgs[0],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  msgs[1],
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
              child:
                    Image(
                      image: imagemApp,
                      fit: BoxFit.contain,
                    ),
            ),
            Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  placar,
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => {
                          opcaoSelecionada("pedra")
                        },
                        child:
                          const Image(
                            image: AssetImage(
                              "images/pedra.png"
                            ),
                            width: 100,
                          )
                    ),
                    GestureDetector(
                      onTap: () => {
                        opcaoSelecionada("papel")
                      },
                      child:
                        const Image(
                          image: AssetImage(
                            "images/papel.png"
                          ),
                          fit: BoxFit.contain,
                          width: 100
                        ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        opcaoSelecionada("tesoura")
                      },
                      child:
                        const Image(
                          image: AssetImage(
                          "images/tesoura.png"
                          ),  
                          width: 100,
                          fit: BoxFit.contain,
                        )
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
