import 'package:flutter_riverpod/flutter_riverpod.dart';

///According to singleton design pattern
final counter = StateNotifierProvider<CounterController,int>((ref) => CounterController());

class CounterController extends StateNotifier<int>{
  CounterController():super(0);

  void incrementCount(){
    state++;
  }

  void decrementCount(){
    state--;
  }

}