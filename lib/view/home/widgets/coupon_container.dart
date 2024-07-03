import 'package:flutter/material.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/home/widgets/zigzag_line.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer(
      {super.key,
      required this.discount,
      required this.brandName,
      required this.distance,
      required this.imagePath});

  final String discount;
  final String brandName;
  final String distance;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: white),
          height: 70,
          width: screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      discount,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(brandName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withAlpha(150))),
                  Row(
                    children: [
                      Icon(
                        Icons.near_me_rounded,
                        color: Colors.blue[800],
                        size: 14,
                      ),
                      Text(
                        distance,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              ClipPath(
                clipper: ZigzagClipper(
                  amplitude: 5.0,
                  wavelength: 10.0,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -10,
            left: 55,
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.circle),
                ),
                Text(
                  '.\n.\n.\n.',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7)),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.circle),
                )
              ],
            )),
      ],
    );
  }
}
