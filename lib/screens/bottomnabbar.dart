import 'package:dating_app/screens/account_screen/account_main_screen.dart';
import 'package:dating_app/screens/chat/chat_screen.dart';
import 'package:dating_app/screens/home_screen.dart';
import 'package:dating_app/screens/matched_screen.dart';
import 'package:dating_app/screens/message/message_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _selectedIndexNotifier.value = _controller.index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style3,
    );
  }

  List<Widget> _buildScreens() {
    return [
     HomeScreen(),
     MatchedScreen(),
    MessageScreen(),
    AccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomIcon(images: Assets.homeIcon, selectedIndexNotifier: _selectedIndexNotifier, index: 0),
        activeColorPrimary:MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(images: Assets.heartIcon, selectedIndexNotifier: _selectedIndexNotifier, index: 1),
        activeColorPrimary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(images: Assets.messageIcon, selectedIndexNotifier: _selectedIndexNotifier, index: 2),
        activeColorPrimary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(images:Assets.peopleIcon, selectedIndexNotifier: _selectedIndexNotifier, index: 3),
        activeColorPrimary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

class CustomIcon extends StatelessWidget {
  final String? assetName;
  final ValueNotifier<int> selectedIndexNotifier;
  final int index;
  final String? images;

  const CustomIcon({
    this.images,
    this.assetName,
    required this.selectedIndexNotifier,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, child) {
        bool isActive = selectedIndex == index;
        return SvgPicture.asset(images!, height: 25,);
      },
    );
  }
}

