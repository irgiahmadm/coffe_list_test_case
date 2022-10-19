import 'package:flutter/material.dart';
import 'package:hot_coffee/common/colors.dart';
import 'package:hot_coffee/models/coffee_model.dart';
import 'package:hot_coffee/provider/coffee_provider.dart';
import 'package:hot_coffee/widget/list_coffee_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  final List<CoffeeResponse> _coffeeList = [];
  Future<void> getListCoffee() async {
    setState(() => _isLoading = true);

    CoffeeProvider coffeeProvider = context.read<CoffeeProvider>();
    List<CoffeeResponse> coffeList = await coffeeProvider.getListCoffee();

    _coffeeList.addAll(coffeList);

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getListCoffee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Coffe List'),
          elevation: 0.0,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _isLoading
              ? const CircularProgressIndicator()
              : ListCoffeeWidget(coffeeList: _coffeeList),
        ),
      ),
    );
  }
}
