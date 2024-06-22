import 'package:flutter/material.dart';
import 'package:inherited_state_management/models/usermodel.dart';

class InheritedState extends StatefulWidget {
  final User user;
  final Widget child;
  const InheritedState({super.key, required this.user, required this.child});
  //get the data
  static InheritedStateState of(BuildContext context) {
    final userInheritedWidgetSatate =
        context.findAncestorWidgetOfExactType<UserInheritedWidget>()!;
    if (userInheritedWidgetSatate == null) {
      throw Exception("UserInheritedWidget not found");
    }
    return userInheritedWidgetSatate.data;
  }

  @override
  State<InheritedState> createState() => InheritedStateState();
}

class InheritedStateState extends State<InheritedState> {
  late User user;
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  //when the state is changed notify the frame work to the state is changed
  void updatedUser({required name, required email, required password}) {
    setState(
      () {
        user = User(
            name: name ?? user.name,
            email: email ?? user.email,
            password: password ?? user.password);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserInheritedWidget(child: widget.child,data: this,);
  }
}

//inherited widget
class UserInheritedWidget extends InheritedWidget {
  final InheritedStateState data;
  const UserInheritedWidget( {super.key, required super.child,required this.data,});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
