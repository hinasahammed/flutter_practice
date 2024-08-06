import 'package:flutter/material.dart';
import 'package:flutter_practice/assets/icons/icons_asset.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPractice extends StatelessWidget {
  const UrlLauncherPractice({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .45,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: size.width * .8,
                      height: size.height * .35,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Ahammed hinas kk",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Flutter Developer",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(20),
                          const Divider(),
                          const Gap(20),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchGithub(context);
                                  },
                                  child: Image.asset(
                                    IconsAsset.github,
                                    width: size.width * .1,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                VerticalDivider(
                                  color: theme.colorScheme.onSurface,
                                  thickness: 1.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchMail(context);
                                  },
                                  child: Image.asset(
                                    IconsAsset.mail,
                                    width: size.width * .1,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                VerticalDivider(
                                  color: theme.colorScheme.onSurface,
                                  thickness: 1.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchPhone(context);
                                  },
                                  child: Icon(
                                    Icons.phone_outlined,
                                    color: theme.colorScheme.onSurface,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 30,
                  child: Container(
                    width: size.width * .35,
                    height: size.height * .13,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: size.width * .4,
                      height: size.height * .15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/82311707?s=400&u=7943ebc5067a8d92f24616079386064c0f497127&v=4",
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void launchGithub(BuildContext context) async {
    Uri uriUrl = Uri.parse("https://github.com/hinasahammed");
    if (await canLaunchUrl(uriUrl)) {
      await launchUrl(uriUrl);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                ),
                Gap(10),
                Text("Failed to launch github"),
              ],
            ),
          ),
        );
      }
    }
  }

  void launchMail(BuildContext context) async {
    const emailAddress = 'hinaskkahammed@gmail.com';
    const subject = 'Let\'s talk';
    const body = 'This is the body of the email.';
    final url = Uri.parse(
        'mailto:$emailAddress?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                ),
                Gap(10),
                Text("Failed to launch mail"),
              ],
            ),
          ),
        );
      }
    }
  }

  void launchPhone(BuildContext context) async {
    String telephoneNumber = '+918137021939';
    String telephoneUrl = "tel:$telephoneNumber";
    if (await canLaunchUrl(Uri.parse(telephoneUrl))) {
      await launchUrl(Uri.parse(telephoneUrl));
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                ),
                Gap(10),
                Text("Failed to launch phone"),
              ],
            ),
          ),
        );
      }
    }
  }
}
