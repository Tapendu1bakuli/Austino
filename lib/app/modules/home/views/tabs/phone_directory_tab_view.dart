import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../routes/app_routes.dart';

class PhoneDirectoryTabView extends StatefulWidget {
  PhoneDirectoryTabView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PhoneDirectoryTabViewState createState() => _PhoneDirectoryTabViewState();
}

class _PhoneDirectoryTabViewState extends State<PhoneDirectoryTabView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      showAlertDialog(context);
    });
  }

  final HomeController _homeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();

  List<String> list = [
    "Academy - Main Line",
    "Academy - Continuing Education",
    "Academy - Learned Skills",
    "AFD Arson",
    "Agg Assault Unit",
    "AISD Dispatch",
    "Alarm Unit",
    "Animal Control",
    "Animal Cruelty",
    "Animal Cruelty Tip Line",
    "ARIC (24 Hour Line)",
    "Arrest Review",
    "APA Office",
    "A.S.H. Admissions",
    "AT&T (Rep: Rena Lempar)",
    "Austin CPS Office",
    "Auto Theft Unit",
    "Auto Theft Unit",
    "Ballistics",
    "Bike Mechanic",
    "Burglary Unit",
    "Burglary Unit",
    "Bomb Squad / Homeland Security",
    "Cap Metro Lost & Found",
    "Cap Metro Lost & Found (Alternate)",
    "Central Booking",
    "Central Booking",
    "Central Records",
    "Report Sales/Collision",
    "ID/Crime Records",
    "Warrants – APD",
    "Open Records",
    "Chaplin",
    "Chief’s Office – Admin",
    "Child Abuse",
    "Child Abuse (Daytime Only)",
    "Child Welfare – CPS",
    "CIT Unit (Mental Health)",
    "Citizen’s Police Academy",
    "Citizen’s Police Academy",
    "City Benefits",
    "City Legal / Damage Claims",
    "City Marshal",
    "City Of Austin - Info",
    "City Of Austin - Payroll",
    "City Of Austin - Spills",
    "City Of Austin - Traffic Signal",
    "City Of Austin - Traffic Signs Down",
    "City Of Austin - Trees Over Roadway",
    "City Of Austin - Street Signs Down",
    "City Of Austin - Utilities (Electric / Water)",
    "Civil Service Commission",
    "CLEAT - Austin",
    "CLEAT - 24 Hours",
    "Code Compliance",
    "Commercial Burglary",
    "Communications - 219",
    "Communications - Teletype",
    "Community Liaison",
    "Computer Help Desk",
    "Control Booth - Main",
    "Control Booth - North Sub",
    "Control Booth - South Sub",
    "County Attorney",
    "Court Dispositions - Felonies",
    "Court Dispositions - Misdemeanor",
    "Court Liaison - Sergeant",
    "Court Liaison – (Michelle) ALR, CC5, 8, 9, JP, Tow, DC 167, 299, 390, 427",
    "Court Liaison – (Kimberly) CC3, 4, 6, DC 331, 403, 450, 460, 98, Gardener",
    "Court Liaison – (Mercedes) Muni, DACC, Parking, CC7, DC147",
    "Court Services",
    "Crime Scene Unit",
    "Crime Scene Unit (Alternate)",
    "Crime Stoppers",
    "DEA",
    "Deferred Comp",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Persons",
    "Detectives - Region 2 Property (NE)",
    "Detectives - Region 2 Property (NE)",
    "Detectives - Region 2 Persons (NW)",
    "Detectives - Region 2 Persons (NW)",
    "Detectives - Region 3 - Property",
    "Detectives - Region 3 - Persons",
    "Detectives - Region 3 - Persons (SC)",
    "Detectives - Region 3 - Persons (CE)",
    "Detectives - Region 4 (SW)",
    "Detectives - Region 4 (SW)",
    "Detectives - Region 4 (SE)",
    "Detectives - Region 4 (SE)",
    "District Attorney",
    "District Attorney - General Intake",
    "District Reps -	Adam",
    "District Reps -	Baker",
    "District Reps -	Charlie",
    "District Reps -	David",
    "District Reps -	Edward",
    "District Reps - Frank",
    "District Reps -	Henry",
    "District Reps -	George",
    "District Reps -	Ida",
    "DMAV Unit",
    "DNA / Evidence",
    "Domestic Relations",
    "DPS Fail to Appear",
    "DTAC Detectives",
    "DWI Unit",
    "EMS",
    "EMS - Billing",
    "Equipment – Police",
    "Emergency Management",
    "Evidence Room",
    "Evidence Unit",
    "Executive Protection",
    "Family Violence",
    "Family Violence",
    "Fax - Abatement/Wrecker",
    "Fax - Academy",
    "Fax - Accreditation",
    "Fax - APA",
    "Fax - Arrest Review",
    "Fax - Air Operations",
    "Fax - Airport Unit",
    "Fax - Burglary Unit",
    "Fax - Central Booking",
    "Fax - Central East",
    "Fax - C. E. Detectives",
    "Fax - Child Abuse",
    "Fax - Communications",
    "Fax - Community Liaison",
    "Fax - Continuing Ed",
    "Fax - CPA",
    "Fax - DEA",
    "Fax - Evidence",
    "Fax - Forensics",
    "Fax - Forgery",
    "Fax - Family Violence",
    "Fax – Homicide / Robbery",
    "Fax - Human Resources",
    "Fax - Highway Enforcement",
    "Fax - Inspection",
    "Fax - Intelligence",
    "Fax - Interdiction",
    "Fax - Internal Affairs",
    "Fax - Jail",
    "Fax - Jail Booking",
    "Fax - Mental Health",
    "Fax - Municipal Court",
    "Fax - North Sub",
    "Fax - North East",
    "Fax - North West",
    "Fax - Pension Office - Police",
    "Fax - Pawn Unit",
    "Fax - Public Information",
    "Fax - Recruiting",
    "Fax - Rutherford Lane",
    "Fax - South Sub",
    "Fax - Special Events",
    "Fax - Special Investigation",
    "Fax - Swat",
    "Fax - South",
    "Fax - Traffic",
    "Fax - Vehicular Homicide",
    "Fax - Workers Comp",
    "Financial Crimes Unit",
    "Fire Arms Review Line",
    "Fire Dispatch",
    "Forensic Case Management",
    "Forensic Science Division",
    "FTO Coordinator",
    "Fugitives (Warrants)",
    "Game Warden",
    "Gang Suppression",
    "Gardner House",
    "Gardner House Intake",
    "Garage – 250",
    "Gyms – Main",
    "Gyms – North Sub",
    "Gyms – South Sub",
    "Hargrave Service Center",
    "Harold Ct Service Center",
    "Help Desk",
    "Health Services",
    "DWI",
    "Commercial Vehicle Enforcement",
    "Highway Response",
    "Leaving the Scene",
    "Motors",
    "Vehicle Abatement",
    "Vehicular Homicide",
    "Wrecker Enforcement",
    "Homicide",
    "Homicide Cold Case",
    "Homicide Tip Line",
    "Hospitals – Dell Children’s",
    "Hospitals - Dell Seton",
    "Hospitals - Georgetown",
    "Hospitals - Heart Hosp.",
    "Hospitals - North Austin Medical",
    "Hospitals - Round Rock",
    "Hospitals - St. David’s",
    "Hospitals – Seton Main",
    "Hospitals - Seton North West",
    "Hospitals - Seton South West",
    "Hospitals - South Austin",
    "Human Resources - APD",
    "Human Resources - City Benefits",
    "Human Trafficking Hotline",
    "Identification",
    "Immigration",
    "ICE",
    "ICE - After Hours",
    "Inspections",
    "Integrity Crimes",
    "Internal Affairs",
    "Intelligence Unit",
    "Jail - Arrest Review Detective",
    "Jail - Booking",
    "Jail - Del Valle",
    "Jail - Information",
    "Jail - Report Writing – APD",
    "Jail - Warrants (TCSO)",
    "Justice of the Peace - Pct 1",
    "Justice of the Peace - Pct 2",
    "Justice of the Peace - Pct 3",
    "Justice of the Peace - Pct 4",
    "Justice of the Peace - Pct 5",
    "K-9",
    "Kramer Service Center",
    "Language Line",
    "License & Weights",
    "Lifeworks",
    "Mail Room",
    "Medical Examiner (Press 1, then 1)",
    "Meinardus Service Center",
    "Missing Persons",
    "MHMR",
    "Motors",
    "Mounted Patrol",
    "Multi Media Lab",
    "Muni Ct",
    "Muni Ct - Liaison",
    "Muni Ct - Main",
    "Muni Ct - Stassney / Manchaca",
    "Muni Ct - Warrants",
    "Narcotics / Gangs",
    "Narcotics / Gangs Hotline",
    "Night Shift Detective (After 6:00pm)",
    "North Sub - Gym",
    "North Sub - Main Number",
    "Nuisance Abatement Unit",
    "Organized Crime",
    "Park Units",
    "Peer Support",
    "Pension Office – Police",
    "Personnel",
    "P.E.S. (Psychiatric Emergency Services)",
    "Poison Control",
    "Police Equipment (Basement)",
    "Police & Fireman’s Insurance",
    "Police & Fireman’s Insurance",
    "Police Monitor",
    "Police - ACC",
    "Police - AISD",
    "Police - Bastrop",
    "Police - Capitol",
    "Police - Cedar Park",
    "Police - DEA",
    "Police - DPS",
    "Police - DPS Communications",
    "Police - DPS",
    "Police - DPS Northwest",
    "Police - DPS South",
    "Police - Elgin",
    "Police - Georgetown",
    "Police - Hays County S.O.",
    "Police - Kyle",
    "Police - Lago Vista",
    "Police - Lakeway",
    "Police - Leander",
    "Police - Lee County",
    "Police - Pflugerville",
    "Police - Rollingwood",
    "Police - Round Rock",
    "Police - San Marcos",
    "Police - Sunset Valley",
    "Police - TCSO",
    "Police - TCSO Association",
    "Police - TCSO Warrants",
    "Police - Westlake",
    "Police - Williamson County",
    "Police - UTPD",
    "PCO - East",
    "PCO - Main",
    "PCO - North",
    "PCO - South",
    "Photo Lab",
    "Polygraph",
    "Public Information – PIO",
    "Radio Shop",
    "Real Time Crime Center",
    "Recruiting",
    "Region 1 – Patrol Admin",
    "Region 2 - Property",
    "Region 2 - Persons",
    "Region 3 – Patrol Admin",
    "Report Sales",
    "Retirement – Austin Police",
    "Risk Management Division",
    "Robbery Hotline",
    "Robbery (Day)",
    "Robbery (Night)",
    "RTCC",
    "Rutherford Lane",
    "Sex Crimes",
    "Sex Crimes",
    "Sex Crimes Tip Line",
    "Sex Offender Registration",
    "Show-Down - Main",
    "Show-Down - North",
    "Show-Down - South",
    "Show-Up - East",
    "Show-Up - Main",
    "Show-Up - North",
    "SIU",
    "SOAR",
    "SouthSide Towing",
    "Special Events",
    "Special Investigation Unit",
    "Spectrum Insurance",
    "STEP – Overtime",
    "SWAT",
    "TCOLE",
    "Taxis - Austin",
    "Taxis - Lone Star",
    "Taxis - Yellow",
    "Teleserve",
    "Teletype",
    "Texas Department of Corrections",
    "Todd Lane Service Center",
    "Training",
    "Travis County ALR Hearing",
    "TTY Phone (911 for Deaf)",
    "Victim Services",
    "Vehicular Homicide",
    "Velocity Credit Union",
    "Violent Crimes",
    "Warrants - APD",
    "Warrants - Credit Card Payouts",
    "Warrants - Municipal Court",
    "Warrants - Travis County",
    "Warrants - Williamson County",
    "Watch Commander",
    "Wellness",
    "White Collar Crime",
    "Wireless Radio Shop",
    "Workers Comp",
    "Workers Comp (Alternate 2)",
    "Workers Comp (Alternate 3)",
    "Workers Comp (24 Hour)",
    "Wrecker Enforcement"
  ];

  List<String> list2 = [
    "Academy - Main Line",
    "Academy - Continuing Education",
    "Academy - Learned Skills",
    "AFD Arson",
    "Agg Assault Unit",
    "AISD Dispatch",
    "Alarm Unit",
    "Animal Control",
    "Animal Cruelty",
    "Animal Cruelty Tip Line",
    "ARIC (24 Hour Line)",
    "Arrest Review",
    "APA Office",
    "A.S.H. Admissions",
    "AT&T (Rep: Rena Lempar)",
    "Austin CPS Office",
    "Auto Theft Unit",
    "Auto Theft Unit",
    "Ballistics",
    "Bike Mechanic",
    "Burglary Unit",
    "Burglary Unit",
    "Bomb Squad / Homeland Security",
    "Cap Metro Lost & Found",
    "Cap Metro Lost & Found (Alternate)",
    "Central Booking",
    "Central Booking",
    "Central Records",
    "Report Sales/Collision",
    "ID/Crime Records",
    "Warrants – APD",
    "Open Records",
    "Chaplin",
    "Chief’s Office – Admin",
    "Child Abuse",
    "Child Abuse (Daytime Only)",
    "Child Welfare – CPS",
    "CIT Unit (Mental Health)",
    "Citizen’s Police Academy",
    "Citizen’s Police Academy",
    "City Benefits",
    "City Legal / Damage Claims",
    "City Marshal",
    "City Of Austin - Info",
    "City Of Austin - Payroll",
    "City Of Austin - Spills",
    "City Of Austin - Traffic Signal",
    "City Of Austin - Traffic Signs Down",
    "City Of Austin - Trees Over Roadway",
    "City Of Austin - Street Signs Down",
    "City Of Austin - Utilities (Electric / Water)",
    "Civil Service Commission",
    "CLEAT - Austin",
    "CLEAT - 24 Hours",
    "Code Compliance",
    "Commercial Burglary",
    "Communications - 219",
    "Communications - Teletype",
    "Community Liaison",
    "Computer Help Desk",
    "Control Booth - Main",
    "Control Booth - North Sub",
    "Control Booth - South Sub",
    "County Attorney",
    "Court Dispositions - Felonies",
    "Court Dispositions - Misdemeanor",
    "Court Liaison - Sergeant",
    "Court Liaison – (Michelle) ALR, CC5, 8, 9, JP, Tow, DC 167, 299, 390, 427",
    "Court Liaison – (Kimberly) CC3, 4, 6, DC 331, 403, 450, 460, 98, Gardener",
    "Court Liaison – (Mercedes) Muni, DACC, Parking, CC7, DC147",
    "Court Services",
    "Crime Scene Unit",
    "Crime Scene Unit (Alternate)",
    "Crime Stoppers",
    "DEA",
    "Deferred Comp",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Property (CW)",
    "Detectives - Region 1 Persons",
    "Detectives - Region 2 Property (NE)",
    "Detectives - Region 2 Property (NE)",
    "Detectives - Region 2 Persons (NW)",
    "Detectives - Region 2 Persons (NW)",
    "Detectives - Region 3 - Property",
    "Detectives - Region 3 - Persons",
    "Detectives - Region 3 - Persons (SC)",
    "Detectives - Region 3 - Persons (CE)",
    "Detectives - Region 4 (SW)",
    "Detectives - Region 4 (SW)",
    "Detectives - Region 4 (SE)",
    "Detectives - Region 4 (SE)",
    "District Attorney",
    "District Attorney - General Intake",
    "District Reps -	Adam",
    "District Reps -	Baker",
    "District Reps -	Charlie",
    "District Reps -	David",
    "District Reps -	Edward",
    "District Reps - Frank",
    "District Reps -	Henry",
    "District Reps -	George",
    "District Reps -	Ida",
    "DMAV Unit",
    "DNA / Evidence",
    "Domestic Relations",
    "DPS Fail to Appear",
    "DTAC Detectives",
    "DWI Unit",
    "EMS",
    "EMS - Billing",
    "Equipment – Police",
    "Emergency Management",
    "Evidence Room",
    "Evidence Unit",
    "Executive Protection",
    "Family Violence",
    "Family Violence",
    "Fax - Abatement/Wrecker",
    "Fax - Academy",
    "Fax - Accreditation",
    "Fax - APA",
    "Fax - Arrest Review",
    "Fax - Air Operations",
    "Fax - Airport Unit",
    "Fax - Burglary Unit",
    "Fax - Central Booking",
    "Fax - Central East",
    "Fax - C. E. Detectives",
    "Fax - Child Abuse",
    "Fax - Communications",
    "Fax - Community Liaison",
    "Fax - Continuing Ed",
    "Fax - CPA",
    "Fax - DEA",
    "Fax - Evidence",
    "Fax - Forensics",
    "Fax - Forgery",
    "Fax - Family Violence",
    "Fax – Homicide / Robbery",
    "Fax - Human Resources",
    "Fax - Highway Enforcement",
    "Fax - Inspection",
    "Fax - Intelligence",
    "Fax - Interdiction",
    "Fax - Internal Affairs",
    "Fax - Jail",
    "Fax - Jail Booking",
    "Fax - Mental Health",
    "Fax - Municipal Court",
    "Fax - North Sub",
    "Fax - North East",
    "Fax - North West",
    "Fax - Pension Office - Police",
    "Fax - Pawn Unit",
    "Fax - Public Information",
    "Fax - Recruiting",
    "Fax - Rutherford Lane",
    "Fax - South Sub",
    "Fax - Special Events",
    "Fax - Special Investigation",
    "Fax - Swat",
    "Fax - South",
    "Fax - Traffic",
    "Fax - Vehicular Homicide",
    "Fax - Workers Comp",
    "Financial Crimes Unit",
    "Fire Arms Review Line",
    "Fire Dispatch",
    "Forensic Case Management",
    "Forensic Science Division",
    "FTO Coordinator",
    "Fugitives (Warrants)",
    "Game Warden",
    "Gang Suppression",
    "Gardner House",
    "Gardner House Intake",
    "Garage – 250",
    "Gyms – Main",
    "Gyms – North Sub",
    "Gyms – South Sub",
    "Hargrave Service Center",
    "Harold Ct Service Center",
    "Help Desk",
    "Health Services",
    "DWI",
    "Commercial Vehicle Enforcement",
    "Highway Response",
    "Leaving the Scene",
    "Motors",
    "Vehicle Abatement",
    "Vehicular Homicide",
    "Wrecker Enforcement",
    "Homicide",
    "Homicide Cold Case",
    "Homicide Tip Line",
    "Hospitals – Dell Children’s",
    "Hospitals - Dell Seton",
    "Hospitals - Georgetown",
    "Hospitals - Heart Hosp.",
    "Hospitals - North Austin Medical",
    "Hospitals - Round Rock",
    "Hospitals - St. David’s",
    "Hospitals – Seton Main",
    "Hospitals - Seton North West",
    "Hospitals - Seton South West",
    "Hospitals - South Austin",
    "Human Resources - APD",
    "Human Resources - City Benefits",
    "Human Trafficking Hotline",
    "Identification",
    "Immigration",
    "ICE",
    "ICE - After Hours",
    "Inspections",
    "Integrity Crimes",
    "Internal Affairs",
    "Intelligence Unit",
    "Jail - Arrest Review Detective",
    "Jail - Booking",
    "Jail - Del Valle",
    "Jail - Information",
    "Jail - Report Writing – APD",
    "Jail - Warrants (TCSO)",
    "Justice of the Peace - Pct 1",
    "Justice of the Peace - Pct 2",
    "Justice of the Peace - Pct 3",
    "Justice of the Peace - Pct 4",
    "Justice of the Peace - Pct 5",
    "K-9",
    "Kramer Service Center",
    "Language Line",
    "License & Weights",
    "Lifeworks",
    "Mail Room",
    "Medical Examiner (Press 1, then 1)",
    "Meinardus Service Center",
    "Missing Persons",
    "MHMR",
    "Motors",
    "Mounted Patrol",
    "Multi Media Lab",
    "Muni Ct",
    "Muni Ct - Liaison",
    "Muni Ct - Main",
    "Muni Ct - Stassney / Manchaca",
    "Muni Ct - Warrants",
    "Narcotics / Gangs",
    "Narcotics / Gangs Hotline",
    "Night Shift Detective (After 6:00pm)",
    "North Sub - Gym",
    "North Sub - Main Number",
    "Nuisance Abatement Unit",
    "Organized Crime",
    "Park Units",
    "Peer Support",
    "Pension Office – Police",
    "Personnel",
    "P.E.S. (Psychiatric Emergency Services)",
    "Poison Control",
    "Police Equipment (Basement)",
    "Police & Fireman’s Insurance",
    "Police & Fireman’s Insurance",
    "Police Monitor",
    "Police - ACC",
    "Police - AISD",
    "Police - Bastrop",
    "Police - Capitol",
    "Police - Cedar Park",
    "Police - DEA",
    "Police - DPS",
    "Police - DPS Communications",
    "Police - DPS",
    "Police - DPS Northwest",
    "Police - DPS South",
    "Police - Elgin",
    "Police - Georgetown",
    "Police - Hays County S.O.",
    "Police - Kyle",
    "Police - Lago Vista",
    "Police - Lakeway",
    "Police - Leander",
    "Police - Lee County",
    "Police - Pflugerville",
    "Police - Rollingwood",
    "Police - Round Rock",
    "Police - San Marcos",
    "Police - Sunset Valley",
    "Police - TCSO",
    "Police - TCSO Association",
    "Police - TCSO Warrants",
    "Police - Westlake",
    "Police - Williamson County",
    "Police - UTPD",
    "PCO - East",
    "PCO - Main",
    "PCO - North",
    "PCO - South",
    "Photo Lab",
    "Polygraph",
    "Public Information – PIO",
    "Radio Shop",
    "Real Time Crime Center",
    "Recruiting",
    "Region 1 – Patrol Admin",
    "Region 2 - Property",
    "Region 2 - Persons",
    "Region 3 – Patrol Admin",
    "Report Sales",
    "Retirement – Austin Police",
    "Risk Management Division",
    "Robbery Hotline",
    "Robbery (Day)",
    "Robbery (Night)",
    "RTCC",
    "Rutherford Lane",
    "Sex Crimes",
    "Sex Crimes",
    "Sex Crimes Tip Line",
    "Sex Offender Registration",
    "Show-Down - Main",
    "Show-Down - North",
    "Show-Down - South",
    "Show-Up - East",
    "Show-Up - Main",
    "Show-Up - North",
    "SIU",
    "SOAR",
    "SouthSide Towing",
    "Special Events",
    "Special Investigation Unit",
    "Spectrum Insurance",
    "STEP – Overtime",
    "SWAT",
    "TCOLE",
    "Taxis - Austin",
    "Taxis - Lone Star",
    "Taxis - Yellow",
    "Teleserve",
    "Teletype",
    "Texas Department of Corrections",
    "Todd Lane Service Center",
    "Training",
    "Travis County ALR Hearing",
    "TTY Phone (911 for Deaf)",
    "Victim Services",
    "Vehicular Homicide",
    "Velocity Credit Union",
    "Violent Crimes",
    "Warrants - APD",
    "Warrants - Credit Card Payouts",
    "Warrants - Municipal Court",
    "Warrants - Travis County",
    "Warrants - Williamson County",
    "Watch Commander",
    "Wellness",
    "White Collar Crime",
    "Wireless Radio Shop",
    "Workers Comp",
    "Workers Comp (Alternate 2)",
    "Workers Comp (Alternate 3)",
    "Workers Comp (24 Hour)",
    "Wrecker Enforcement"
  ];

  searchPress() {
    if (searchController.text.isEmpty) {
      print("if block");
      setState(() {
        list.clear();
        list.addAll(list2);
      });
    } else {
      setState(() {
        list.retainWhere((user) =>
            user.toLowerCase().contains(searchController.text.toLowerCase()));
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        "OKAY",
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: const Text("Alert!"),
      content: const Text(
        "The contacts that have a red outline around them are for Police Use Only.Please do not provide them to the public.",
        style: TextStyle(fontSize: 14),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Get.back();
            FocusManager.instance.primaryFocus?.unfocus();
            Get.offAllNamed(Routes.HOME);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: AppColors.appPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  searchPress();
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  //hintStyle: TextStyles.popUpSubTitleColor,
                  hintText: "Search contacts",
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AlphabetScrollView(
                list: list.map((e) => AlphaModel(e)).toList(),
                // isAlphabetsFiltered: false,
                alignment: LetterAlignment.right,
                itemExtent: 75,

                unselectedTextStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                selectedTextStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
                overlayWidget: (value) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.appPrimaryColor.withOpacity(.8)
                          // color: Theme.of(context).primaryColor,
                          ),
                      alignment: Alignment.center,
                      child: Text(
                        '$value'.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                itemBuilder: (_, k, id) {
                  return _homeController.contacts.telephoneList[k].isRed!
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 40, bottom: 2),
                          child: GestureDetector(
                            onTap: () async {
                              await launch(
                                  "tel:${_homeController.contacts.telephoneList[k].no!}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 4)),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                title:  Text(
                                _homeController.contacts
                                    .telephoneList[k].name!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColors
                                        .appPrimaryColor,
                                    fontWeight:
                                    FontWeight.bold),
                              ),subtitle:   Text(
                                  _homeController.contacts
                                      .telephoneList[k].no!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87)),trailing:   Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                      AppColors.appPrimaryColor),
                                  child: const Center(
                                    child: Icon(
                                      Icons.call,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  )),),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                            left: 20,
                            bottom: 10
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await launch(
                                  "tel:${_homeController.contacts.telephoneList[k].no!}");
                            },
                            child: ListTile(
                             shape: k == list.length - 1
                                         ? null:Border(
                               bottom: BorderSide(),
                             ),
                              contentPadding: EdgeInsets.zero,
                              title:  Text(
                                _homeController.contacts
                                    .telephoneList[k].name!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color:
                                    AppColors.appPrimaryColor,
                                    fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.visible,
                              ),
                              subtitle: Text(
                                  _homeController.contacts
                                      .telephoneList[k].no!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87)),
                              trailing:    Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.appPrimaryColor),
                                  child: const Center(
                                    child: Icon(
                                      Icons.call,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            // child: Column(
                            //   children: [
                            //     Container(
                            //       height: 1,
                            //     ),
                            //     Row(
                            //       children: [
                            //         Flexible(
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 _homeController.contacts
                            //                     .telephoneList[k].name!,
                            //                 style: const TextStyle(
                            //                     fontSize: 15,
                            //                     color:
                            //                         AppColors.appPrimaryColor,
                            //                     fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.visible,
                            //               ),
                            //               Container(
                            //                 height: 5,
                            //               ),
                            //               Text(
                            //                   _homeController.contacts
                            //                       .telephoneList[k].no!,
                            //                   style: const TextStyle(
                            //                       fontSize: 12,
                            //                       color: Colors.black87)),
                            //             ],
                            //           ),
                            //         ),
                            //         Container(
                            //             height: 35,
                            //             width: 35,
                            //             decoration: const BoxDecoration(
                            //                 shape: BoxShape.circle,
                            //                 color: AppColors.appPrimaryColor),
                            //             child: const Center(
                            //               child: Icon(
                            //                 Icons.call,
                            //                 size: 20,
                            //                 color: Colors.white,
                            //               ),
                            //             )),
                            //       ],
                            //     ),
                            //     Container(
                            //       height: 3,
                            //     ),
                            //     k == list.length - 1
                            //         ? const Offstage()
                            //         : const Divider(
                            //             thickness: 1,
                            //             color: Colors.black38,
                            //           )
                            //   ],
                            // ),
                          ),
                        );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}