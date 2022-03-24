import 'package:kartal/kartal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vbt_hackathon_group3/core/network/network_manager.dart';
import 'package:vbt_hackathon_group3/feature/google_map/cubit/google_map_cubit.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit(
          SearchNetworkMaps(NetworkManager.instance.dio), context),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: context.read<GoogleMapCubit>().nearbyModel?.results == null
                  ? null
                  : SizedBox(
                      width: 300,
                      height: 300,
                      child: Card(
                        child: ListView.builder(
                          itemCount: context
                              .read<GoogleMapCubit>()
                              .nearbyModel
                              ?.results
                              ?.length,
                          itemBuilder: (context, index) {
                            var model = context
                                .read<GoogleMapCubit>()
                                .nearbyModel
                                ?.results?[index];
                            return GestureDetector(
                                onTap: () {
                                  context
                                      .read<GoogleMapCubit>()
                                      .goToSelected(model);
                                },
                                child: ListTile(title: Text("${model?.name}")));
                          },
                        ),
                      )),
            ),
            changeMapTypeBTN(context),
            exitFromViewIconBTN(context),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 margin: context.verticalPaddingLow,
//                 padding: context.horizontalPaddingHigh,
//                 child: TextFormField(
//                   controller: context.read<GoogleMapCubit>().searchController,
//                   onFieldSubmitted: (v) {
// // context.read<GoogleMapCubit>().
//                   },
//                   decoration: InputDecoration(
//                     hintText: "Galata Kulesi",
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(20)),
//                     fillColor: Colors.white,
//                     filled: true,
//                   ),
//                 ),
//               ),
//             )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_on_outlined),
          onPressed: () async {
            await context.read<GoogleMapCubit>().getCurrentLocation(context);
          },
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
