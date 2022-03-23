part of '../add_book_view.dart';

extension SelectImage on AddBookView {
  Column selectImage(BuildContext context, AddBookCubit reader) {
    return Column(
      children: [
        reader.image != null
            ? Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: MemoryImage(reader.image!), fit: BoxFit.contain),
                ),
              )
            : Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all()),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                ),
              ),
        TextButton(
            onPressed: () {
              reader.selectImage();
            },
            child: Text(
              LocaleKeys.addBook_selectButton.tr(),
            ))
      ],
    );
  }
}
