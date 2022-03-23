import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vbt_hackathon_group3/feature/google_map/cubit/google_map_cubit.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key? key}) : super(key: key);

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit(),
      child: BlocConsumer<GoogleMapCubit, GoogleMapState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffold(context);
        },
      ),
    );
  }

  SafeArea buildScaffold(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: context.read<GoogleMapCubit>().getMapType,
              initialCameraPosition:
                  context.read<GoogleMapCubit>().defaultCameraPos,
              onMapCreated: (GoogleMapController controller) {
                context.read<GoogleMapCubit>().controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: context.read<GoogleMapCubit>().changeMapType,
                    icon: Icon(Icons.map_outlined)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
