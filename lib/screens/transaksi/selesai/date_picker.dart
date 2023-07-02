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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SfDateRangePicker(
          showActionButtons: true,
          minDate: widget.prov.startDate,
          maxDate: widget.prov.endDate,
          initialSelectedDates: filterType == 'multi_date'
              ? widget.prov.dateFilterItem['multi_date']['result'].cast<DateTime>().toList()
              : null,
          initialSelectedRange: filterType == 'date_range'
              ? widget.prov.dateFilterItem['date_range']['result'].isEmpty
                  ? PickerDateRange(widget.prov.startDate, widget.prov.endDate)
                  : PickerDateRange(
                      widget.prov.dateFilterItem['date_range']['result'][0],
                      widget.prov.dateFilterItem['date_range']['result'][1],
                    )
              : null,
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
      ),
    );
  }
}
