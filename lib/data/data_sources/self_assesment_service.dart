import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:self_assesment_task/core/models/server_response.dart';
import 'package:self_assesment_task/core/network/base_service.dart';
import 'package:self_assesment_task/data/models/category_model.dart';
import 'package:self_assesment_task/data/models/profile_model.dart';
import 'package:self_assesment_task/data/models/recent_test_model.dart';
import 'package:self_assesment_task/data/models/top_pick_model.dart';
import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';

class SelfAssesmentService {
  final BaseService _baseService = BaseService();

  Future<ProfileModel?> getProfile(String url) async {
    // API call to fetch profile data
    try{
      Response response = await _baseService.getResponse(url);
      if(response.statusCode == 200){
        return ProfileModel.fromJson(response.data);
      }else{
        return null;
      }
    }catch( e){
      log(e.toString());
      return null;
    }
  }

  Future<List<CategoryModel>> getCategories(String url) async {
    try{
      Response response = await _baseService.getResponse(url);
      if(response.statusCode == 200){
        return (response.data as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      }else{
        return [];
      }
    }catch( e){
      log(e.toString());
      return [];
    }
  }

  Future<List<TopPickModel>> getTopPicks(String url) async {
    try{
      Response response = await _baseService.getResponse(url);
      if(response.statusCode == 200){
        return (response.data as List)
            .map((item) => TopPickModel.fromJson(item))
            .toList();
      }else{
        return [];
      }
    }catch( e){
      log(e.toString());
      return [];
    }
  }

  Future<List<RecentTestModel>> getRecentTests(String url) async {
    try{
      Response response = await _baseService.getResponse(url);
      if(response.statusCode == 200){
        return (response.data as List)
            .map((item) => RecentTestModel.fromJson(item))
            .toList();
      }else{
        return [];
      }
    }catch( e){
      log(e.toString());
      return [];
    }
  }
}
