import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../widgets/snackbars.dart';

class ConnectionManagerController extends GetxController {
  var isConnected = false.obs;
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen(_updateState);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        isConnected.value = true;
        break;
      case ConnectivityResult.mobile:
        isConnected.value = true;
        break;
      case ConnectivityResult.none:
        isConnected.value = false;
        break;
      default:
        myToast(false, 'Failed to get connection type');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
