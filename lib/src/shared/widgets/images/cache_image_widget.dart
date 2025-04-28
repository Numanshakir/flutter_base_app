// part of '../../../shared.dart';

// import 'package:flutter/material.dart';

// class CachedImageWidget extends StatelessWidget {
//   final String url;
//   final double? height;
//   final double? width;
//   final double? borderRadius;
//   final BoxFit? fit;
//   final BoxShape? shape;
//   final bool? isProfile;
//   final Color? iconColor;

//   const CachedImageWidget({
//     super.key,
//     this.width,
//     this.borderRadius,
//     required this.url,
//     this.height,
//     this.iconColor,
//     this.fit,
//     this.shape,
//     this.isProfile,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Widget errorWidget =
//     //     (isProfile != null && isProfile == true)
//     //         ? Assets.icons.userPlaceholder.image(
//     //           scale: 4,
//     //           width: width ?? 40,
//     //           height: height ?? 40,
//     //           fit: fit ?? BoxFit.contain,
//     //         )
//     //         : Assets.images.guestCourseCardImage.image(
//     //           scale: 4,
//     //           width: width ?? 40,
//     //           height: height ?? 40,
//     //           fit: fit ?? BoxFit.contain,
//     //         );
    

//       return ClipRRect(
//         borderRadius:
//             shape == BoxShape.circle ? BorderRadius.circular(100) : BorderRadius.circular(borderRadius ?? 0),
//         child: CachedNetworkImage(
//           // imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
//           imageUrl: url,
//           color: iconColor,
//           width: width ?? 40,
//           height: height ?? 40,
//           fit: fit ?? BoxFit.contain,
//           imageBuilder:
//               (context, imageProvider) =>
//                   Image(image: imageProvider, fit: fit ?? BoxFit.contain, color: iconColor),
//           progressIndicatorBuilder: (context, url, progress) => LoadingWidget(),
//           // errorWidget: (context, url, error) => errorWidget,
//         ),
//       );
    
//   }
// }
