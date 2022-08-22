import 'package:flutter/material.dart';
import 'package:flutter_application_11/controller/api.dart';

class DataProvider with ChangeNotifier {
  Apicall apiClass = Apicall();
  int currentUser = 0;
  late var datalist = apiClass.getprofile();
  
  updateCurrentUser(context, id) {
    currentUser = id;
    notifyListeners();
  }
}
