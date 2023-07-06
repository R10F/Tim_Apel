import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';

class CustomSearchLaris extends StatefulWidget {
  const CustomSearchLaris({super.key});

  @override
  State<CustomSearchLaris> createState() => _CustomSearchLarisState();
}

class _CustomSearchLarisState extends State<CustomSearchLaris> {
  @override
  Widget build(BuildContext context) {
    var searchProv = Provider.of<SearchLarisProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
      child: SearchBar(
        hintText: 'Nama Produk',
        leading: const Icon(Icons.search),
        controller: searchProv.searchController,
        elevation: const MaterialStatePropertyAll(0.0),
        onChanged: (_) => searchProv.queryListener(),
      ),
    );
  }
}
