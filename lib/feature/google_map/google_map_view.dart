import 'package:kartal/kartal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vbt_hackathon_group3/feature/google_map/cubit/google_map_cubit.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

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
              markers: context.read<GoogleMapCubit>().getMarkers,
              onTap: (latlong) {
                context.read<GoogleMapCubit>().createMarker(latlong);
              },
              initialCameraPosition:
                  context.read<GoogleMapCubit>().defaultCameraPos,
              onMapCreated: (GoogleMapController controller) {
                context.read<GoogleMapCubit>().controller.complete(controller);
              },
            ),
            changeMapTypeBTN(context),
            exitFromViewIconBTN(context),
          ],
        ),
      ),
    );
  }

  Align changeMapTypeBTN(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: context.paddingLow,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
              onPressed: context.read<GoogleMapCubit>().changeMapType,
              icon: Icon(Icons.map_outlined)),
        ),
      ),
    );
  }

  Align exitFromViewIconBTN(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: context.paddingLow,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
              onPressed: context.read<GoogleMapCubit>().changeMapType,
              icon: Icon(Icons.chevron_left)),
        ),
      ),
    );
  }
}
