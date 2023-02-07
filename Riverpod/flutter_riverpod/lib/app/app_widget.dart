import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_example/app/app_route.dart';
import 'package:flutter_riverpod_example/app/global/pages/error_page.dart';
import 'package:flutter_riverpod_example/service/network_status_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  late StreamSubscription streamSubscription;

  @override
  Widget build(BuildContext context) {
    var networkStatus = useState(NetworkStatus.offline.toString());

    useEffect(() {
      streamSubscription = NetworkStatusService.instance.stream.listen((event) {
        networkStatus.value =
            NetworkStatusService.instance.getNetworkStatus(event).toString();
      });
      return null;
    }, []);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: "/",
      onGenerateRoute: AppRoute.generateRoute,
      builder: (context, child) {
        return child!;
      },
      // builder: (context, child) {
      //   return Container(
      //     child: networkStatus.value == NetworkStatus.offline.toString()
      //         ? const ErrorPage(message: "Connection Error")
      //         : child,
      //   );
      // }
    );
  }
}
