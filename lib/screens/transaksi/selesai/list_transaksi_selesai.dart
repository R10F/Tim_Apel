// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/filter_transaksi_provider.dart';
import 'package:tim_apel/screens/transaksi/selesai/date_picker.dart';
import 'package:tim_apel/screens/transaksi/selesai/card_transaksi_selesai.dart';
import 'package:tim_apel/utilities/datetime.dart';

class ListTransaksiSelesai extends StatefulWidget {
  const ListTransaksiSelesai(
      {super.key, required this.accountProvider, required this.transaksiProvider});

  final accountProvider;
  final transaksiProvider;

  @override
  State<ListTransaksiSelesai> createState() => _ListTransaksiStateSelesai();
}

class _ListTransaksiStateSelesai extends State<ListTransaksiSelesai> {
  @override
  Widget build(BuildContext context) {
    var filterProvider = Provider.of<FilterTransaksiProvider>(context);
    List<Transaksi> listTransaksi = widget.transaksiProvider.listTransaksi;
    List<String> activeFilterMetodePembayaran = filterProvider.activeFilterMetodePembayaran();
    List activeFilterMultiDate = filterProvider.dateFilterItem['multi_date']['result'];

    Map<String, List> groupbyDatetime = {};
    for (int i = listTransaksi.length - 1; i >= 0; i--) {
      if (!listTransaksi[i].inProcess) {
        DateTime dateTransaksi = parseDate(listTransaksi[i].date);

        // Filter date range
        if (filterProvider.dateFilterType == 'date_range' &&
            filterProvider.dateFilterItem['date_range']['result'].isNotEmpty &&
            (dateTransaksi.isAfter(filterProvider.dateFilterItem['date_range']['result'][1]) ||
                dateTransaksi.isBefore(filterProvider.dateFilterItem['date_range']['result'][0]))) {
          continue;
        }
        // Filter multi date
        else if (filterProvider.dateFilterType == 'multi_date' &&
            activeFilterMultiDate.isNotEmpty &&
            !activeFilterMultiDate.contains(dateTransaksi)) {
          continue;
        }
        // Filter metode pembayaran
        if (activeFilterMetodePembayaran.isNotEmpty &&
            !activeFilterMetodePembayaran.contains(listTransaksi[i].metodePembayaran)) {
          continue;
        }

        String key = listTransaksi[i].date;
        groupbyDatetime.putIfAbsent(key, () => []);
        groupbyDatetime[key]?.add(listTransaksi[i]);
      }
    }

    if (filterProvider.startDate == null && filterProvider.endDate == null) {
      filterProvider.setStartEndDate(
        parseDate(groupbyDatetime.keys.last),
        parseDate(groupbyDatetime.keys.first),
      );
    }

    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(children: [
            Row(children: [
              const Text('Filter berdasarkan tanggal: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              IconButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (_) => DatePicker(prov: filterProvider)));
                  },
                  icon: const Icon(Icons.date_range))
            ]),
            if (filterProvider.dateFilterItem.entries.isNotEmpty)
              ...filterProvider.dateFilterItem.entries.map((entry) {
                String filterType = entry.key;
                Map filterValue = entry.value;

                List multiDate = [];
                if (filterType == 'multi_date') {
                  for (int i = 0; i < filterValue['result'].length; i++) {
                    if (i <= 3) {
                      multiDate.add(stringifyDate(filterValue['result'][i]));
                    } else if (i == 4) {
                      multiDate.add('...');
                    } else {
                      break;
                    }
                  }
                }

                return GestureDetector(
                  onTap: () {
                    filterProvider.dateFilterType = filterType;
                  },
                  child: Row(children: [
                    Radio(
                        value: filterType,
                        groupValue: filterProvider.dateFilterType,
                        onChanged: (value) {
                          filterProvider.dateFilterType = value!;
                        }),
                    Text(filterValue['name']),
                    if (filterType == 'date_range')
                      if (filterValue['result'].isEmpty)
                        Text(
                            ': ${stringifyDate(filterProvider.startDate)}  -  ${stringifyDate(filterProvider.endDate)}')
                      else
                        Text(
                            ': ${stringifyDate(filterValue['result'][0])}  -  ${stringifyDate(filterValue['result'][1])}')
                    else if (filterType == 'multi_date')
                      if (filterValue['result'].isNotEmpty) Text(': ${multiDate.join(', ')}')
                  ]),
                );
              })
          ])),
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text('Filter berdasarkan metode pembayaran',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              filterProvider.listMetodePembayaran.length,
              (index) => FilterChip(
                  selected: filterProvider.filterMetodePembayaran[index],
                  label: Text(filterProvider.listMetodePembayaran[index]),
                  selectedColor: Colours.lightSalmon,
                  onSelected: (bool selected) {
                    filterProvider.setStatusFilterMetodePembayaran(index, selected);
                  }),
            )),
      ),
      if (groupbyDatetime.entries.isNotEmpty)
        ...groupbyDatetime.entries.map((entry) {
          String date = entry.key;
          List listTransaksi = entry.value;

          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child:
                    Text(date, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            for (int i = 0; i < listTransaksi.length; i++)
              CardTransaksiSelesai(
                  index: i,
                  transaksi: listTransaksi[i],
                  namaKasir: widget.accountProvider.userAccounts[listTransaksi[i].idKasir].nama,
                  prov: widget.transaksiProvider)
          ]);
        })
      else
        const Center(child: Text('Tidak ada transaksi yang sesuai filter'))
    ]));
  }
}
