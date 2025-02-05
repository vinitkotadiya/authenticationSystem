import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pocketplans/screens/login_screen.dart';
import 'package:pocketplans/services/assets_manager.dart';
import 'package:pocketplans/widgets/app_name_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Signs out the user
      print('User logged out successfully');
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.shoppingCart,
            ),
          ),
          title: const AppNameTextWidget(fontSize: 20),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          Image.network(user.photoURL ?? 'No Image Available'),
                    )),
                const SizedBox(height: 10),
                Text(user.displayName ?? 'No Name Available'),
                Text(user.email ?? 'No Email Available'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(23, 32, 45, 1),
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: Text("Edit Profile"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(height: 10),
                //Menu
                ProfileMenuWidgets(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog_solid,
                  onPress: () {},
                ),
                ProfileMenuWidgets(
                  title: "All Orders",
                  icon: LineAwesomeIcons.envelope,
                  onPress: () {},
                ),
                ProfileMenuWidgets(
                  title: "Refund",
                  icon: LineAwesomeIcons.redo_solid,
                  onPress: () {},
                ),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidgets(
                  title: "Information",
                  icon: LineAwesomeIcons.info_solid,
                  onPress: () {},
                ),
                ProfileMenuWidgets(
                  title: "Logout",
                  icon: LineAwesomeIcons.sign_out_alt_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () async {
                    await logout(); // Call the logout function
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen()), // Navigate to the login screen after logout
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class ProfileMenuWidgets extends StatelessWidget {
  const ProfileMenuWidgets({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.white : Colors.deepOrange;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(143, 153, 163, 0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right_solid,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
