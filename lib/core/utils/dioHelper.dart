


import 'package:dio/dio.dart';

class DioHelper{


  static late Dio dio;
  static Init(){
    dio=Dio(
       BaseOptions(
         baseUrl: 'url',
         receiveDataWhenStatusError: true,
       )
    );
  }

  static Future<Response> getData({
  required String url,
    Map<String,dynamic>? query,
   String lang='en',
   String? token,
})async{
    dio.options.headers={
      "Content-Type":"application/json",
      "lang":lang,
    };
    return await dio.get(
    url,
    queryParameters: query,
);
}



  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='en',
    String? token,
  })async{
    dio.options.headers={
      "Content-Type":"application/json",
      "lang":lang,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data
    );
  }





  //هيحط داتا مكان داتا ويستبدلها update
  static Future<Response> putData(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang='en',
        String? token,
      })async{
    dio.options.headers= {
      'lang':lang,
      'Content-Type':'application/json',

    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );


  }







}