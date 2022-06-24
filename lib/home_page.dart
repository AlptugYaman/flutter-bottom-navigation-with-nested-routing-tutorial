import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late OverlayEntry entry;

  @override
  void initState() {
    super.initState();
    entry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: entry.remove,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.25),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: kBottomNavigationBarHeight + 0.55 * kToolbarHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FABsButton(
                    padding: const EdgeInsets.only(right: 6.0),
                    iconData: Icons.add_circle_outline_sharp,
                    entry: entry,
                  ),
                  FABsButton(
                    padding:
                        const EdgeInsets.only(bottom: .75 * kToolbarHeight + 8),
                    iconData: Icons.safety_divider_sharp,
                    entry: entry,
                  ),
                  FABsButton(
                    padding: const EdgeInsets.only(left: 6.0),
                    iconData: Icons.sms_failed_outlined,
                    entry: entry,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text('FlutterBottomNav'),
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: Colors.indigo,
      routes: const [
        PostsRouter(),
        // UsersRouter(),
        SettingsRouter(),
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: const Color(0xFFFFDC5D),
            onPressed: () {
              Overlay.of(context)?.insert(entry);
            },
            child: const Text(
              'CUZ',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: .1,
              ),
            ),
          ),
          SpeedDial(
            child: const Text(
              'CUZ',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: .1,
              ),
            ),
            overlayColor: Colors.black12,
            direction: SpeedDialDirection.up,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: const Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: const Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                size: 30,
              ),
              label: 'Posts',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person,
            //     size: 30,
            //   ),
            //   label: 'Users',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Settings',
            )
          ],
        );
      },
    );
  }
}

class FABsButton extends StatelessWidget {
  const FABsButton({
    Key? key,
    required this.entry,
    required this.iconData,
    required this.padding,
  }) : super(key: key);

  final OverlayEntry entry;
  final IconData iconData;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: Colors.amber,
        shape: const CircleBorder(),
        child: IconButton(
          icon: Icon(iconData),
          onPressed: () => entry.remove(),
        ),
      ),
    );
  }
}
