import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Updates"),
        actions: const [
          Icon(Icons.qr_code_scanner_outlined),
          Gap(10),
          Icon(Icons.camera_alt_outlined),
          Gap(10),
          Icon(Icons.search),
          Gap(10),
          Icon(Icons.more_vert),
          Gap(10),
        ],
      ),
    );
  }
}
