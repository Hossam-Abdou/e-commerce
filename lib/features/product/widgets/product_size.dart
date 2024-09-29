import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSize extends StatefulWidget {
  final List<int> size;
  final void Function() onSelected;
  const ProductSize({super.key , required this.size , required this.onSelected});

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',
            style: getMediumStyle(color: AppColors.appBarTitleColor)
                .copyWith(fontSize: 18.sp)
        ),
        SizedBox(height: 8.h,),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selected = index;
                  });
                  widget.onSelected;
                },
                child:

                CircleAvatar(
                  radius: 22.r,
                  backgroundColor:
                  index == selected ? AppColors.primary : Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 9.w,
                        vertical: 9.h
                    ),
                    child: Text(
                      '${widget.size[index]}',
                      style: getMediumStyle(
                          color: index == selected
                              ? AppColors.white
                              : AppColors.appBarTitleColor)
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
              );
              },
              separatorBuilder: (context , index)=>SizedBox(width: 17.w,),
              itemCount: widget.size.length),
        ),
      ],
    );
  }
}
