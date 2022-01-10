import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:gride_view/all_notifier.dart';

class ExpandablePageWithIndicator extends StatefulWidget {
  List<String>? imageList;
  Function(int)? onPageChange;
  Function()? onLoadMoreTap;
  String? sectionTitle;
  ExpandablePageWithIndicator(
      {Key? key, this.sectionTitle, this.imageList, this.onPageChange,this.onLoadMoreTap})
      : super(key: key);

  @override
  _ExpandablePageWithIndicatorState createState() =>
      _ExpandablePageWithIndicatorState();
}

class _ExpandablePageWithIndicatorState
    extends State<ExpandablePageWithIndicator> {
  int page = 0;
  int totalPageCount = 0;
  int indicatorCount = 0;
  @override
  void initState() {
    totalPageCount = (widget.imageList!.length % 4 == 0
        ? ((widget.imageList!.length / 3).round() > 2)
        ? 3
        : (widget.imageList!.length / 3).round() + 1
        : ((widget.imageList!.length / 3).round() > 2)
        ? 3
        : (widget.imageList!.length / 3).round() == 0
        ? 1
        : (widget.imageList!.length / 3).round());
    indicatorCount = totalPageCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const progressColor = Colors.black;
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: TextStyleTheme.customText(
                widget.sectionTitle!, 20, Colors.black, FontWeight.bold)),
        widget.imageList!.isNotEmpty
            ? Column(
          children: [
            ExpandablePageView.builder(
                controller: PageController(initialPage: page),
                onPageChanged: (index) {
                  page = index;
                  setState(() {});
                  widget.onPageChange!.call(index);
                },
                itemCount: totalPageCount,
                itemBuilder: (_, page) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int index = page * 4;
                              index <= (page * 4) + 1;
                              index++)
                                buildItem(context, widget.imageList!,
                                    index, progressColor),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int index = (page * 4) + 2;
                              index <= (page * 4) + 3;
                              index++)
                                buildItem(context, widget.imageList!,
                                    index, progressColor),
                            ])
                      ]);
                }),
            if (widget.imageList!.length >= 4)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < indicatorCount; i++)
                  Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == page
                            ? const Color.fromRGBO(0, 0, 0, 0.9)
                            : const Color.fromRGBO(0, 0, 0, 0.4)),
                  )
              ]),
          ],
        )
            : Container(),
      ],
    );
  }

  Widget buildItem(BuildContext context, List<String> listImageUrl, int index,
      Color progressColor) {
    return index <= (listImageUrl.length > 11 ? 11 : listImageUrl.length)
        ? SizedBox(
      height: 195,
      width: 195,
      child:
      index <= (listImageUrl.length > 11 ? 11 : listImageUrl.length)
          ? Card(
        elevation: 7,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: index >=
            (listImageUrl.length > 11
                ? 11
                : listImageUrl.length)
            ? InkWell(
          onTap: widget.onLoadMoreTap,
          child: const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  "Load More",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ) //Icon(FontAwesomeIcons.plus),
          ),
        )
            : ImageNetwork(
          progressColor: progressColor,
          imgUrl: listImageUrl[index],
        ),
      )
          : Container(),
    )
        : Container();
  }
}
