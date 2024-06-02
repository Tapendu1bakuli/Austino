import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../Service/GlobalKeys.dart';
import '../../../../../common/device_manager/assets.dart';
import '../../../../../common/device_manager/colors.dart';
import '../../../../../common/device_manager/screen_constants.dart';

class CourtesyApartmentDetailsScreen extends StatefulWidget {
  String? title;
  String? address;
  String? phNo;
  String? image;
  String? lat;
  String? lng;

  CourtesyApartmentDetailsScreen(
      {Key? key,
      this.title,
      this.address,
      this.phNo,
      this.image,
      this.lat,
      this.lng})
      : super(key: key);

  @override
  State<CourtesyApartmentDetailsScreen> createState() =>
      _CourtesyApartmentDetailsScreenState();
}

class _CourtesyApartmentDetailsScreenState
    extends State<CourtesyApartmentDetailsScreen> {
  CameraPosition? _initialPosition;
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    _initialPosition = CameraPosition(
      target: LatLng(double.parse(widget.lat!), double.parse(widget.lng!)),
      zoom: 14,
    );
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setMarker();
  }

  setMarker() {
    final marker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(double.parse(widget.lat!), double.parse(widget.lng!)),
      // icon: BitmapDescriptor.,
    );
    setState(() {
      markers[MarkerId('1')] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.appPrimaryColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                    ),
                    Text(
                      widget.title!,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    widget.address == null
                        ? Offstage()
                        : Container(
                            height: 10,
                          ),
                    widget.address == null
                        ? Offstage()
                        : Row(
                            children: [
                              const Icon(Icons.location_on),
                              Container(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  widget.address!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.call,
                          color: AppColors.appPrimaryColor,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          widget.phNo!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      height: ScreenConstant.screenHeightThird,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${GlobalKeys.APARTMENT_URL}${widget.image}",
                          placeholder: (context, url) =>
                              Image.asset(Assets.loadingImageGif),
                          errorWidget: (context, url, error) =>
                              Image.network(GlobalKeys.PLACEHOLDER_URL),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          widget.address == null
              ? Offstage()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 15,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 150,
                          color: Colors.black,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            zoomControlsEnabled: false,
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: _initialPosition!,
                            markers: markers.values.toSet(),
                          ),
                        )),
                  ),
                ),
        ],
      ),
    );
  }
}
