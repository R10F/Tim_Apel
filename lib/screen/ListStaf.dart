import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screen/DaftarStaf.dart';

import '../provider/RegistStaf_Provider.dart';

class ListStaf extends StatefulWidget {
  const ListStaf({super.key});

  @override
  State<ListStaf> createState() => _ListStafState();
}

class _ListStafState extends State<ListStaf> {
  @override
  Widget build(BuildContext context) {
    var regisStafProvider = Provider.of<RegistStafProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Staf'),
      ),
      body: ListView(
          children: List.generate(
        regisStafProvider.getListStaf.length,
        (index) => Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/profile.png',
                  width: 45,
                ),
                title: Text(
                    regisStafProvider.getListStaf[index]['nama'].toString()),
                trailing: IconButton(
                    onPressed: () {
                      regisStafProvider.removeStaf(index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            ),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal[700],
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const DaftarStaf()));
        },
      ),
    );
  }
}
