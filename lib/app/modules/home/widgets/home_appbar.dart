import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/consts.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/open_drawer_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeAppBar extends GetView<HomeController>
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const HomeAppBar({Key? key, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const OpenDrawerWidget(),
      title: const Text(
        AppConstant.appName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: bottom,
      actions: [
        CustomButton(
          icons: Icons.search,
          width: 35,
          height: 35,
          tooltip: 'Search',
          padding: const EdgeInsets.all(6.0),
          backgroundColor: Get.theme.colorScheme.onPrimary,
          foregroundColor: Get.theme.colorScheme.primary,
          borderRadiusValue: 10,
          onPressed: () => Get.toNamed(Routes.SEARCH),
        ),
        
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight);
}
