import 'package:flutter/material.dart';

import '../button/button.dart';

class ClientOrderFinishedItem extends StatelessWidget {
  ClientOrderFinishedItem({
    Key? key,
    required this.address,
    required this.name,
    required this.onTap,
    required this.date,
    required this.phone,
    required this.price,
    required this.productNumber,
    required this.totalPrice,
    required this.status,
    required this.onPressed,
  }) : super(key: key);
  String? name;
  String? address;
  String? date;
  String? phone;
  String? totalPrice;
  String? price;
  String? productNumber;
  String? status;

  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(
                0,
                3,
              ),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(
                3,
                0,
              ),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(
                0,
                -3,
              ),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(
                -3,
                0,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Product Number :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    productNumber!,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Date & Time :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    date!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Phone :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    phone!,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Total :',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    price!,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Total summation :',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    totalPrice!,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Stauts :',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    status!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                radius: 10,
                height: 40,
                onPressed: onPressed!,
                text: 'Order details',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
