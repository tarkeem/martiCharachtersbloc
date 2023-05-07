import 'package:bloc_breaking_bad/app_constants.dart';
import 'package:dio/dio.dart';

class CharacterWebServices
{
  late Dio dio;
  CharacterWebServices()
  {
    BaseOptions options=BaseOptions(
      baseUrl: constants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio=Dio(options);
  }

Future getAllCharachters()async
{

    try{
       Response res=await dio.get('character');
  print( res.data['results']);
  return res.data['results'];
    }catch(err){
      print(err);
      return[];
    }

 
}

}