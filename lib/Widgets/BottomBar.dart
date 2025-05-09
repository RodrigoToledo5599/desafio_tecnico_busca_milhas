import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class BottomBar<T extends Widget> extends StatelessWidget {
  final T prev_page;
  BottomBar({
    Key? key,
    required  this.prev_page
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      color: Color.fromRGBO(0, 0, 128, 1),
      child: Row(
          children:[
            IconButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => this.prev_page
                      )
                  )
                },
                icon: const Icon(
                  Icons.keyboard_return,
                  color: Colors.white,
                  size: 40,
                )
            )
          ]
      ),
    );
  }
}


