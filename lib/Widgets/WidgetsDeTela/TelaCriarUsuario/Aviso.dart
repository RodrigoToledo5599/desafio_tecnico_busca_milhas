import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Aviso extends StatefulWidget{
  String? msg;

  Aviso({
    required this.msg,
    Key? key
  }): super(key : key);

  AvisoState createState() => AvisoState();
}


class AvisoState extends State<Aviso>{

  @override
  Widget build(BuildContext context){
    if (widget.msg == null || widget.msg!.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
        child: Column(
            children:[
              Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(99, 236, 39, 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child:
                            Text(
                              "${this.widget.msg} ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ]
                    ),
                  )
              )
            ]
        )
    );
  }


}