import 'package:flutter/material.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';
import 'package:nine_gags/ui/tag_detail/tag_detail_page.dart';

class TagView extends StatelessWidget {
  const TagView({Key? key, required this.tag}) : super(key: key);

  final TagResponse tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('$TagDetailPage', arguments: tag);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0x20000000),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          tag.key ?? '',
          style: PrimaryFont.din(13, FontWeight.bold),
        ),
      ),
    );
  }
}
