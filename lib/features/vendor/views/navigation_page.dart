import 'package:bubbles/features/vendor/views/home/home_view.dart';
import 'package:bubbles/features/vendor/views/home/shop/main_shop_page.dart';
import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
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
            selectedItemColor: AppColors.secondary,
            currentIndex: ref.watch(homeViewModel).selectedIndex,
            onTap: viewModel.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: index == 0
                    ?const SvgImage(
                        asset: dashboard1Icon,
                      )
                    : const SvgImage(
                        asset: dashboardIcon,
                      ),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                // backgroundColor: Colors.white,
                 icon: index == 1
                    ? const SvgImage(
                        asset: shop1Icon,
                      )
                    :const SvgImage(
                        asset: shopIcon,
                      ),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: index == 2
                    ?const SvgImage(
                        asset: wallet1Icon,
                      )
                    :const SvgImage(
                        asset: walletIcon,
                      ),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                icon: index == 3
                    ?const SvgImage(
                        asset: user1Icon,
                      )
                    :const SvgImage(
                        asset: userIcon,
                      ),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static List<Widget> _pages = <Widget>[
    VendorHomePage(),
    MainShopPage(),
    Container(),
    Container(),
  ];
}
