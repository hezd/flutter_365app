import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_365app/routes/home_page.dart';

import 'common/global.dart';
import 'routes/guide_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((value) => runApp(MyApp()));
}

/**
 * StatelessWidget生命周期：
 *  只有build方法当widget被创建时调用
 * StateFulWidget生命周期：
 *  createState当创建widget时会被立即调用
 *  initState相当于Activity的Oncreate方法只执行一次
 *  didChangeDependences在initState之后被调用，以后不会在刷新，只有当依赖的widget刷新时才会被调用可能会调用多次
 *  build在didChangeDependences之后被调用以后当widget需要刷新时会被调用
 *  didUpdateWidget上级节点rebuild widget时会被调用
 *  deactivate当state被移除时调用相当于actiivty的onstop
 *  dispose当组件被移除时调用相当于activity的onDestroy
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    var isGuide = Global.prefs.getBool("isGuide")??false;
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home:isGuide? HomePage() : GuidePage(),
    );
  }
}

// class GuidePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _GuideState();
//   }
// }

// class _GuideState extends State<GuidePage> {
//   PageController pageController;
//   int currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//
//     return Scaffold(
//         body: Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: PageView.builder(
//         onPageChanged: (int index) {
//           currentPage = index;
//         },
//         reverse: false,
//         physics: ClampingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         controller: pageController,
//         itemCount: 4,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(// 由GestureDetector包裹可监听点击事件
//             child: Image.asset(
//               "images/img_page${index + 1}.webp",
//               fit: BoxFit.cover,
//             ),
//             onTap: (){
//               print("index = $index");
//               if(index == 3){
//                 // Navigator.popAndPushNamed(context, '/home');
//                 // Navigator.pushReplacementNamed(context, '/home');
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return HomeRouter();
//                 }));
//               }
//             },
//           );
//           // Image(image: AssetImage("images/img_page${index+1}.png"),fit: BoxFit.cover);
//         },
//       ),
//     ));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(
//       initialPage: 0,
//       keepPage: true,
//     );
//
//     pageController.addListener(() {
//       double offset = pageController.offset;
//       var page = pageController.page;
//       print("offset=$offset page$page");
//     });
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
