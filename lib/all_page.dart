import 'package:flutter/material.dart';
import 'package:gride_view/all_notifier.dart';
import 'package:gride_view/expand_page_indicator_view.dart';
import 'package:provider/provider.dart';

class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  int page0 = 0;
  int page1 = 0;
  int page2 = 0;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AllNotifier>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ExpandablePageWithIndicator(
                  imageList: state.listImageUrl0,
                  sectionTitle: "All",
                  onLoadMoreTap: () {
                    print("Section All On Load more tap");
                  },
                  onPageChange: (index) {
                    print("Section All Expandable change at $index");
                  },
                ),
                ExpandablePageWithIndicator(
                  imageList: state.listImageUrl1,
                  sectionTitle: "A",
                  onLoadMoreTap: () {
                    print("Section A On Load more tap");
                  },
                  onPageChange: (index) {
                    print("Section A Expandable change at $index");
                  },
                ),
                ExpandablePageWithIndicator(
                  imageList: state.listImageUrl2,
                  sectionTitle: "B",
                  onLoadMoreTap: () {
                    print("Section B On Load more tap");
                  },
                  onPageChange: (index) {
                    print("Section B Expandable change at $index");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
