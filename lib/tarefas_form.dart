import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefasForm extends StatefulWidget {
  const TarefasForm({super.key});

  @override
  State<TarefasForm> createState() => _TarefasFormState();
}

class _TarefasFormState extends State<TarefasForm> {
  final _dateController = TextEditingController();  // controla o estado do campo da data 

  final _formKey = GlobalKey<FormState>();  // Controla o estado do formulário

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Form(

            key: _formKey,  // relaciona o controlador de estado do formulário

          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    label: Text("Descrição"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _dateController, // controlador associado
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 360)));
                  print(data);
                  if (data != null) {
                    String dataFormata =
                        DateFormat("dd-MM-yyyy").format(data);
                    _dateController.text = dataFormata;
                  }
                },
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    label: Text("Prazo"), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {

                // executa a validação do formulário
                if (_formKey.currentState!.validate()){
                    _formKey.currentState!.save();  // solicita ao formulário que salve os dados 
                }
              }, child: Text("Salvar"))
            ],
          ),
        ));
  }
}
