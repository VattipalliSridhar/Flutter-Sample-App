class UlbModel {
  String statusCode;
  String message;
  String ulbname;
  String ulbid;
  List<FinalData> finalData;

  UlbModel(
      {this.statusCode,
      this.message,
      this.ulbname,
      this.ulbid,
      this.finalData});


  factory UlbModel.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['final_data'] as List;
    print(list.runtimeType);
    List<FinalData> finalList = list.map((i) => FinalData.fromJson(i)).toList();


    return UlbModel(
        statusCode: parsedJson['status_code'],
        message: parsedJson['message'],
        ulbname: parsedJson['ulbname'],
        ulbid: parsedJson['ulbid'],
        finalData: finalList

    );
  }
}

class FinalData {
  String catId;
  String catDsc;
  String link;

  FinalData({this.catId, this.catDsc, this.link});

  factory FinalData.fromJson(Map<String, dynamic> parsedJson) {
    return FinalData(
        catId: parsedJson['cat_id'],
        catDsc: parsedJson['cat_dsc'],
        link: parsedJson['link']);
  }
}
