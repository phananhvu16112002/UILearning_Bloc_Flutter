import 'package:bloc_app/app_blocs.dart';
import 'package:bloc_app/app_events.dart';
import 'package:bloc_app/pages/sign_in/sign_in.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_state.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(lazy: false, create: (context) => AppBlocs())
      ],
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: Colors.white
                  )
                ),
                home: Welcome(),
                routes: {
                  "myHomePage": (context) => MyHomePage(),
                  "signIn":(context) => SignIn(),
                },
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button many times',
              ),
              Text(
                '${BlocProvider.of<AppBlocs>(context).state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "herotag1",
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "herotag2",
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
