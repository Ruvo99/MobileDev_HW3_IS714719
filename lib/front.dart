import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

class Front extends StatefulWidget {
  Front({Key key}) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Word'),
        backgroundColor: Colors.lightGreen,
      ),
      body: BlocProvider(
        create: (context) => FrontBloc(),
        child: BlocConsumer<FrontBloc, FrontState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.titulo),
                            SizedBox(height: 10.0),
                            Text(
                              state.palabra,
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(state.contador.toString()),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                    child: Text("SKIP"),
                                    onPressed: () {
                                      BlocProvider.of<FrontBloc>(context)
                                          .add(SkipEvent());
                                    }),
                                MaterialButton(
                                    child: Text(
                                      "GOT IT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.lightGreen,
                                    onPressed: () {
                                      BlocProvider.of<FrontBloc>(context)
                                          .add(GotEvent());
                                    }),
                                MaterialButton(
                                  child: Text("END GAME"),
                                  onPressed: () {
                                    BlocProvider.of<FrontBloc>(context)
                                        .add(EndEvent());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is JuegoEndState) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.titulo),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        state.contador.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15),
                      MaterialButton(
                        child: Text("PLAY AGAIN", style: TextStyle(color: Colors.white),),
                        color: Colors.lightGreen,
                        onPressed: () {
                          BlocProvider.of<FrontBloc>(context).add(StartEvent());
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else
              return Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get ready to"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Text(
                            "Guess the word!",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.lightGreen,
                        onPressed: () {
                          BlocProvider.of<FrontBloc>(context).add(StartEvent());
                        },
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
