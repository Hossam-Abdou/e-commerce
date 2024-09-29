import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: const Color(0xff8a9dae),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  ImageAssets.subcategoryCardImage,
                  width: 125.w,
                  height: 125.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.44,
                      child: Text(
                        'Nike Air Jordon Nike shoes flexible for wo..',
                        style: getMediumStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'Orange Color ',
                      textAlign: TextAlign.start,
                      style: getMediumStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '1000 EGP ',
                            style: getMediumStyle(
                              color: AppColors.textColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '1,300 EGP',
                            style: getTextWithLine(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 6,vertical: 8),
                child: Column(
                  children: [
                    Material(
                      color: AppColors.white,
                      elevation: 5,
                      shape: const StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ImageIcon(
                          color: AppColors.primary,
                          AssetImage(
                            IconsAssets.icClickedHeart,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 36.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(

                                borderRadius:
                                    BorderRadius.circular(AppSize.s14.r)),
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSize.s1.w),
                            backgroundColor: AppColors.primary,
                          ),
                          onPressed: () {},
                          child: Text('Add to Cart',
                              style: getRegularStyle(
                                color: AppColors.white,
                                fontSize: AppSize.s14.sp,
                              ))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
