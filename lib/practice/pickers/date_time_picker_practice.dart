import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DateTimePickerPractice extends StatefulWidget {
  const DateTimePickerPractice({super.key});

  @override
  State<DateTimePickerPractice> createState() => _DateTimePickerPracticeState();
}

class _DateTimePickerPracticeState extends State<DateTimePickerPractice> {
  DateTime? selectedDate;
  bool dateStarted = false;
  bool timeStarted = false;
  TimeOfDay? selectedTime;

  void selectDate(BuildContext context) async {
    setState(() {
      dateStarted = true;
    });
    final seelectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (seelectedDate != null) {
      setState(() {
        selectedDate = seelectedDate;
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Select a date bro!")));
      }
    }
    setState(() {
      dateStarted = false;
    });
  }

  void selectTime(BuildContext context) async {
    setState(() {
      timeStarted = true;
    });
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 4, minute: 50),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Select a time bro!")));
      }
    }
    setState(() {
      timeStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select a day",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          selectedDate == null
                              ? "Date not selected"
                              : DateFormat.yMMMd().format(selectedDate!),
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      dateStarted
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up_sharp,
                      color: theme.colorScheme.onPrimary,
                      size: 50,
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            InkWell(
              onTap: () {
                selectTime(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select a Time",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          selectedTime == null
                              ? "No time selected"
                              : selectedTime!.format(context),
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: theme.colorScheme.onPrimary,
                      size: 50,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
