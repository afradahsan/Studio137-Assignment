import 'package:flutter/material.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/home/widgets/coupon_container.dart';
import 'package:studio137_deliva/view/home/widgets/zigzag_line.dart';

class Coupons extends StatefulWidget {
  const Coupons({super.key});

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        leadingWidth: 30,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            'assets/menu.png',
            height: 20,
            width: 20,
          ),
        ),
        title: const Text(
          'Coupons',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'assets/sos-button.512x512.png',
              height: 25,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'NEAR ME',
            ),
            Tab(
              text: 'MAP',
            ),
            Tab(
              text: 'BROWSE',
            ),
            Tab(
              text: 'ONLINE',
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CouponContainer(discount: '20\n%', brandName: 'IKEA', distance: '2.731kms', imagePath: 'assets/ikea-logo-new-sq-1.jpg'),
            sizedtwenty(context),
            const CouponContainer(discount: '20\n%', brandName: 'IKEA', distance: '2.731kms', imagePath: 'assets/ikea-logo-new-sq-1.jpg'),
          ],
        ),
      )),
    );
  }
}
