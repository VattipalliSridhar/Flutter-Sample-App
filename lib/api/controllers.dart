import 'package:citizen_app/api/api_service.dart';
import 'package:citizen_app/dataclasses/Constants.dart';
import 'package:citizen_app/model/ulb_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllersData{
  ApiService _apiService = new ApiService();
  doLogin(String username) async{
    UlbModel ulbModel = await _apiService.ulbFetching(username);
    print(ulbModel.message);
    _save(ulbModel);
  }

  Future<void> _save(UlbModel ulbModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.MunicipalityName, ulbModel.ulbname);
    prefs.setString(Constants.MunicipalityUlbID, ulbModel.ulbid);
  }
  /*_save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.setString(key, value);
  }*/
}