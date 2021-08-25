import 'dart:core';

import 'package:untitled/models/CityModel.dart';
import 'package:untitled/models/HotelModel.dart';
import 'package:untitled/models/OfferModel.dart';

class HomeModel{

  List<CityModel> _cities = [];
  List<OfferModel>  _offers = [];
  List<OfferModel> _specialOffers = [];
  List<HotelModel> _recommendedHotels = [];

  HomeModel(obj){
    this._cities = CityModel.fromJSONList(obj["cities"]);
    this._offers = OfferModel.fromJSONList(obj["offers"]);
    this._specialOffers = OfferModel.fromJSONList(obj["special_offers"]);
    this._recommendedHotels = HotelModel.fromJSONList(obj["recommended"]);
  }


}