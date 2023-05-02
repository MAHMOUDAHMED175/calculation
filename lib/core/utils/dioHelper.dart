


import 'package:dio/dio.dart';

class DioHelper{


  static late Dio dio;

  static Init(){
    dio=Dio(
       BaseOptions(
         baseUrl: 'https://schooleara.com/api',
         receiveDataWhenStatusError: true,
       )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang='ar',
  })async{
    dio.options.headers={
      "Content-Type":"application/json",
      "lang":lang,
      "Authorization":'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTIwMWViMmMwMjZhYTc0Y2ZlNWJmNTU2YTNkNDllNTFkODY2NTI5MGU1YmFlNTI3MTVlYjA4YzQwMDY3MTZiOWViYmZlMWU5NDcyOTRiMzQiLCJpYXQiOjE2ODI3OTIyNTUsIm5iZiI6MTY4Mjc5MjI1NSwiZXhwIjoxNzE0NDE0NjU1LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.rjFL_2bI6xqygNlYHteXyinx5lfdpJPank_wNMvME9TEX2v8S3_Tz51GX7oguU2n-heiReU5Tmu2Ir83wvKw9wZmf2eOMblgjKY6Tasd6N7A7Qgc2WSFUQBYdUeo4y0-UCgnAt3nT9PghQp7-UzCrtkEVjGtOnv2p03JrJnJ8mJ4QSQ3N2m1hFI5GRhAC-hJCpHbHQEIe0h_H4LnkS3EssVgT0AI1gJFQjOCO0f0fjbPkhHCBBBHCSKDl3R-l4CWPOhcJTddFeWPl8FIxjuYK6DklPH1CJDc5smRgPms13Xb7EPRYdJknWRMXeB24KPW5EIV8GMI5dUgYrz06ZAmaVfoKAt1Ya69JsnebgnsZcCNM4KN9TW11GKqWvG-AODo2l3C-jEJTb1RwJACdXcCYVV4Kf0UUmPdHtPuJ4b0OkkOxWZkqpp5Kgr0-Ur5I4DvCaEzobHbXCLTDUttEUIxHYLY4dsNPY_fxfs-1kMZTNPfQU4JjfCZe-lQHbKTBTZ3hwgZatR5XERoJZIjr1d2lrxdOQDsiboMCFYWOiQ1G-3OZc1jQFu1y6P1S4cxCVw3zzUmYZIuf-F0KCSqeDw3aCtLmla5pViGDyt_TlWGzu8sJir2K-7sYKrVEBXR-CW0FVsYwvgQZ5qIqXwkrgqDpTVRDIZ5Kg0BDjRzE2ouWJk'};
    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  // static Future<Response> postData({
  //   required String url,
  //   Map<String,dynamic>? query,
  //   required Map<String,dynamic> data,
  //   String lang='en',
  //   String? token,
  // })async{
  //   dio.options.headers={
  //     "Content-Type":"application/json",
  //     "lang":lang,
  //   };
  //   return await dio.post(
  //     url,
  //     queryParameters: query,
  //     data: data
  //   );
  // }
  //
  //
  //
  //
  //
  // //هيحط داتا مكان داتا ويستبدلها update
  // static Future<Response> putData(
  //     {
  //       required String url,
  //       Map<String,dynamic>? query,
  //       required Map<String,dynamic> data,
  //       String lang='en',
  //       String? token,
  //     })async{
  //   dio.options.headers= {
  //     'lang':lang,
  //     'Content-Type':'application/json',
  //
  //   };
  //   return await dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  //
  //
  // }
  //
  //
  //




}