import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_serivce/features/home/presenation/widgets/banner.dart';

import '../../../../core/utilis/appStrings.dart';
import '../controllers/mainButtonscubit/cubit.dart';
import '../widgets/app-bar.dart';
import '../widgets/headLine.dart';
import '../widgets/viewWidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, });

  @override
  Widget build(BuildContext context) {

    return   Column(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomAppBar(title:AppStrings.home),
        const SizedBox(height: 10,),
        const HeadLineWidget(),
        const SizedBox(height: 10,),
        const BannerWidget(),
        const SizedBox(height: 10,),
        Expanded(
          child: BlocProvider(
              create: (_) => NavigationCubit(),child: const ViewWidgets()),
        ),





      ],
    );
  }
}