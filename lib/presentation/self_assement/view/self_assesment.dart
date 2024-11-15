import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_assesment_task/core/utility/helper.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_bloc.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_state.dart';

class SelfAssesment extends StatefulWidget {
  const SelfAssesment({super.key});

  @override
  State<SelfAssesment> createState() => _SelfAssesmentState();
}

class _SelfAssesmentState extends State<SelfAssesment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff2f4f3),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text("Self Assessments"),
          actions: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Helper.getWidth(context) * 0.08,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outlined),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
                ],
              ),
            )
          ],
        ),
        backgroundColor: const Color(0xfff2f4f3),
        body: BlocBuilder<SelfAssesmentBloc, SelfAssesmentState>(builder: (context, state) {
          if (state is SelfAssesmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SelfAssesmentLoaded) {
            return Column(
              children: [
                SizedBox(height: Helper.getHeight(context) * 0.015),
                state.profile != null
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Good Morning ",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Helper.getWidth(context) * 0.065),
                              ),
                              Text(
                                state.profile?.userName ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: Helper.getWidth(context) * 0.065),
                              ),
                            ],
                          ),
                          SizedBox(height: Helper.getHeight(context) * 0.015),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.1),
                            child: Text(
                              state.profile?.welcomeMessage ?? "",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: Helper.getHeight(context) * 0.015),
                        ],
                      )
                    : const SizedBox.shrink(),
                Expanded(
                    child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: (Helper.getHeight(context) * 0.1) / 2),
                      height: Helper.getHeight(context),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(Helper.getWidth(context) * 0.09))),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: Helper.getHeight(context) * 0.09),
                            state.categories.isNotEmpty == true
                                ? Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.05),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Categories",
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Helper.getWidth(context) * 0.05),
                                        ),
                                        const Text("View all"),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            state.categories.isNotEmpty == true
                                ? SizedBox(
                                    height: Helper.getHeight(context) * 0.2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.categories.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: Helper.getWidth(context) * 0.03, right: Helper.getWidth(context) * 0.03, top: Helper.getHeight(context) * 0.03),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(Helper.getWidth(context) * 0.05),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(Helper.getWidth(context) * 0.02),
                                                          border: Border.all(color: Colors.black)),
                                                      child: CachedNetworkImage(
                                                        imageUrl: state.categories[index].icon,
                                                        errorWidget: (context, url, error) {
                                                          return Image.asset(
                                                            "assets/resources/ic_sad.png",
                                                            width: Helper.getWidth(context) * 0.1,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: Helper.getHeight(context) * 0.01,
                                                    ),
                                                    Text(state.categories[index].name),
                                                    Text("${state.categories[index].numberOfQuizzes} Quizzes")
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              height: Helper.getHeight(context) * 0.02,
                            ),
                            state.topPicks.isNotEmpty == true
                                ?  Padding(
                              padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.05),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Top Picks",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: Helper.getWidth(context) * 0.05),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            state.topPicks.isNotEmpty == true
                                ? SizedBox(
                                    height: Helper.getHeight(context) * 0.25,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.topPicks.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: Helper.getWidth(context) * 0.9,
                                                margin: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.03, vertical: Helper.getHeight(context) * 0.02),
                                                padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.03, vertical: 0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(Helper.getWidth(context) * 0.02),
                                                    border: Border.all(color: Colors.black)),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(Helper.getWidth(context) * 0.03),
                                                      child: CachedNetworkImage(
                                                        imageUrl: state.topPicks[index].icon,
                                                        errorWidget: (context, url, error) {
                                                          return ClipRRect(
                                                            borderRadius: BorderRadius.circular(Helper.getWidth(context) * 0.03),
                                                            child: Image.asset(
                                                              "assets/resources/ic_psychopathy_test.png",
                                                              width: Helper.getWidth(context) * 0.3,
                                                              height: Helper.getWidth(context) * 0.3,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Helper.getWidth(context) * 0.05,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            "Test ${state.topPicks[index].testTime}",
                                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Helper.getWidth(context) * 0.035),
                                                          ),
                                                          SizedBox(
                                                            height: Helper.getHeight(context) * 0.005,
                                                          ),
                                                          Text(
                                                            state.topPicks[index].testName,
                                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Helper.getWidth(context) * 0.06),
                                                          ),
                                                          SizedBox(
                                                            height: Helper.getHeight(context) * 0.005,
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                            state.topPicks[index].description,
                                                            softWrap: true, // Allows text to wrap to the next line
                                                            overflow: TextOverflow.visible, // Avoids truncation
                                                          )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              height: Helper.getHeight(context) * 0.03,
                            ),
                            state.recentTests.isNotEmpty == true
                                ?  Padding(
                              padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.05),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Recently Taken",
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Helper.getWidth(context) * 0.05),
                                        ),
                                        Text("View all"),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              height: Helper.getHeight(context) * 0.02,
                            ),
                            state.recentTests.isNotEmpty == true
                                ? SizedBox(
                                    height: Helper.getHeight(context) * 0.3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.recentTests.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: Helper.getWidth(context) * 0.03, right: Helper.getWidth(context) * 0.03, top: Helper.getHeight(context) * 0.01),
                                                child: Column(
                                                  children: [
                                                    ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl: state.recentTests[index].icon,
                                                        errorWidget: (context, url, error) {
                                                          return ClipOval(
                                                            child: Image.asset(
                                                              "assets/resources/ic_psychopathy_test.png",
                                                              width: Helper.getWidth(context) * 0.3,
                                                              height: Helper.getWidth(context) * 0.3,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: Helper.getHeight(context) * 0.01,
                                                    ),
                                                    SizedBox(
                                                      width: Helper.getWidth(context) * 0.25,
                                                      child: Text(
                                                        state.recentTests[index].name,
                                                        textAlign: TextAlign.center,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: Helper.getHeight(context) * 0.01),
                                                      padding: EdgeInsets.symmetric(horizontal: Helper.getWidth(context) * 0.04, vertical: Helper.getHeight(context) * 0.005),
                                                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(Helper.getWidth(context) * 0.05)),
                                                      child: const Text(
                                                        "Result",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    state.profile != null
                        ? Positioned(
                            right: Helper.getWidth(context) * 0.12,
                            left: Helper.getWidth(context) * 0.12,
                            child: Container(
                              width: Helper.getWidth(context) * 0.1,
                              padding: EdgeInsets.symmetric(vertical: Helper.getHeight(context) * 0.02, horizontal: Helper.getWidth(context) * 0.05),
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        "Recent Test",
                                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: Helper.getWidth(context) * 0.05),
                                      ),
                                      Text(
                                        state.profile?.recentTestName ?? "",
                                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height:Helper.getWidth(context) * 0.15,
                                        width: Helper.getWidth(context) * 0.15,
                                        child: CircularProgressIndicator(
                                          value: state.profile?.recentTestProgress != null ? (state.profile?.recentTestProgress.toDouble() ?? 0) / 100 : 0.0,
                                          strokeWidth: 7,
                                          backgroundColor: Colors.white38,
                                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                      ),
                                      Positioned(
                                        child: Text(
                                          state.profile?.recentTestProgress != null ? "${state.profile?.recentTestProgress}%" : "0%",
                                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: Helper.getWidth(context) * 0.04),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )),
              ],
            );
          } else if (state is SelfAssesmentError) {
            return  Center(child: Text(state.message,
            style: TextStyle(
              fontSize: Helper.getWidth(context) * 0.06,
              fontWeight: FontWeight.w500
            ),));
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
