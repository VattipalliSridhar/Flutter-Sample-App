import 'dart:convert';

import 'package:citizen_app/dataclasses/Constants.dart';
import 'package:citizen_app/model/ulb_model.dart';
import 'package:citizen_app/model/ulb_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiService {
  var status ;
  /*Future ulbFetching(String ulb) async {
    String ulbUrl = Constants.Base_Url + "/ulb_det.php";
    final response = await http.post(ulbUrl,headers: {'Accept':'application/json'},body: {
        "ulbid":"$ulb"
    });
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if(status){
      print('datass : ${data["error"]}');
    }else{
      print('datas : ${data["message"]}');
      _save(data["token"]);
    }
  }*/



  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.setString(key, value);
  }

  Future<UlbModel> ulbFetching(String ulb) async {
    String ulbUrl = Constants.Base_Url + "/ulb_det.php";
    var data =await http.post(ulbUrl,headers: {'Accept':'application/json'},body: {
      "ulbid":"$ulb"
    });


    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);
      print(data.body);
      UlbModel  _ulbModel= new UlbModel.fromJson(jsonData);
      return _ulbModel;
    } else {
      throw Exception('Failed to create album.');
    }


   // UlbModel  _ulbModel= new UlbModel.fromJson(jsonData);
    // ignore: unrelated_type_equality_checks
   /* if(_ulbModel.statusCode == 200)
      {
        return(_ulbModel);

      }else{
      return(_ulbModel);
    }
    print(_ulbModel.finalData.length);*/

  }
}
