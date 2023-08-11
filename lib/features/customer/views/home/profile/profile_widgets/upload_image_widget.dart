import 'dart:io';

import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? _image;

final ImagePicker _picker = ImagePicker();

takePhoto(ImageSource source, cxt) async {
  final pickedFile = await _picker.pickImage(
      source: source, maxHeight: 500.0, maxWidth: 500.0);
  _image = pickedFile;

  // Navigator.pop(cxt);
}

uploadImageWidget({required BuildContext context}) {
  return Container(
    height: 105,
    width: 105,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white.withOpacity(0.5), width: 2)),
    child: Center(
      child: Stack(
        children: [
          _image != null
              ? Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: FileImage(
                            File(_image!.path.toString()),
                          ),
                          fit: BoxFit.fitWidth)),
                )
              :  const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 40,
                  child: Icon(Icons.person, color: AppColors.white, size: 50),
                ),
          Positioned(
            top: 0,
            right: 2,
            bottom: -40,
            child: InkWell(
              onTap: () async {
                await takePhoto(ImageSource.camera, context);
              },
              child:  const CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 10,
                child:
                    Icon(Icons.add_a_photo, color: AppColors.primary, size: 10),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
