import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../exceptions/app_exception.dart';

abstract class BaseViewModel<S> extends Notifier<S> {
  final S initialState;

  BaseViewModel(this.initialState);

  @override
  S build() {
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
    ref.onDispose(dispose);
    return initialState;
  }

  @override
  set state(S newState) {
    if (!ref.mounted) {
      log('$runtimeType IS NOT MOUNTED, NOT UPDATING STATE', name: 'RIVERPOD');
      return;
    }
    super.state = newState;
  }

  @mustCallSuper
  void init() {
    log('INITIALIZING $runtimeType', name: 'RIVERPOD');
  }

  Future<T?> runSafely<T>(AsyncValueGetter<T> action) async {
    try {
      return await action.call();
    } on AppException catch (e, s) {
      log(e.message, stackTrace: s);
      handleError(e.message);
      return null;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      handleError(e.toString().replaceAll('Exception:', ''));
      return null;
    }
  }

  @mustCallSuper
  void handleError(String message) {
    EasyLoading.showError(message);
  }

  @mustCallSuper
  void dispose() {
    log('DISPOSING $runtimeType', name: 'PROVIDER');
  }
}
