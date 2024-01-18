import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        elevation: MaterialStateProperty.all(1.5),
        hintText: 'Search for products',
        hintStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
        leading: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        controller: controller,
      );
    }, suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            // setState(() {
            //   controller.closeView(item);
            // });
          },
        );
      });
    });
  }
}
