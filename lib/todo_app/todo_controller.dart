import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This instance according to Singleton design pattern
final todo = StateNotifierProvider<TodoController, List<Map<String,String>>>((ref) => TodoController());

class TodoController extends StateNotifier<List<Map<String,String>>>{
  TodoController():super([]);

  void addTodo(String title,description){
    state = [...state,{"title" : title,"description" : description}];
  }

  /// Remove todo from list State
  void removeTodo(String title,){

    state = [
      for(final filterList in state)
        if(filterList["title"] != title)filterList
    ];

    print(state);
  }

}