import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {
  final dynamic country;

  const PaysPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country["name"]["common"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              country["flag"],
              style: const TextStyle(fontSize: 50),
            ),

            const SizedBox(height: 20),
            Text(
              "Nom : ${country["name"]["common"]}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            Text(
              "Capitale : ${country["capital"] != null ? country["capital"][0] : "Ce pays n'a pas de capital"}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),
            Text(
              "Région : ${country["region"]}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),
            Text(
              "Population : ${country["population"]} habitants",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),
            Text(
              "Monnaie : ${country["currencies"] != null ? country["currencies"].entries.first.value["name"] : "Pas de monnaie"}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),
            Text(
              "Plage horaire : ${country["timezones"][0]}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
