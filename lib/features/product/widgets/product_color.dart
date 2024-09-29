import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatefulWidget {
  final List<Color> color;
  final void Function() onSelected;

  const ProductColor(
      {super.key, required this.color, required this.onSelected});

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                    widget.onSelected.call();
                  },
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: widget.color[index],
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: index == selected
                            ? AppColors.white
                            : Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 17.w,
                  ),
              itemCount: widget.color.length),
        ),
      ],
    );
  }
}
