import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stripe_flutter_app/blocs/completed_cubit/completed_cubit.dart';

import 'package:stripe_flutter_app/blocs/pay_bloc/pay_bloc.dart';
import 'package:stripe_flutter_app/services/stripe_service.dart';
import 'pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // ignore: unused_local_variable
  final StripeService stripeService = StripeService()..init();

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
        BlocProvider(
          create: (_) => CompletedCubit(),
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
