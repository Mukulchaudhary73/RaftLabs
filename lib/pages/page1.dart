import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:raftlabs/pages/apiInfo.dart';

class FetchData extends StatefulWidget {
  FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  bool ans = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FetchDataPage()),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        child: const Text('Fetch Data'),
      ),
    );
  }
}
