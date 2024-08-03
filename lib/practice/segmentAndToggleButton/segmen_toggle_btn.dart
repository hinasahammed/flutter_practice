import 'package:flutter/material.dart';

class SegmenToggleBtn extends StatefulWidget {
  const SegmenToggleBtn({super.key});

  @override
  State<SegmenToggleBtn> createState() => _SegmenToggleBtnState();
}

class _SegmenToggleBtnState extends State<SegmenToggleBtn> {
  Set selected = {"Male"};

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SegmentToggle'),
      ),
      body: Column(
        children: [
          SegmentedButton(
            selected: selected,
            onSelectionChanged: (val) {
              setState(() {
                selected.clear();
                selected.addAll(val);
              });
            },
            segments: const [
              ButtonSegment(
                value: "Male",
                icon: Icon(Icons.male),
                label: Text("Male"),
              ),
              ButtonSegment(
                value: "Female",
                icon: Icon(Icons.female),
                label: Text("Female"),
              ),
              ButtonSegment(
                value: "Other",
                icon: Icon(Icons.other_houses),
                label: Text("Other"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            borderColor: Colors.deepPurple,
            borderWidth: 2,
            fillColor: Colors.amber,
            onPressed: (newV) {
              setState(() {
                currentIndex = newV;
              });
            },
            isSelected: [
              currentIndex == 0 ? true : false,
              currentIndex == 1 ? true : false,
              currentIndex == 2 ? true : false,
            ],
            children: const [
              Text(
                'one',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'two',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'three',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
