import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
              ? _EnableGpsMessage()
              : _AccessButton();
          },
        ) 
        
        //_AccessButton(),
      )
    );
  }
}

class _AccessButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Es necesario el acceso a GPS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)
        ),
        MaterialButton(
          onPressed: (){

          },
          color: Colors.black,
          shape: const StadiumBorder(),
          splashColor: Colors.transparent,
          elevation: 0,
          child: const Text(
            'Solicitar Acceso',
            style: TextStyle(color: Colors.white)
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe de habilitar el GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)
    );
  }
}