
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:viacep2/src/controllers/main_controller.dart';
import 'package:viacep2/src/views/components/logo.dart';
import 'package:viacep2/src/views/components/titulo1.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
// Instanciar o controller:
  MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dictionary")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Logo(),
              const Titulo1(
                txt: "type a word below",
              ),
              // Pacote masked_text do pub.dev: https://pub.dev/packages/masked_text
              TextField(
                controller: controller.campoEntrada,
                maxLength: 15,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: "type a word"),
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    await controller.consultaPalavra();
                    setState(() {
                      // chamar o método para buscar o cep:
                    //await controller.consultaCep();
                    showOkAlertDialog(context: context, title: controller.tituloAlert, message: controller.definition);
                    //log(controller.end.bairro.toString());
                    });
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("search"))
            ],
          ),
        ),
      ),
    );
  }
}
