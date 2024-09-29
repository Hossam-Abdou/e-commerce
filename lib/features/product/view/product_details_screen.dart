import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/components/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/bottom_nav_bar/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/product/widgets/product_color.dart';
import 'package:e_commerce/features/product/widgets/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/product_counter.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int? currentIndex;

  // int initialIndex = 0 ;
  @override
  initState() {
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(
            color: AppColors.textColor,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    controller: _controller,
                    items: [
                      Image.asset(ImageAssets.productImage),
                      Image.asset(ImageAssets.brandHomeImage),
                      Image.asset(ImageAssets.carouselSlider2),
                    ],
                    options: CarouselOptions(
                      aspectRatio: 199.w / 150.h,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex!,
                      count: 3,
                      duration: const Duration(microseconds: 0),
                      effect: ExpandingDotsEffect(
                        dotWidth: 7.w,
                        dotHeight: 7.h,
                        dotColor: Colors.grey.shade400,
                        paintStyle: PaintingStyle.fill,
                        activeDotColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nike Air Jordon',
                    style: getMediumStyle(
                      color: AppColors.textColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'EGP 3,500',
                    style: getMediumStyle(
                      color: AppColors.textColor,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.primary.withOpacity(.3), width: 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      '3250 Sold',
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(color: AppColors.primary)
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset(
                    ImageAssets.rate,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Text(
                      '5.5',
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(color: AppColors.appBarTitleColor)
                          .copyWith(fontSize: 14.sp),
                    ),
                  ),
                  ProductCounter(
                      add: (_) {}, remove: (_) {}, productCounter: 1),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: getMediumStyle(color: AppColors.appBarTitleColor)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              ReadMoreText(
                'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories',
                style: getMediumStyle(
                        color: AppColors.appBarTitleColor.withOpacity(.6))
                    .copyWith(fontSize: 18.sp),
                trimExpandedText: ' Read Less',
                trimCollapsedText: ' Read More',
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: AppColors.appBarTitleColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              ProductSize(
                size: const [35, 38, 39, 40],
                onSelected: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('Color',
                  style: getMediumStyle(color: AppColors.appBarTitleColor)
                      .copyWith(fontSize: 18.sp)),
              ProductColor(color: const [
                Colors.red,
                Colors.blueAccent,
                Colors.green,
                Colors.yellow,
              ], onSelected: () {}),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                                color: AppColors.primary.withOpacity(.6))
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text('EGP 3,500',
                          style:
                              getMediumStyle(color: AppColors.appBarTitleColor)
                                  .copyWith(fontSize: 18.sp))
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {},
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
