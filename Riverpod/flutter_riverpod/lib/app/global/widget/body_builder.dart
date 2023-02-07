import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/global/widget/error_retry.dart';
import 'package:flutter_riverpod_example/app/global/widget/loading.dart';

import '../../../connection/states.dart';

class BodyBuilder extends StatelessWidget {
  final StatusState requestStatus;
  final Widget child;
  final Widget loadingWidget;
  final Function? onRetry;
  final String? errorMessage;

  const BodyBuilder(
      {Key? key,
      required this.requestStatus,
      required this.child,
      this.errorMessage,
      this.loadingWidget = const LoadingPage(),
      this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (requestStatus) {
      case StatusState.initial:
        return Container();
      case StatusState.loading:
        return loadingWidget;
      case StatusState.failed:
        return ErrorRetry(
            onPressed: () {
              if (onRetry != null) {
                onRetry!();
              }
            },
            text: errorMessage);
      case StatusState.loaded:
        return child;
    }
  }
}
