part of '../register_view.dart';

extension RegisterProfileImageStackExtension on RegisterView {
  Stack profileImage(RegisterCubit reader) {
    return Stack(
      children: [
        reader.image != null
            ? CircleAvatar(
                radius: 72,
                backgroundImage: MemoryImage(reader.image!),
              )
            : const CircleAvatar(
                radius: 72,
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
              ),
        Positioned(
          right: -5,
          bottom: -5,
          child: IconButton(
            onPressed: () {
              reader.selectImage();
            },
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}