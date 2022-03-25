import 'package:kartal/kartal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/network/network_manager.dart';
import '../cubit/google_map_cubit.dart';
import '../model/nearbys_model.dart';
import 'package:easy_localization/easy_localization.dart';

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
            GoogleMapWidget(context),
            BottomLibraryList(context),
            changeMapTypeBTN(context),
          ],
        ),
        floatingActionButton: FAB(context),
      ),
    );
  }

  GoogleMap GoogleMapWidget(BuildContext context) {
    return GoogleMap(
      mapType: context.read<GoogleMapCubit>().getMapType,
      markers: context.read<GoogleMapCubit>().getMarkers,
      onTap: (latlong) {
        context.read<GoogleMapCubit>().createMarker(latlong);
      },
      initialCameraPosition: context.read<GoogleMapCubit>().defaultCameraPos,
      onMapCreated: (GoogleMapController controller) {
        context.read<GoogleMapCubit>().controller.complete(controller);
      },
    );
  }

  Align BottomLibraryList(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: context.read<GoogleMapCubit>().nearbyModel?.results == null
          ? SizedBox()
          : Container(
              constraints: BoxConstraints(
                maxHeight: context.dynamicHeight(0.4),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(context.dynamicWidth(0.08)))),
              child: LibrariesList(context),
            ),
    );
  }

  Widget LibrariesList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
      shrinkWrap: true,
      itemCount:
          context.read<GoogleMapCubit>().nearbyModel?.results?.length ?? 0,
      itemBuilder: (context, index) {
        var model = context.read<GoogleMapCubit>().nearbyModel?.results?[index];
        return GestureDetector(
            onTap: () {
              context.read<GoogleMapCubit>().goToSelected(model);
            },
            child: LibrariesInfo(model, context));
      },
    );
  }

  ListTile LibrariesInfo(Results? model, BuildContext context) {
    return ListTile(
      title:
          Text("${model?.name}", style: Theme.of(context).textTheme.bodyMedium),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        backgroundImage: NetworkImage("${model?.icon}"),
      ),
      trailing: Text(model?.openingHours?.openNow == true
          ? LocaleKeys.library_open.tr()
          : LocaleKeys.library_closed.tr()),
    );
  }

  FloatingActionButton FAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.location_on_outlined),
      onPressed: () {
        context.read<GoogleMapCubit>().getCurrentLocation(context);
      },
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
}
