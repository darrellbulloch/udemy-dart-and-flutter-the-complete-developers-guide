import 'package:flutter/material.dart';
import '../widgets/cat.dart';

// Use a Stateful widget to store local state info,
// data that is only useful to the Home Screen
// BLOCs are used for application wide data

// This base class is recreated everytime the widget is rendered
class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return HomeState();
  }
}

// The State object is created only once to maintain the state
class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  // State class LifeCycle method
  //     - called when a new instance is created
  //     - available only for State classes
  initState() {
    super.initState();

    catController = AnimationController(
      // overall duration of the animation
      duration: Duration(seconds: 2),
      // TickerProvider - tells AnimationController to progress the animation to the next frame, by updating the Animation variable
      // Must define this class as a TicketProvider by implementing TickerProviderStateMixin
      vsync: this,
    );

    // animate the Cat's vertical position from 0px to 100px
    // Note that the Tween object is not saved as part of the state - it is not needed later
    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      // Rate at which animation will occur
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    // start the animation
    catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation!"),
      ),
      body: buildAnimation(),
    );
  }

  Widget buildAnimation() {
    // Unlike StreamBuilder, we don't want to return a new Widget every time
    // the animation occurs, such as 60 times per second
    // the 3rd parameter, child, is needed for this.
    // The child objec is passed into the builder
    // function everytime the animation is updated

    // Note that the only way to change a widget on the screen is to create a new one
    // So, return a new Container widget each time
    // But, it is not expensive to create a Container widget
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (BuildContext context, Widget child) {
        return Container(
          child: child,
          // Everytime the animation occurs, the Container is recreated
          // and the margin changes based on the current value of the catAnimation
          // which animates the widget (0 to 100 based on the Tween)
          // Note that this is where we define the property that is being animated
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      // This one instance is reused everytime, instead of creating a new one
      child: Cat(),
    );
  }
}