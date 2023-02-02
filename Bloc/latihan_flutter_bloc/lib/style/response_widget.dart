import 'package:flutter/material.dart';
import 'package:latihan_flutter_bloc/modules/home/model/user.dart';

class ResponseWidget extends StatelessWidget {
  final Widget successWidget;
  final Status status;

  const ResponseWidget(
      {super.key, required this.successWidget, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.loading:
        return const Text("Loading");
      case Status.success:
        return successWidget;
      case Status.error:
        return const Text("Error");
      default:
        return Container();
    }
  }
}
