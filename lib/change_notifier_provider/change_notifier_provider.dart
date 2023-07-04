import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../future_provider/model.dart';
import 'package:http/http.dart' as http;


final controllerData = ChangeNotifierProvider<Controller>((ref) => Controller());

/// Change Notifier is similar with Provider state management system
class Controller extends ChangeNotifier{

  Model? model;
  String apiUri = "https://dummyjson.com/products/category/smartphones";
  Future getData()async{
    http.Response response = await http.get(Uri.parse(apiUri));
    if(response.statusCode == 200){
      model = modelFromJson(response.body);
      notifyListeners(); //<<<<<<<<<<<<=======================It is similar with provider notifier listener
    }
  }


}