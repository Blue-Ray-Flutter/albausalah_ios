import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  ServiceItem({
    Key? key,
    required this.name,
    required this.activeInActiveButton,
    required this.deleteButton,
    required this.editButton,
  }) : super(key: key);

  String name;
  Widget editButton;
  Widget activeInActiveButton;
  Widget deleteButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 0.4,
          color: Colors.grey[300]!,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            editButton,
            const SizedBox(
              height: 10,
            ),
            activeInActiveButton,
            const SizedBox(
              height: 10,
            ),
            deleteButton,
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
