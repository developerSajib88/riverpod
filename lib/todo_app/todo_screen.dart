import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/todo_app/todo_controller.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final todoList = ref.watch(todo);

    return  Scaffold(
      body: SizedBox(width: double.infinity,height: double.infinity,
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(children: [

                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),


                  ),



                  validator: (value){
                    if(value.toString().isEmpty) {
                      return "This field is required";
                    }else{
                      return null;
                    }
                  },

                ),

                const SizedBox(height: 15,),

                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.green,width: 2)
                    ),

                  ),

                  validator: (value){
                    if(value.toString().isEmpty) {
                      return "This field is required";
                    }else{
                      return null;
                    }
                  },

                ),


                const SizedBox(height: 20,),


                ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        ref.read(todo.notifier).addTodo(titleController.text, descriptionController.text);
                        titleController.clear();descriptionController.clear();
                      }
                    },
                    child: const Text("Add Todo")
                ),

                const SizedBox(height: 20,),



                Expanded(
                    child: ListView.builder(
                      itemCount: todoList.length,
                        itemBuilder:(context,index){
                        return ListTile(
                          title: Text(todoList[index]["title"].toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                          subtitle: Text(todoList[index]["description"].toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: ()=>ref.read(todo.notifier).removeTodo(todoList[index]["title"].toString()),
                          ),
                        );
                        }
                    )
                )




              ],),
            ),
          )
      ),
      ),
    );
  }
}
