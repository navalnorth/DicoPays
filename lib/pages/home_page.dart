import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pays/pages/pays_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dio = Dio();
  List pays = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  getCountries() async {
    final response = await dio.get("https://restcountries.com/v3.1/all");
    setState(() {
      pays = response.data;
      pays.removeAt(246);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        elevation: 18.0,
      ),
  body: ListView.builder(
    itemCount: pays.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Text(pays[index]["flag"], style: const TextStyle(fontSize: 30),),
        title: Text(pays[index]["name"]["common"]),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaysPage(country: pays[index]),
            )
            );
        },
      );
    },
  ),
    );
  }
}

