import 'package:flutter/material.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';
import 'package:nine_gags/ui/tag_detail/fresh/fresh_tag_page.dart';
import 'package:nine_gags/ui/tag_detail/hot/hot_tag_page.dart';

class TagDetailPage extends StatefulWidget {
  final TagResponse tag;

  const TagDetailPage({Key? key, required this.tag}) : super(key: key);

  @override
  State<TagDetailPage> createState() => _TagDetailPageState();
}

class _TagDetailPageState extends State<TagDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.tag.key ?? '', style: PrimaryFont.din(22, FontWeight.bold).copyWith(color: Colors.black),),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(child: Text('HOT', style: PrimaryFont.din(22, FontWeight.bold).copyWith(color: Colors.black),),),
            Tab(child: Text('FRESH', style: PrimaryFont.din(22, FontWeight.bold).copyWith(color: Colors.black),),),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            HotTagPage(path: widget.tag.url ?? '',),
            FreshTagPage(path: widget.tag.url ?? ''),
          ],
        ),
      ),
    );
  }
}
