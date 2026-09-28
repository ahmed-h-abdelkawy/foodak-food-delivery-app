import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherItem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: isLandscape ? 30 : 26,
          ),
        ),
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: isLandscape ? 25 : 18),
        ),
      ],
    );
  }

  Widget itemTappedTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      leading: Icon(
        icon,
        size: isLandscape ? size.height * 0.1 : size.height * 0.035,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: isLandscape ? 20 : 18,
          fontWeight: isLandscape ? FontWeight.w600 : FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        size: isLandscape ? size.height * 0.090 : size.height * 0.030,
      ),
      onTap: () => debugPrint('$title clicked'),
    );
  }

  Widget personPhoto(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppAssets.profilePhoto),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final nameText = Text(
      'Eren Yeager',
      style: Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandscape) ...[
            personPhoto(size.width * 0.5, size.height * 0.25),
            nameText,
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderVoucherItem(context, name: 'Orders', number: 50),
                orderVoucherItem(context, name: 'Vouchers', number: 10),
              ],
            ),
            const SizedBox(height: 16),
          ],
          if (isLandscape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    personPhoto(size.width * 0.2, size.height * 0.4),
                    const SizedBox(height: 6),
                    nameText,
                  ],
                ),
                Column(
                  children: [
                    orderVoucherItem(context, name: 'Orders', number: 50),
                    const SizedBox(height: 20),
                    orderVoucherItem(context, name: 'Vouchers', number: 10),
                  ],
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          const Divider(),
          itemTappedTile(
            context,
            title: 'Past Orders',
            icon: Icons.shopping_cart,
          ),
          const Divider(),
          itemTappedTile(
            context,
            title: 'Available Vouchers',
            icon: Icons.card_giftcard,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
