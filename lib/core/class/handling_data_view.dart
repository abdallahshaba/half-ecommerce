
import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});
  final StatusRequest? statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest== StatusRequest.loading ? 
       Center(child: Lottie.asset(AppImageAsset.laoding , width: 300 , height: 300)) 
      : 
      statusRequest== StatusRequest.offlineFailure?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 300 , height: 300)) 
      :
      statusRequest== StatusRequest.serverFaliure?
      Center(child: Lottie.asset(AppImageAsset.server, width: 300 , height: 300)) 
      :
      statusRequest== StatusRequest.failure?
      Center(child: Lottie.asset(AppImageAsset.dataEmpty, width: 300 , height: 300)) 
      :
      widget;

  }
}

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});
  final StatusRequest? statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest== StatusRequest.loading ? 
       Center(child: Lottie.asset(AppImageAsset.laoding , width: 300 , height: 300)) 
      : 
      statusRequest== StatusRequest.offlineFailure?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 300 , height: 300)) 
      :
      statusRequest== StatusRequest.serverFaliure?
      Center(child: Lottie.asset(AppImageAsset.server, width: 300 , height: 300))  
      :
      widget;
  }
}