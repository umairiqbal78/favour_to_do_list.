import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends statelessWidget {
// using mock values from mock_favors dart file for now
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: FavorsPage(
        pendingAnswerFavors: mockPendingFavors,
        completedFavors: mockCompletedFavors,
        refusedFavors: mockRefusedFavors,
        acceptedFavors: mockDoingFavors,
    ),
    );
  }
}

class FavorsPage extends statelessWidget {
// using mock values from mock_favors dart file for now
  final List<Favor> pendingAnswerFavors;
  final List<Favor> acceptedFavors;
  final List<Favor> completedFavors;
  final List<Favor> refusedFavors;
  FavorsPage({
    Key key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFfavors,
    this.refusedFavors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {...} // for brevity
}
// The Tab bar items are created by the _buildCategoryChip() method, as follows:

class FavorsPage extends statelessWidget {
// ... fields, build method and others
  Widget _buildCategoryTab(String title) {
    return Tab(
      child: Text(title),
    );
  }
}

class FavorsPage extends statelessWidget {
// ... fields, build method and others
  Widget _favorsList(String title, List<Favor> favors) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          child: Text(title),
          padding: EdgeInsets.only(top: 16.0),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: favors.length,
            itemBuilder: (BuildContext context, int index) {
              final favor = favors[index];
              return Card(
                key: ValueKey(favor.uuid),
                margin: EdgeInsets.symmetric(vertical: 10.0,
                    horizontal: 25.0),
                child: Padding(
                  child: Column(
                    children: <Widget>[
                      _itemHeader(favor),
                      Text(favor.description),
                      _itemFooter(favor)
                    ],
                  ),
                  padding: EdgeInsets.all(8.0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
Row _itemHeader(Favor favor) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
          favor.friend.photoURL,
        ),
      ),
      Expanded(
          child: Padding(
          padding: EdgeInsets.only(left: 8.0),
      child: Text("${favor.friend.name} asked you to...")),
      )
    ],
  );
}

Widget _itemFooter(Favor favor) {
  if (favor.isCompleted) {
    final format = DateFormat();
    return Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(label: Text("Completed at: ${format.format(favor.completed)}"),
          ),
    );
          }
        if (favor.isRequested) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //FlatButton is a Material Design button that does not have an elevation or background color on it.
              FlatButton(
                child: Text("Refuse"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Do"),
                onPressed: () {},
              )
            ],
          );
      }
    if (favor.isDoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("give up"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("complete"),
            onPressed: () {},
          )
        ],
      );
    }
    return Container();
  }
class RequestFavorPage extends statelessWidget {
  final List<Friend> friends;
  RequestFavorPage({Key key, this.friends}) : super(key: key);
  @override
  Widget build(BuildContext context) {...} // for brevety
}