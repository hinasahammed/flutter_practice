import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp"),
        actions: const [
          Icon(Icons.qr_code_scanner_outlined),
          Gap(10),
          Icon(Icons.camera_alt_outlined),
          Gap(10),
          Icon(Icons.more_vert),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search",
            ),
            const Gap(10),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsGV6wL9WkyZB77fex3vSPbLkkCEkLdT3Y7g&s",
                  ),
                ),
                title: const Text(
                  "Njan thanne",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Messages",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
                trailing: const Icon(Icons.timer),
              ),
            )
          ],
        ),
      ),
    );
  }
}
