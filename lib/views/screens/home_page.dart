import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(
                25,
                (index) => Card(
                  child: ListTile(
                    title: Text("Item: $index"),
                    leading: Container(
                      color: Colors.primaries[index % 18],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
