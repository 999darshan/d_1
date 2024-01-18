import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_2/Controller/Deshboard_Controller.dart';
import 'package:quiz_2/Utils/Constanc.dart';

class Deshboardscreen extends StatelessWidget {
  final DashboardController _controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Standard'),
        backgroundColor: WhiteColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => ListView.separated(
                separatorBuilder: (_, index) => SizedBox(height: 30),
                physics: BouncingScrollPhysics(),
                itemCount: _controller.standards.length,
                itemBuilder: (_, index) {
                  return Container(
                    height: 220,
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        color: WhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GreyColor),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Standard ${_controller.standards[index].std}',
                                style: TextStyle(
                                  color: BlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MixPurple,
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                    color: WhiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: GreyColor,
                            height: 1,
                            thickness: 3,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ListView.separated(
                              separatorBuilder: (_, index1) => SizedBox(
                                    width: 20,
                                  ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  _controller.standards[index].subject.length,
                              itemBuilder: (_, index1) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: Image.asset(
                                                  _controller.standards[index]
                                                      .subject[index1].img)
                                              .image,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _controller.standards[index]
                                            .subject[index1].subjectName,
                                        style: TextStyle(
                                          color: BlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ))
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
