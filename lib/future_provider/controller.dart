import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/future_provider/model.dart';
import 'package:http/http.dart' as http;


/// Instance create according to Singleton design pattern
final dataProvider = Provider((ref)=> ApiService());
final findData = FutureProvider<Model?>((ref) => ref.read(dataProvider).getData());

class ApiService{

  Model? model;
  String apiUri = "https://dummyjson.com/products/category/smartphones";

  Future<Model?> getData()async{
    http.Response response = await http.get(Uri.parse(apiUri));
    if(response.statusCode == 200){
      return modelFromJson(response.body);
    }else{
      throw Exception(response.body);
    }
  }

}