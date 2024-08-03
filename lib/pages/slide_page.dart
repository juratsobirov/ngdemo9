import 'package:flutter/material.dart';

// Slide Animation
class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<Offset>? _animation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this, duration: Duration(milliseconds: 1200));
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0.0),)
    .animate(CurvedAnimation(
      parent:_controller!,
      curve:Curves.elasticIn,
    ));
    _controller!.addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        _controller!.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Slide Animation"),
      ),

      body:Center(
        child:SlideTransition(
          position: _animation!,
          child: SizedBox(
            height:200,
            width:200,
            child:Image.asset("assets/images/im_sample.jpeg"),
          ),
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.indigoAccent,
        child: Icon(Icons.play_arrow),
        onPressed:(){
          _controller!.forward();
        },
      ),
    );
  }
}
