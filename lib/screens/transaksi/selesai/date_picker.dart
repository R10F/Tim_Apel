// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.prov});

  final prov;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    String filterType = widget.prov.dateFilterType;

    return Scaffold(
      appBar: AppBar(
          title: Text(filterType == 'date_range' ? 'Date Range Picker' : 'Multi Date Picker')),
      body: SfDateRangePicker(
        showActionButtons: true,
        minDate: widget.prov.startDate,
        maxDate: widget.prov.endDate,
        selectionMode: filterType == 'date_range'
            ? DateRangePickerSelectionMode.range
            : DateRangePickerSelectionMode.multiple,
        onSubmit: (value) {
          if (value != null) {
            if (filterType == 'date_range') {
              PickerDateRange date = value as PickerDateRange;
              widget.prov.setDateFilterItemResult('date_range', [date.startDate, date.endDate]);
            } else if (filterType == 'multi_date') {
              widget.prov.setDateFilterItemResult('multi_date', value);
            }
          }
          Navigator.pop(context);
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
