

class ControladorLinhaConta{
  List<String> resultados;

  ControladorLinhaConta(){
    resultados = List<String>();
  }

  void adicionarNovoResultado(String resultado){
    resultados.add(resultado);
  }

  int obterQuantidadeResultados(){
    return resultados.length;
  }

  String obterUltimoResultado(){
    return resultados[resultados.length - 1];
  }

  void removerUltimoResultado(){
    resultados.removeLast();
  }

  void modificarUltimoResultado(String resultado) {
    resultados[resultados.length - 1] = resultado;
  }
}

