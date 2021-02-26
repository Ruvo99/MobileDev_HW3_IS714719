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
      appBar: AppBar(),
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
                        flex: 2,
                        child: Column(
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
                            Row(
                              children: [
                                MaterialButton(
                                    child: Text("SKIP"),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<FrontBloc>(context)
                                          .add(SkipEvent());
                                    }),
                                MaterialButton(
                                    child: Text("GOT IT"),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<FrontBloc>(context)
                                          .add(GotEvent());
                                    }),
                                MaterialButton(
                                    child: Text("END GAME"),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<FrontBloc>(context)
                                          .add(EndEvent());
                                    }),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(state.titulo),
                            SizedBox(height: 10.0),
                            Text(
                              state.contador.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: MaterialButton(
                            child: Text("PLAY AGAIN"),
                            color: Colors.green,
                            onPressed: () {
                              BlocProvider.of<FrontBloc>(context)
                                  .add(StartEvent());
                            }),
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
                          SizedBox(height: 10.0),
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
                        color: Colors.green,
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
