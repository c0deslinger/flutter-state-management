import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/widget/error_retry.dart';
import 'package:flutter_getx_example/app/global/widget/loading.dart';

import '../../../connection/states.dart';

class BodyBuilder extends StatelessWidget {
  final RequestStatusState requestStatus;
  final Widget child;
  final Widget loadingWidget;
  final Function? onRetry;
  final String? errorMessage;

  const BodyBuilder(
      {Key? key,
      required this.requestStatus,
      required this.child,
      this.errorMessage,
      this.loadingWidget = const LoadingWidget(),
      this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (requestStatus) {
      case RequestStatusState.initial:
        return Container();
      case RequestStatusState.loading:
        return loadingWidget;
      case RequestStatusState.failed:
        return ErrorRetry(
            onPressed: () {
              if (onRetry != null) {
                onRetry!();
              }
            },
            text: errorMessage);
      case RequestStatusState.loaded:
        return child;
    }
  }
}
