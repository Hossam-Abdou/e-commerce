import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/bottom_nav_bar/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/product/view_model/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});


  @override
  Widget build(BuildContext context) {
    String? categoryId = ModalRoute.of(context)?.settings.arguments as String?;

    print('product screen id is ${categoryId}');

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
  create: (context) => ProductCubit()..getAllProducts(categoryId),
  child: BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    var cubit = ProductCubit.get(context);
    return GridView.builder(
      itemCount: cubit.getAllProductsModel?.data?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 12/18
          ),
          itemBuilder: (context, index) {
            return  InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.productDetailsRoute);
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: const Color(0xff8a9dae),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(

                        cubit.getAllProductsModel?.data?[index].category?.image ?? '',
                        height:MediaQuery.sizeOf(context).height*0.19,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(ImageAssets.carouselSlider2); // Placeholder image
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Text(
                            cubit.getAllProductsModel?.data?[index].category?.name??'',
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
                              Text(
                                '${cubit.getAllProductsModel?.data?[index].priceAfterDiscount??''} ',
                                style: getMediumStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                cubit.getAllProductsModel?.data?[index].price.toString()??'',
                                style: getTextWithLine(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Review 5",
                                    style: getRegularStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.starRateColor,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: InkWell(
                                  onTap: () {


                                  },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height * 0.036,
                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          },

    );
  },
),
),
    );
  }
}
