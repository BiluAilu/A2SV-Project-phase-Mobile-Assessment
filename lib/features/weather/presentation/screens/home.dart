import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/platform.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/bloc_widget.dart';
import 'package:weather/injection_dependencies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>(),
      child: Scaffold(
        backgroundColor: mian_background,
        body: Container(
          padding: EdgeInsets.only(
              top: screen_size(context).height * 0.1, right: 20, left: 20),
          child: Column(children: [
            Text(
              "Choose a City",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: search_controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Search a new City ',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(yellow)),
                  ),
                )
              ],
            ),
            WidgetOfBlocBuilder(context),
          ]),
        ),
      ),
    );
  }

}