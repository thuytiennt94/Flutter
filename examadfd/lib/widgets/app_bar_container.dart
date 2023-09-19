// import '../core/extention/text_style_ext.dart';

import 'package:examadfd/core/constant/color_palatte.dart';
import 'package:examadfd/core/constant/dimension_constant.dart';
import 'package:examadfd/core/extention/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarContainer extends StatelessWidget{
  const AppBarContainer({
    Key? key,
    required this.child,
    this.title,
    this.titleString,
    this.subTitleString,
    this.implementTraling = false,
    this.implementLeading = true,
    this.paddingContent = const EdgeInsets.symmetric(
      horizontal: kMediumPadding,
    ),
}) : assert(title != null || titleString != null, 'title or titleString can\'t be null'),
  super(key: key);
  final Widget child;
  final Widget? title;
  final String? titleString;
  final String? subTitleString;
  final bool implementTraling;
  final bool implementLeading;
  final EdgeInsets? paddingContent;
  
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 160,
                child:AppBar(
                  title: title ??
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if(implementLeading)
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(kMediumPadding),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(kItemPadding),
                                  // child: const Icon(
                                  //   FontAwesomeIcons.arrowLeft,
                                  //   size: kDefaultPadding,
                                  //   color: Colors.black,
                                  // ),
                                ),
                              ),
                            Expanded(child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(titleString ?? '',
                                    style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,),
                                  if(subTitleString != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top:kMediumPadding),
                                      child: Text(
                                        subTitleString!,
                                        style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ),
                            if(implementTraling)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kDefaultPadding),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(kItemPadding),
                                // child: const Icon(
                                //   FontAwesomeIcons.bars,
                                //   size: kDefaultPadding,
                                //   color: Colors.black,
                                // ),
                              ),
                          ],
                        ),
                      ),
                  flexibleSpace: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff8F67E8), Color(0xff6357CC)],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                          ),
                        ),
                      )
                    ],
                  ),
                  centerTitle:true,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  toolbarHeight: 90,
                  backgroundColor: ColorPalette.yellowColor,//backgroundScaffoldColor
                )
              ),
              Container(
                margin: EdgeInsets.only(top:120),
                padding: paddingContent,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}