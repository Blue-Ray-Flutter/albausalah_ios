import 'package:flutter/material.dart';

import '../../../shared/components/widgets/job_item/job_item.dart';
import '../../../shared/components/widgets/size_config/size_config.dart';

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.6,
          title: const Text(
            'Jobs',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 30,
              ),
              itemBuilder: (context, index) => const JobItem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: 5,
            )),
      ),
    );
  }
}
