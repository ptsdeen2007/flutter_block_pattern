import 'package:flutter/material.dart';
import 'MainBlock.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainBlock _mainBloack=MainBlock();
  @override
  void dispose() {
    _mainBloack.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
          stream: _mainBloack.subjectCounterObservable,
          builder: (BuildContext ctx,AsyncSnapshot snaps){
            return  Text(
              '${snaps.data.toString()}',
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
            Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mainBloack.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
