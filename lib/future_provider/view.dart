import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/future_provider/controller.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: double.infinity,height: double.infinity,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final finalData = ref.watch(findData);
         return finalData.when(
             data: (data){
               return ListView.builder(
                 itemCount: data?.products.length,
                 itemBuilder: (context,index){
                   return ListTile(
                     leading: Image.network(data?.products[index].images[0].toString()??"",width: 100,height: 80,),
                     title: Text(data?.products[index].title.toString()??"",
                       style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                     ),
                     subtitle: Text(data?.products[index].description.toString()??""),
                     trailing: Text("\$ ${data?.products[index].price.toString()??""}"),
                   );
                 },
               );
             },
             error: (error,stackTrace)=> Text(error.toString()),
             loading: ()=> const Center(child: CircularProgressIndicator())
         );
        },
      ))
    );
  }
}
