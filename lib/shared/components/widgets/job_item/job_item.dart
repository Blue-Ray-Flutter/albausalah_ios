import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:flutter/material.dart';

class JobItem extends StatelessWidget {
  const JobItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 0.4,
          color: Colors.grey[300]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Job Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'about jod about jod about jod about jod about jod about jod about jod about jod about jod about jod about jod',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Button(
                    radius: 15,
                    height: 50,
                    onPressed: () {},
                    text: 'Edit',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Button(
                    radius: 15,
                    height: 50,
                    onPressed: () {},
                    text: 'Remove',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Button(
                    radius: 15,
                    height: 50,
                    onPressed: () {},
                    text: 'Stop',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
