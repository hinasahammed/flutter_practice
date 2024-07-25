import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListviewAndSeperated extends StatefulWidget {
  const ListviewAndSeperated({super.key});

  @override
  State<ListviewAndSeperated> createState() => _ListviewAndSeperatedState();
}

class _ListviewAndSeperatedState extends State<ListviewAndSeperated> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top rated",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Buy\nFurniture",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.network(
                      "https://cdn-icons-png.freepik.com/512/3536/3536727.png",
                      width: 150,
                      color: theme.colorScheme.onSurface,
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            ListView.builder(
                itemCount: furniture.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = furniture[index];
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      leading: Icon(
                        data.leading,
                        size: 35,
                        color: theme.colorScheme.onPrimary,
                      ),
                      tileColor: data.color,
                      title: Text(
                        data.title,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        data.subTitle,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      trailing: Icon(
                        Icons.delete_outline,
                        color: theme.colorScheme.onPrimary,
                        size: 35,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

List<Furniture> furniture = [
  Furniture(
    leading: Icons.bed,
    title: "Bed",
    subTitle: "King size Bed",
    color: const Color(0xffe0aaff),
  ),
  Furniture(
    leading: Icons.chair_alt,
    title: "Chair",
    subTitle: "King size chair",
    color: const Color(0xffeae2b7),
  ),
  Furniture(
    leading: Icons.chair_rounded,
    title: "Sofa",
    subTitle: "Sofa cum  bed",
    color: const Color(0xffe9ecef),
  )
];

class Furniture {
  final IconData leading;
  final String title;
  final String subTitle;
  final Color color;

  Furniture({
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.color,
  });
}
