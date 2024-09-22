import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/core/network/base_handling.dart';
 import 'package:karty/features/more/data/models/response/faq_response_model.dart';

abstract class MoreRemoteDataSource {
  Future<CustomResponseType<FaqResponseModel>> getAllFaq(
      {required String lang});
  
}

@Injectable(as: MoreRemoteDataSource)
class MoreRemoteDataSourceImpl implements MoreRemoteDataSource {
  MoreRemoteDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<FaqResponseModel>> getAllFaq(
      {required String lang}) async {
    String localJson;
    if (lang == "ar") {
      localJson = await rootBundle.loadString("assets/json/faq_ar.json");
    } else {
      localJson = await rootBundle.loadString("assets/json/faq_en.json");
    }
    final dynamic data = jsonDecode(localJson);
    return right(FaqResponseModel.fromJson(data['data']));
  } 
  }
 
