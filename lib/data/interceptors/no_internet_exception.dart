// import 'dart:io';

// import 'package:connectivity/connectivity.dart';
// import 'package:dio/dio.dart';

// class NoInternetException extends Interceptor {
//   final Connectivity _connectivity = Connectivity();

//   @override
//   Future onRequest(RequestOptions options) async {
//     //  implementation
//     if (await isConnectedToInternet() == false) {
//       throw SocketException("No Internet!");
//     }
//     return super.onRequest(options);
//   }

//   Future<bool> isConnectedToInternet() async {
//     var connectivityResult = await (_connectivity.checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       // I am connected to a mobile network.
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       // I am connected to a wifi network.
//       return true;
//     }
//     return false;
//   }
// }
