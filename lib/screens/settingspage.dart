import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbot/drawer.dart';
import 'package:medbot/screens/Welcome/welcome_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      drawer: const customDrawer(),
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: Icons.dark_mode_outlined,
                      trailing: Switch(
                          value: _isDark,
                          onChanged: (value) {
                            setState(() {
                              _isDark = value;
                            });
                          })),
                  const _CustomListTile(
                      title: "Notifications",
                      icon: Icons.notifications_none_rounded),
                  const _CustomListTile(
                      title: "Security Status",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
              const Divider(),
              const _SingleSection(
                title: "Organization",
                children: [
                  _CustomListTile(
                      title: "Profile", icon: Icons.person_outline_rounded),
                  _CustomListTile(
                      title: "Messaging", icon: Icons.message_outlined),
                  _CustomListTile(title: "Calling", icon: Icons.phone_outlined),
                  _CustomListTile(
                      title: "People", icon: Icons.contacts_outlined),
                  _CustomListTile(
                      title: "Calendar", icon: Icons.calendar_today_rounded)
                ],
              ),
              const Divider(),
              _SingleSection(
                children: [
                  const _CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline_rounded),
                  const _CustomListTile(
                      title: "About", icon: Icons.info_outline_rounded),
                  ListTile(
                    title: const Text("Sign out"),
                    leading: const Icon(Icons.exit_to_app_rounded),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return const WelcomeScreen();
                        },
                      ), (Route<dynamic> route) => false);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
