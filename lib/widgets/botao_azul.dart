import 'package:flutter/material.dart';

class BotaoAzul extends StatelessWidget {
  String texto;
  double tamanho_fonte;
  Color cor_fonte;
  Function ao_clicar;
  FocusNode marcador_foco;

  BotaoAzul({
        this.texto = "",
        this.tamanho_fonte = 20,
        this.cor_fonte = Colors.white,
        @required this.ao_clicar,
        this.marcador_foco = null,
    });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        texto,
        style: TextStyle(
          color:  cor_fonte,
          fontSize: tamanho_fonte
        )
      ),
      onPressed: ao_clicar,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
    //      side: BorderSide(color: Colors.white)
      ),
      focusNode: marcador_foco,
    );
  }
}
