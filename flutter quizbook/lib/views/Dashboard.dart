import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_2/Controller/Deshboard_Controller.dart';
import 'package:quiz_2/Widget/Common_Appbar.dart';

class Dashboard extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppBar(
          title: "Categories",
          isBackArrow: false,
        ),
      ),
      body: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (dashboardController.dashboardItems.length / 6).ceil(),
            itemBuilder: (context, columnIndex) {
              int startIndex = columnIndex * 6;
              int endIndex = (columnIndex + 1) * 6;

              if (endIndex > dashboardController.dashboardItems.length) {
                endIndex = dashboardController.dashboardItems.length;
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: List.generate(
                        5, // Assuming you want to display 5 cards
                        (index) {
                          var item = dashboardController.dashboardItems[
                              (startIndex + index) %
                                  dashboardController.dashboardItems.length];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(item.subjectImage),
                                  radius: 30,
                                ),
                                SizedBox(height: 8),
                                Text(item.subjectName),
                                Text(item.standardName),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
