// import 'package:egyption_foods/constants/colors.dart';
// import 'package:egyption_foods/constants/extensions.dart';
// import 'package:egyption_foods/constants/strings.dart';
// import 'package:egyption_foods/controllers/home_controller.dart';
// import 'package:egyption_foods/models/food_model.dart';
// import 'package:egyption_foods/views/widgets/hero_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
//
// class FoodWidget extends StatelessWidget {
//   final FoodModel food;
//
//   const FoodWidget(this.food, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return HeroWidget(
//       tag: food.image,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 10),
//         decoration: BoxDecoration(
//           color: AppColors.lightBlueColor,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [BoxShadow(color: AppColors.lightBlueColor, offset: const Offset(0, 0), blurRadius: 8, spreadRadius: 1)],
//         ),
//         child: Stack(
//           alignment: Alignment.topRight,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(padding: 10.edgeInsetsHorizontal, child: Center(child: ClipRRect(borderRadius: 15.borderRadiusAll, child: Image.network(food.image)))),
//                 5.gap,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(food.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.titlesColor)),
//                             5.gap,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
//                                   decoration: BoxDecoration(color: AppColors.lightParchmentToneColor, borderRadius: BorderRadius.circular(20)),
//                                   child: Text(food.price.toString() + AppStrings.spaceSign + AppStrings.dollarSign, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.lightBlueColor)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       10.gap,
//                       Expanded(
//                         flex: 0,
//                         child: GetBuilder<HomeController>(
//                           builder: (controller) {
//                             bool isContainedToFav = controller.user.fav.contains(food.id);
//                             return InkWell(
//                               onTap: () => controller.updateFavList(food.id),
//                               child: CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: AppColors.lightParchmentToneColor,
//                                 child: Icon(isContainedToFav ? Icons.favorite : Icons.favorite_border, color: isContainedToFav ? AppColors.redColor : AppColors.lightBlueColor, size: 18),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
