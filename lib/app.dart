import 'package:flutter/material.dart';
import 'package:tarefas/tarefa_page.dart';
import 'package:tarefas/tarefa_state.dart';
import 'package:tarefas/tarefas_helper.dart';
import 'package:tarefas/tarefas_helper_impl.dart';
import 'package:tarefas/tarefas_novo.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    TarefaState state = TarefaState();
    TarefasHelper helper = TarefasHelperImpl(); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: "/",
      routes: {"/":(context)=>TarefasPage(state: state,),
               "/add":(context)=>TarefasNovo(state: state,helper: helper,)},
      
    );
  }
}