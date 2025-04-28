// part of '../../../shared.dart';

// class CircleImageWidget extends StatelessWidget {
//   final String url;
//   final double radius;
//   final BoxFit? fit;

//   const CircleImageWidget({
//     super.key,
//     this.radius=10,
//     required this.url,
//     this.fit,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius:BorderRadius.circular(100) ,

//       child: CachedNetworkImage(
//         imageUrl: url,
//         width: radius*2,
//         height:  radius*2,
//         fit: fit ?? BoxFit.contain,
//         imageBuilder: (context, imageProvider) => Image(image: imageProvider, fit: fit ?? BoxFit.contain),
//         progressIndicatorBuilder: (context, url, progress) => LoadingWidget(),
//         errorWidget:
//             (context, url, error) => Assets.images.guestCourseCardImage.image(
//           scale: 4,
//           width:  radius*2,
//           height:  radius*2,
//           fit: fit ?? BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
