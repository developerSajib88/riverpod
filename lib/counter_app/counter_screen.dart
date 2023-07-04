import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_controller.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final countValue = ref.watch(counter);
    return  Scaffold(
      body: SizedBox(width: double.infinity,height: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(countValue.toString(),style: const TextStyle(color: Colors.black54,fontSize: 20),),

          const SizedBox(height: 20,),

          Row(mainAxisAlignment:MainAxisAlignment.center,children: [
            FloatingActionButton(
              onPressed: ()=> ref.read(counter.notifier).incrementCount(),
              child: const Icon(Icons.add),
            ),

            const SizedBox(width: 20,),


            FloatingActionButton(
              onPressed: ()=>ref.read(counter.notifier).decrementCount(),
              child: const Icon(Icons.remove),
            ),

          ],),





        ],
      ),),
    );
  }
}
