import 'package:untitled/models/HomeModel.dart';
import 'package:untitled/resources/services/RequestHandler.dart';
import 'package:untitled/resources/utils/ApiConstants.dart';

class HomeService{

  static Future getHomeDetails() async{
    HomeModel response = await RequestHandler.GET(ApiConstants.GET_HOME_DETAILS);
    return response;
  }

}