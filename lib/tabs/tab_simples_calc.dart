import 'package:calculadoraimcflutter/widgets/botao_azul.dart';
import 'package:calculadoraimcflutter/widgets/controlador_linha_conta.dart';
import 'package:calculadoraimcflutter/widgets/linha_conta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

class TabSimplesCalc extends StatefulWidget {
  @override
  _TabSimplesCalcState createState() => _TabSimplesCalcState();
}

class _TabSimplesCalcState extends State<TabSimplesCalc> {
  List<Widget>? linhas;
  ControladorLinhaConta controlador = ControladorLinhaConta();

  List<Widget> _linhas() {
    if (linhas == null) {
      linhas = <Widget>[
        Container(
          color: Colors.redAccent,
          padding: EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              BotaoAzul(
                texto: "+",
                ao_clicar: () {
                  setState(() {
                    // Condição para evitar que o botão de + acione novas linhas sem que
                    // já tenhamos resultados das linhas anteriores
                    if ((linhas!.length-1) == controlador.obterQuantidadeResultados()) {
                      linhas!.add(
                        LinhaConta(
                          controladorLinhaConta: controlador,
                        ),
                      );
                    } else {
                      FToast.toast(
                        context,
                        msg: "Você deve terminar a operação anterior ( clicar em '=' ) ",
                        color: Colors.red ,
                        duration: 5000,
                        msgStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                        ),
                      );
                    }
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              BotaoAzul(
                texto: "-",
                ao_clicar: () {
                  setState(() {
                    linhas!.removeLast();
                    // Posso ter clicado ou não no operador "=" da LinhaConta
                    // se foi clicado a linha já tem valor no controlador, caso contrário não
                    // por isso se faz necessária essa validação
                    if (linhas!.length ==
                        controlador.obterQuantidadeResultados())
                      controlador.removerUltimoResultado();
                  });
                },
              ),
            ],
          ),
        ),
        LinhaConta(controladorLinhaConta: controlador),
      ];
    }
    return linhas!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Define as margens do Container
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        // No eixo y (principal da coluna) vai colocar
        // os objetos no topo
        mainAxisAlignment: MainAxisAlignment.start,
        children: _linhas(),
      ),
    );
  }
}
