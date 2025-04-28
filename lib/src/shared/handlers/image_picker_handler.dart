// part of '../../shared.dart';

// import 'package:buypass_seller/src/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';

// class ImagePickerHandler {
//   Future showPicker({required BuildContext context, required Function(XFile?) onGetImage}) {
//     return showModalBottomSheet(
//       backgroundColor: Colors.white.withOpacity(0),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0),
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   topLeft: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               // bool result = await requestStoragePermission(
//                               //     isCamera: true);
//                               //
//                               // if (result) {
//                               Navigator.of(context).pop();
//                               imgFromCamera(context).then((value) {
//                                 if (value != null) onGetImage(value);
//                               });
//                               // } else {
//                               //   _showPermissionDialog(
//                               //     context,
//                               //     isCamera: true,
//                               //   );
//                               // }
//                             },
//                             child: Container(
//                               height: 48,
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: SfProText(
//                                   'Take photo',
//                                   size: 18,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           const Divider(color: Colors.grey, height: 1, thickness: 1),
//                           GestureDetector(
//                             onTap: () async {
//                               bool result = await requestStoragePermission(isCamera: false);

//                               if (result) {
//                                 Navigator.of(context).pop();
//                                 imgFromGallery(context).then((value) {
//                                   if (value != null) onGetImage(value);
//                                 });
//                               } else {
//                                 _showPermissionDialog(context, isCamera: false);
//                               }
//                             },
//                             child: Container(
//                               height: 48,
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: SfProText(
//                                   'Gallery photo',
//                                   size: 18,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: SfProText('Cancel', size: 18, fontWeight: FontWeight.w400, color: Colors.red),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Future<XFile?> imgFromCamera(BuildContext context) async {
//     final picker = ImagePicker();
//     XFile? image = await picker.pickImage(source: ImageSource.camera);

//     if (image == null) {
//       return null; // Handle null scenario
//     }

//     CroppedFile? croppedFile = await _cropImage(image.path);

//     if (croppedFile == null) {
//       return null; // Handle null scenario
//     }

//     return _compressImage(croppedFile);
//   }

//   Future<XFile?> onOpenFrontCamera(BuildContext context) async {
//     final picker = ImagePicker();
//     XFile? image = await picker.pickImage(
//       source: ImageSource.camera,
//       preferredCameraDevice: CameraDevice.front,
//     );

//     if (image != null) {
//       CroppedFile? croppedFile = await _cropImage(image.path);

//       if (croppedFile != null) {
//         return _compressImage(croppedFile);
//       }
//     }

//     return null;
//   }

//   Future<XFile?> imgFromGallery(BuildContext context) async {
//     final picker = ImagePicker();

//     XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image == null) {
//       return null; // Handle null scenario
//     }

//     CroppedFile? croppedFile = await _cropImage(image.path);

//     if (croppedFile == null) {
//       return null; // Handle null scenario
//     }

//     return _compressImage(croppedFile);
//   }

//   Future<CroppedFile?> _cropImage(String imagePath) async {
//     return await ImageCropper().cropImage(
//       sourcePath: imagePath,
//       compressFormat: ImageCompressFormat.jpg,
//       compressQuality: 100,
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Image cropper',
//           toolbarColor: AppColors.color121521,
//           toolbarWidgetColor: AppColors.white,
//           initAspectRatio: CropAspectRatioPreset.square,
//           lockAspectRatio: true,
//           hideBottomControls: true,
//         ),
//         IOSUiSettings(title: 'Image cropper', rotateButtonsHidden: true),
//       ],
//     );
//   }

//   Future<XFile?> _compressImage(CroppedFile croppedFile) async {
//     final dir = await path_provider.getTemporaryDirectory();
//     final targetPath = '${dir.absolute.path}/.jpg';

//     final result = await FlutterImageCompress.compressAndGetFile(
//       croppedFile.path,
//       targetPath,
//       minHeight: 1080,
//       minWidth: 1080,
//       quality: 50,
//     );

//     if (result == null) {
//       return null; // Handle compression failure
//     }

//     return result;
//   }

//   Future<bool> requestStoragePermission({bool isCamera = false}) async {
//     PermissionStatus status =
//         isCamera ? await Permission.camera.request() : await Permission.photos.request();
//     if (status.isDenied || status.isPermanentlyDenied) {
//       return false;
//     }

//     return true;
//   }

//   void _showPermissionDialog(BuildContext context, {required bool isCamera}) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: Text('Permission required'),
//             content: Text(
//               'Please enable ${isCamera ? 'camera' : 'photo'} access in the app settings to use this feature.',
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   openAppSettings();
//                 },
//                 child: Text('Open Settings'),
//               ),
//             ],
//           ),
//     );
//   }

//   static Future<XFile?> vidFromCamera() async {
//     final picker = ImagePicker();
//     return await picker.pickVideo(source: ImageSource.camera);
//   }

//   static Future<XFile?> vidFromGallery() async {
//     final picker = ImagePicker();
//     return await picker.pickVideo(source: ImageSource.gallery);
//   }

//   static Future<PlatformFile?> fileFromGallery() async {
//     final result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       return result.files.first;
//     } else {
//       return null; // User canceled the picker
//     }
//   }
// }
