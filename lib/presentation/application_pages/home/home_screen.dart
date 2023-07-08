import 'package:course_app/common/values/colors.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_blocs.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_states.dart';
import 'package:course_app/presentation/application_pages/home/widgets/home%20_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: BlocBuilder<HomePageBlocs,HomePageStates>(
          builder:(context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20.w),
              child: CustomScrollView(
                  slivers: [
                  //Title Texts
                  SliverToBoxAdapter(
                    child: homePageTexts('Hello,',color: AppColors.primaryThreeElementText,),
                  ),
                  SliverToBoxAdapter(
                    child:  homePageTexts('Omar Osama',top: 5,),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                  ),
                 SliverToBoxAdapter(
                   child:  searchView(),
                 ),
                 SliverToBoxAdapter(
                   child:slidersView(context,state),
                 ),
                  SliverToBoxAdapter(
                    child:  menuView(),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 0.w,
                    ),
                    sliver: SliverGrid(
                      // To Control the Total number of horz and vertc. items
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing:15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.6
                        ),

                         // where you control the number of items in the grid
                         delegate:SliverChildBuilderDelegate(
                           childCount: 4,
                             (BuildContext context,int index){
                               return GestureDetector(
                                 onTap: () {

                                 },
                                 child: courseGrid(),
                               );
                             }
                         ) ),
                  ),
                ],
              ),
            );
          }, ),
    );
  }
}
