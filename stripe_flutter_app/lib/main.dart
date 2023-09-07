import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_flutter_app/blocs/pay_bloc_folder/pay_bloc.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PayBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'StripeAPP',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'order': (_) => const OrderPage(),
        },
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          primaryColor: const Color(0xFF284879),
          scaffoldBackgroundColor: const Color(0xFF21232A),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
