import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageField extends StatefulWidget {
  const CustomImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<CustomImageField> createState() => _CustomImageFieldState();
}

class _CustomImageFieldState extends State<CustomImageField> {
  bool isLoading = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          // هنا يمكنك إضافة الكود لفتح الكاميرا أو المعرض لاختيار صورة
          // على سبيل المثال، يمكنك استخدام مكتبة image_picker
          await pickImage();
          isLoading = false;
          setState(() {});
        },
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child:
                        selectedImage != null
                            ? Image.file(selectedImage!, fit: BoxFit.fill)
                            : Text(
                              "إضافة صورة للمنتج",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo, color: Colors.blue),
                  onPressed: () {
                    // هنا يمكنك إضافة الكود لفتح الكاميرا أو المعرض لاختيار صورة
                  },
                ),
              ),
              Visibility(
                visible: selectedImage != null,
                child: Positioned(
                  top: 5,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      selectedImage = null;
                      widget.onFileChanged(null);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      selectedImage = File(image!.path);
      widget.onFileChanged(selectedImage!);
    } on Exception catch (e) {
      // TODO
    }
  }
}
