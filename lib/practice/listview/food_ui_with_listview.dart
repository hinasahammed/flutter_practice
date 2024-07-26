import 'package:flutter/material.dart';

class FoodUiWithListview extends StatefulWidget {
  const FoodUiWithListview({super.key});

  @override
  State<FoodUiWithListview> createState() => _FoodUiWithListviewState();
}

class _FoodUiWithListviewState extends State<FoodUiWithListview> {
  List imageUrl = [
    "assets/images/fd1.png",
    "assets/images/fd2.png",
    "assets/images/fd3.png",
    "assets/images/fd4.png",
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
      ),
      body: ListView.builder(
        itemCount: imageUrl.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Stack(
          children: [
            const SizedBox(
              // color: Colors.red,
              width: double.infinity,
              height: 180,
            ),
            Positioned(
              right: 10,
              left: 10,
              bottom: 0,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Container(
                  width: size.width * .8,
                  padding: const EdgeInsets.all(8),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: theme.colorScheme.onSurface),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 110,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  thickness: 3,
                                  color: theme.colorScheme.primary,
                                ),
                                Text(
                                  "Snacks",
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.share,
                                  color: theme.colorScheme.onSurface,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.add_circle_outline,
                                  color: theme.colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Sweat Meet French Dessert",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.dinner_dining,
                                color: theme.colorScheme.onSurface,
                              ),
                              Text(
                                "60 min",
                                style: theme.textTheme.labelLarge!.copyWith(
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: theme.colorScheme.onSurface,
                              ),
                              Text(
                                "5 Ing",
                                style: theme.textTheme.labelLarge!.copyWith(
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 0,
              child: Image.asset(
                imageUrl[index],
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
