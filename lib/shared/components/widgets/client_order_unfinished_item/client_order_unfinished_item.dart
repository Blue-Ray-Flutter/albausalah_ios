import 'package:flutter/material.dart';

class ClientOrderUnFinishedItem extends StatelessWidget {
  ClientOrderUnFinishedItem({
    Key? key,
    required this.address,
    required this.name,
    required this.onTapAcceptOrder,
    required this.date,
    required this.phone,
    required this.price,
    this.haveRejectedButton = true,
    required this.productNumber,
    required this.totalPrice,
    required this.status,
    required this.onTapViewOrder,
    required this.onTapRejectOrder,
  }) : super(key: key);
  String? name;
  String? address;
  String? date;
  String? phone;
  String? totalPrice;
  String? price;
  String? productNumber;
  String? status;
  bool haveRejectedButton;

  final void Function()? onTapAcceptOrder;
  final void Function()? onTapViewOrder;
  final void Function()? onTapRejectOrder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAcceptOrder,
      child: Container(
        decoration: BoxDecoration(
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
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
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onTapViewOrder,
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onTapAcceptOrder,
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Icon(
                          Icons.done,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  haveRejectedButton
                      ? Expanded(
                          child: InkWell(
                            onTap: onTapRejectOrder,
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Icon(
                                Icons.block,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
