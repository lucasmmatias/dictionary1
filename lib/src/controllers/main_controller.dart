import 'package:flutter/cupertino.dart';
import 'package:viacep2/src/models/endereco_model.dart';

class MainController {
  String? word;
  // Campos:
  var campoEntrada = TextEditingController();
  var significado = Dicionario();
  // textos do alert:
  String? tituloAlert;
  String? meanings;
  String? definitions;
  String? definition;

  // Ações:

  Future<void> consultaPalavra() async {
    // Instanciar um objeto do tipo endereço:
    word = campoEntrada.text;
   try {
     
     List<Dicionario>  dicionario = await Dicionario.definicao(word.toString());
    //msgAlert = significado.definition;
    //tituloAlert = "Palavra";
    //dicionario[0].meanings![0].definitions![0].definition.toString();
    meanings = dicionario[0].meanings.toString();
    definitions = dicionario[0].meanings![0].definitions![0].toString();
    definition = dicionario[0].meanings![0].definitions![0].definition.toString();
    //return dicionario;
    }  catch (_) {
     definition = "this word could not be found";
    }
    

    
     
  }
}
