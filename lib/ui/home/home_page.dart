import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nine_gags/common/constants.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';
import 'package:nine_gags/data/repositories/post_repository.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/ui/fresh/fresh_page.dart';
import 'package:nine_gags/ui/hot/hot_page.dart';
import 'package:nine_gags/ui/tag_detail/tag_detail_page.dart';
import 'package:nine_gags/ui/trending/trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final repository = getIt.get<PostRepository>();

  final List<TagResponse> popular = [];
  final List<TagResponse> other = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    fetchTags();
  }

  void fetchTags() async {
    final data = await repository.fetchTags();
    setState(() {
      popular.addAll(data.popular);
      other.addAll(data.other);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(ImageAssets.icLogo),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu))
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    'HOT',
                    style: PrimaryFont.din(22, FontWeight.bold).copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'TRENDING',
                    style: PrimaryFont.din(22, FontWeight.bold).copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'FRESH',
                    style: PrimaryFont.din(22, FontWeight.bold).copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HotPage(),
                  TrendingPage(),
                  FreshPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: size.width * 0.6,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Home',
                    style: PrimaryFont.din(14, FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Explore Popular Tags',
                    style: PrimaryFont.din(12, FontWeight.bold)
                        .copyWith(color: const Color(0x80000000)),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildItemDrawer(popular[index]);
                  },
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popular.length,
                ),
                const Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Other Tags',
                    style: PrimaryFont.din(12, FontWeight.bold)
                        .copyWith(color: const Color(0x80000000)),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildItemDrawer(other[index]);
                  },
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: other.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemDrawer(TagResponse tag) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('$TagDetailPage', arguments: tag);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Expanded(
                child: Text(tag.key ?? '',
                    style: PrimaryFont.din(16, FontWeight.bold))),
            const Icon(Icons.star_border),
          ],
        ),
      ),
    );
  }
}
