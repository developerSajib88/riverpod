import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/counter_app/counter_screen.dart';
import 'package:riverpod_practise/todo_app/todo_screen.dart';

void main()=> runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: double.infinity,height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [

          ElevatedButton.icon(
              onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=> const CounterScreen())),
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Counter App")
          ),

          const SizedBox(height: 10,),

          ElevatedButton.icon(
              onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=> const TodoScreen())),
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Todo App")
          )

        ],),
      ),
    );
  }
}

