import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorHomeNavigation extends ConsumerStatefulWidget {
  const VendorHomeNavigation({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VendorHomeNavigation();
}

class _VendorHomeNavigation extends ConsumerState<VendorHomeNavigation> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModel);
    Future<bool> onBackPressed() {
      return Future.delayed(const Duration(seconds: 2));
    }

    // final themeDataMode = ref.watch(themeDataProvider);
    var index = ref.watch(homeViewModel).selectedIndex;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        body: _pages.elementAt(ref.watch(homeViewModel).selectedIndex),
        // drawer: const MyDrawerPage(),
        bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: BottomNavigationBar(
            //backgroundColor: Colors.green,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            // unselectedItemColor:
            //     Colors.red,

            showSelectedLabels: true,
            // selectedItemColor: AppColors.primary,
            currentIndex: ref.watch(homeViewModel).selectedIndex,
            onTap: viewModel.changeIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.grid_view,
                    color: index == 0
                        ? AppColors.secondary
                        : Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .color),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                // backgroundColor: Colors.white,
                icon: Icon(Icons.menu,
                    color: index == 1
                        ? AppColors.secondary
                        : Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .color),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                //backgroundColor: Colors.white,
                icon: Icon(Icons.account_balance_wallet_outlined,
                    color: index == 2
                        ? AppColors.secondary
                        : Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .color),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                //backgroundColor: Colors.white,
                icon: Icon(Icons.person_4_outlined,
                    color: index == 3
                        ? AppColors.secondary
                        : Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .color),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static List<Widget> _pages = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
  ];
}
