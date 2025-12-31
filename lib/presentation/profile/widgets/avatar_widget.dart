import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? imageUrl;
  const AvatarWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? const Icon(Icons.person, size: 50, color: Colors.black54)
              : null,
        ),
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.edit, size: 14, color: Colors.white),
        ),
      ],
    );
  }
}
