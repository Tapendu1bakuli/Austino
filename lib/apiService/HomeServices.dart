import '../model/telephone_model.dart';

class HomeServices {
  TelephoneModel getAllContacts() {
    var result = TelephoneModel.fromJson(contacts);

    return result;
  }

  var contacts = {
    "telephone_list": [
      {"name": "Academy - Main Line", "no": "512-974-6955", "isRed": false},
      {
        "name": "Academy - Continuing Education",
        "no": "512-974-6955",
        "isRed": false
      },
      {
        "name": "Academy - Learned Skills",
        "no": "512-974-6955",
        "isRed": false
      },
      {"name": "AFD Arson", "no": "512-974-0240", "isRed": false},
      {"name": "Agg Assault Unit", "no": "512-974-5245", "isRed": true},
      {"name": "AISD Dispatch", "no": "512-414-1703", "isRed": false},
      {"name": "Alarm Unit", "no": "512-974-5730", "isRed": false},
      {"name": "Animal Control", "no": "512-978-0600", "isRed": true},
      {"name": "Animal Cruelty", "no": "512-978-0600", "isRed": true},
      {"name": "Animal Cruelty Tip Line", "no": "512-978-0523", "isRed": false},
      {"name": "ARIC (24 Hour Line)", "no": "512-974-2742", "isRed": false},
      {"name": "Arrest Review", "no": "512-854-7821", "isRed": false},
      {"name": "APA Office", "no": "512-474-6993", "isRed": false},
      {"name": "A.S.H. Admissions", "no": "512-419-2810", "isRed": false},
      {"name": "AT&T (Rep: Rena Lempar)", "no": "512-422-4480", "isRed": false},
      {"name": "Austin CPS Office", "no": "512-834-3195", "isRed": false},
      {"name": "Auto Theft Unit", "no": "512-974-5265", "isRed": false},
      {"name": "Auto Theft Unit", "no": "512-974-9393", "isRed": true},
      {"name": "Ballistics", "no": "512-974-5109", "isRed": false},
      {"name": "Bike Mechanic", "no": "512-974-1804", "isRed": false},
      {"name": "Burglary Unit", "no": "512-974-6941", "isRed": false},
      {"name": "Burglary Unit", "no": "512-974-6991", "isRed": true},
      {
        "name": "Bomb Squad / Homeland Security",
        "no": "512-530-2662",
        "isRed": false
      },
      {"name": "Cap Metro Lost & Found", "no": "512-389-7454", "isRed": false},
      {
        "name": "Cap Metro Lost & Found (Alternate)",
        "no": "512-389-7475",
        "isRed": false
      },
      {"name": "Central Booking", "no": "512-854-5245", "isRed": false},
      {"name": "Central Booking", "no": "512-854-9178", "isRed": true},
      {"name": "Central Records", "no": "512-974-5495", "isRed": false},
      {"name": "-Report Sales/Collision", "no": "512-974-5408", "isRed": false},
      {"name": "-ID/Crime Records", "no": "512-974-5126", "isRed": false},
      {"name": "Warrants – APD", "no": "512-974-5211", "isRed": false},
      {"name": "-Open Records", "no": "512-974-5499", "isRed": false},
      {"name": "Chaplin", "no": "512-974-5411", "isRed": false},
      {"name": "Chief’s Office – Admin", "no": "512-974-5030", "isRed": false},
      {"name": "Child Abuse", "no": "512-974-6880", "isRed": false},
      {
        "name": "Child Abuse (Daytime Only)",
        "no": "512-974-6917",
        "isRed": true
      },
      {"name": "Child Welfare – CPS", "no": "800-877-5300", "isRed": false},
      {
        "name": "CIT Unit (Mental Health)",
        "no": "512-854-3450",
        "isRed": false
      },
      {
        "name": "Citizen’s Police Academy",
        "no": "512-974-5941",
        "isRed": false
      },
      {
        "name": "Citizen’s Police Academy",
        "no": "512-974-9204",
        "isRed": false
      },
      {"name": "City Benefits", "no": "512-974-3284", "isRed": false},
      {
        "name": "City Legal / Damage Claims",
        "no": "512-974-2268",
        "isRed": false
      },
      {"name": "City Marshal", "no": "512-974-4816", "isRed": false},
      {"name": "City Of Austin - Info", "no": "512-974-2000", "isRed": false},
      {
        "name": "City Of Austin - Payroll",
        "no": "512-974-3001",
        "isRed": false
      },
      {"name": "City Of Austin - Spills", "no": "512-974-2550", "isRed": false},
      {
        "name": "City Of Austin - Traffic Signal",
        "no": "512-974-2000",
        "isRed": false
      },
      {
        "name": "City Of Austin - Traffic Signs Down",
        "no": "512-974-2000",
        "isRed": false
      },
      {
        "name": "City Of Austin - Trees Over Roadway",
        "no": "512-974-2000",
        "isRed": false
      },
      {
        "name": "City Of Austin - Street Signs Down",
        "no": "512-457-4850",
        "isRed": false
      },
      {
        "name": "City Of Austin - Utilities (Electric / Water)",
        "no": "512-494-9400",
        "isRed": false
      },
      {
        "name": "Civil Service Commission",
        "no": "512-974-3312",
        "isRed": false
      },
      {"name": "CLEAT - Austin", "no": "512-495-9111", "isRed": false},
      {"name": "CLEAT - 24 Hours", "no": "800-752-5328", "isRed": false},
      {"name": "Code Compliance", "no": "512-974-2000", "isRed": false},
      {"name": "Commercial Burglary", "no": "512-974-5275", "isRed": false},
      {"name": "Communications - 219", "no": "512-974-0911", "isRed": false},
      {
        "name": "Communications - Teletype",
        "no": "512-974-0916",
        "isRed": false
      },
      {"name": "Community Liaison", "no": "512-974-4700", "isRed": false},
      {"name": "Computer Help Desk", "no": "512-974-4357", "isRed": false},
      {"name": "Control Booth - Main", "no": "512-974-5061", "isRed": false},
      {
        "name": "Control Booth - North Sub",
        "no": "512-974-5500",
        "isRed": false
      },
      {
        "name": "Control Booth - South Sub",
        "no": "512-974-8100",
        "isRed": false
      },
      {"name": "County Attorney", "no": "512-854-9415", "isRed": false},
      {
        "name": "Court Dispositions - Felonies",
        "no": "512-854-9420",
        "isRed": false
      },
      {
        "name": "Court Dispositions - Misdemeanor",
        "no": "512-854-9440",
        "isRed": false
      },
      {
        "name": "Court Liaison - Sergeant",
        "no": "512-854-7822",
        "isRed": false
      },
      {
        "name":
            "Court Liaison – (Michelle) ALR, CC5, 8, 9, JP, Tow, DC 167, 299, 390, 427",
        "no": "512-854-7864",
        "isRed": false
      },
      {
        "name":
            "Court Liaison – (Kimberly) CC3, 4, 6, DC 331, 403, 450, 460, 98, Gardener",
        "no": "512-854-9271",
        "isRed": false
      },
      {
        "name": "Court Liaison – (Mercedes) Muni, DACC, Parking, CC7, DC147",
        "no": "512-854-5711",
        "isRed": false
      },
      {"name": "Court Services", "no": "512-974-4812", "isRed": false},
      {"name": "Crime Scene Unit", "no": "512-974-6660", "isRed": false},
      {
        "name": "Crime Scene Unit (Alternate)",
        "no": "512-974-5119",
        "isRed": false
      },
      {"name": "Crime Stoppers", "no": "512-472-8477", "isRed": false},
      {"name": "DEA", "no": "512-344-4900", "isRed": false},
      {"name": "Deferred Comp", "no": "866-613-6189", "isRed": false},
      {
        "name": "Detectives - Region 1 Property (CW)",
        "no": "512-974-5320",
        "isRed": false
      },
      {
        "name": "Detectives - Region 1 Property (CW)",
        "no": "512-974-5386",
        "isRed": true
      },
      {
        "name": "Detectives - Region 1 Property (CW)",
        "no": "512-974-4442",
        "isRed": true
      },
      {
        "name": "Detectives - Region 1 Persons",
        "no": "512-974-5320",
        "isRed": false
      },
      {
        "name": "Detectives - Region 2 Property (NE)",
        "no": "512-974-5484",
        "isRed": false
      },
      {
        "name": "Detectives - Region 2 Property (NE)",
        "no": "512-974-5484",
        "isRed": false
      },
      {
        "name": "Detectives - Region 2 Persons (NW)",
        "no": "512-974-5484",
        "isRed": false
      },
      {
        "name": "Detectives - Region 2 Persons (NW)",
        "no": "512-974-5775",
        "isRed": true
      },
      {
        "name": "Detectives - Region 3 - Property",
        "no": "512-974-6973",
        "isRed": false
      },
      {
        "name": "Detectives - Region 3 - Persons",
        "no": "512-974-6999",
        "isRed": false
      },
      {
        "name": "Detectives - Region 3 - Persons (SC)",
        "no": "512-974-6901",
        "isRed": true
      },
      {
        "name": "Detectives - Region 3 - Persons (CE)",
        "no": "512-974-6973",
        "isRed": false
      },
      {
        "name": "Detectives - Region 4 (SW)",
        "no": "512-974-8100",
        "isRed": false
      },
      {
        "name": "Detectives - Region 4 (SW)",
        "no": "512-974-8100",
        "isRed": false
      },
      {
        "name": "Detectives - Region 4 (SE)",
        "no": "512-974-8218",
        "isRed": false
      },
      {
        "name": "Detectives - Region 4 (SE)",
        "no": "512-974-5860",
        "isRed": true
      },
      {"name": "District Attorney", "no": "512-854-9400", "isRed": false},
      {
        "name": "District Attorney - General Intake",
        "no": "512-854-9264",
        "isRed": false
      },
      {"name": "District Reps -	Adam", "no": "512-974-5743", "isRed": false},
      {"name": "District Reps -	Baker", "no": "512-974-5340", "isRed": false},
      {"name": "District Reps -	Charlie", "no": "512-974-8106", "isRed": false},
      {"name": "District Reps -	David", "no": "512-974-8100", "isRed": false},
      {"name": "District Reps -	Edward", "no": "512-974-5743", "isRed": false},
      {"name": "District Reps - Frank", "no": "512-974-8100", "isRed": false},
      {"name": "District Reps -	Henry", "no": "512-974-5902", "isRed": false},
      {"name": "District Reps -	George", "no": "512-974-3822", "isRed": false},
      {"name": "District Reps -	Ida", "no": "512-974-5722", "isRed": false},
      {"name": "DMAV Unit", "no": "512-974-8180", "isRed": false},
      {"name": "DNA / Evidence", "no": "512-974-5020", "isRed": false},
      {"name": "Domestic Relations", "no": "512-854-9696", "isRed": false},
      {"name": "DPS Fail to Appear", "no": "800-686-0570", "isRed": false},
      {"name": "DTAC Detectives", "no": "512-974-4442", "isRed": true},
      {"name": "DWI Unit", "no": "512-974-5785", "isRed": false},
      {"name": "EMS", "no": "512-978-0400", "isRed": false},
      {"name": "EMS - Billing", "no": "512-972-7210", "isRed": false},
      {"name": "Equipment – Police", "no": "512-974-5055", "isRed": false},
      {"name": "Emergency Management", "no": "512-974-4911", "isRed": false},
      {"name": "Evidence Room", "no": "512-974-5151", "isRed": false},
      {"name": "Evidence Unit", "no": "512-974-4210", "isRed": true},
      {"name": "Executive Protection", "no": "512-974-8104", "isRed": false},
      {"name": "Family Violence", "no": "512-974-8535", "isRed": false},
      {"name": "Family Violence", "no": "512-974-8650", "isRed": true},
      {"name": "Fax - Abatement/Wrecker", "no": "512-974-5929", "isRed": false},
      {"name": "Fax - Academy", "no": "512-974-6969", "isRed": false},
      {"name": "Fax - Accreditation", "no": "512-974-8590", "isRed": false},
      {"name": "Fax - APA", "no": "512-474-6996", "isRed": false},
      {"name": "Fax - Arrest Review", "no": "512-854-7823", "isRed": false},
      {"name": "Fax - Air Operations", "no": "512-530-2601", "isRed": false},
      {"name": "Fax - Airport Unit", "no": "512-530-2680", "isRed": false},
      {"name": "Fax - Burglary Unit", "no": "512-974-6944", "isRed": false},
      {"name": "Fax - Central Booking", "no": "512-473-9237", "isRed": false},
      {"name": "Fax - Central East", "no": "512-974-5955", "isRed": false},
      {"name": "Fax - C. E. Detectives", "no": "512-974-5953", "isRed": false},
      {"name": "Fax - Child Abuse", "no": "512-974-6881", "isRed": false},
      {"name": "Fax - Communications", "no": "512-974-0900", "isRed": false},
      {"name": "Fax - Community Liaison", "no": "512-974-6222", "isRed": false},
      {"name": "Fax - Continuing Ed", "no": "512-974-4960", "isRed": false},
      {"name": "Fax - CPA", "no": "512-974-6636", "isRed": false},
      {"name": "Fax - DEA", "no": "512-344-4906", "isRed": false},
      {"name": "Fax - Evidence", "no": "512-974-6853", "isRed": false},
      {"name": "Fax - Forensics", "no": "512-974-6640", "isRed": false},
      {"name": "Fax - Forgery", "no": "512-974-6650", "isRed": false},
      {"name": "Fax - Family Violence", "no": "512-974-8563", "isRed": false},
      {
        "name": "Fax – Homicide / Robbery",
        "no": "512-978-7670",
        "isRed": false
      },
      {"name": "Fax - Human Resources", "no": "512-974-6630", "isRed": false},
      {
        "name": "Fax - Highway Enforcement",
        "no": "512-974-6878",
        "isRed": false
      },
      {"name": "Fax - Inspection", "no": "512-974-8590", "isRed": false},
      {"name": "Fax - Intelligence", "no": "512-974-6676", "isRed": false},
      {"name": "Fax - Interdiction", "no": "512-974-6649", "isRed": false},
      {"name": "Fax - Internal Affairs", "no": "512-974-8503", "isRed": false},
      {"name": "Fax - Jail", "no": "512-974-6663", "isRed": false},
      {"name": "Fax - Jail Booking", "no": "512-854-7819", "isRed": false},
      {"name": "Fax - Mental Health", "no": "512-854-3448", "isRed": false},
      {"name": "Fax - Municipal Court", "no": "512-974-6613", "isRed": false},
      {"name": "Fax - North Sub", "no": "512-974-5497", "isRed": false},
      {"name": "Fax - North East", "no": "512-974-5478", "isRed": false},
      {"name": "Fax - North West", "no": "512-974-5476", "isRed": false},
      {
        "name": "Fax - Pension Office - Police",
        "no": "512-416-7672",
        "isRed": false
      },
      {"name": "Fax - Pawn Unit", "no": "512-974-6651", "isRed": false},
      {
        "name": "Fax - Public Information",
        "no": "512-974-6670",
        "isRed": false
      },
      {"name": "Fax - Recruiting", "no": "512-974-4212", "isRed": false},
      {"name": "Fax - Rutherford Lane", "no": "512-974-8601", "isRed": false},
      {"name": "Fax - South Sub", "no": "512-974-8205", "isRed": false},
      {"name": "Fax - Special Events", "no": "512-974-6636", "isRed": false},
      {
        "name": "Fax - Special Investigation",
        "no": "512-974-6841",
        "isRed": false
      },
      {"name": "Fax - Swat", "no": "512-​974-6626", "isRed": false},
      {"name": "Fax - South", "no": "512-974-8205", "isRed": false},
      {"name": "Fax - Traffic", "no": "512-974-6878", "isRed": false},
      {
        "name": "Fax - Vehicular Homicide",
        "no": "512-974-5929",
        "isRed": false
      },
      {"name": "Fax - Workers Comp", "no": "512-974-6647", "isRed": false},
      {"name": "Financial Crimes Unit", "no": "512-974-5290", "isRed": false},
      {"name": "Fire Arms Review Line", "no": "512-974-7999", "isRed": false},
      {"name": "Fire Dispatch", "no": "512-476-4333", "isRed": false},
      {
        "name": "Forensic Case Management",
        "no": "512-974-5020",
        "isRed": false
      },
      {
        "name": "Forensic Science Division",
        "no": "512-974-5150",
        "isRed": false
      },
      {"name": "FTO Coordinator", "no": "512-974-5712", "isRed": false},
      {"name": "Fugitives (Warrants)", "no": "512-974-5211", "isRed": false},
      {"name": "Game Warden", "no": "512-389-4848", "isRed": false},
      {"name": "Gang Suppression", "no": "512-974-8600", "isRed": false},
      {"name": "Gardner House", "no": "512-854-7000", "isRed": false},
      {"name": "Gardner House Intake", "no": "512-854-7090", "isRed": false},
      {"name": "Garage – 250", "no": "512-974-1804", "isRed": false},
      {"name": "Gyms – Main", "no": "512-974-5217", "isRed": false},
      {"name": "Gyms – North Sub", "no": "512-974-5582", "isRed": false},
      {"name": "Gyms – South Sub", "no": "512-975-1397", "isRed": false},
      {"name": "Hargrave Service Center", "no": "512-974-1742", "isRed": false},
      {
        "name": "Harold Ct Service Center",
        "no": "512-974-1703",
        "isRed": false
      },
      {"name": "Help Desk", "no": "512-974-4357", "isRed": false},
      {"name": "Health Services", "no": "512-974-5087", "isRed": false},
      {"name": "Vehicle Abatement", "no": "512-974-5789", "isRed": false},
      {"name": "DWI", "no": "512-974-5789", "isRed": false},
      {
        "name": "Commercial Vehicle Enforcement",
        "no": "512-974-5789",
        "isRed": false
      },
      {"name": "Highway Response", "no": "512-974-5789", "isRed": false},
      {"name": "Leaving the Scene", "no": "512-974-5789", "isRed": false},
      {"name": "Motors", "no": "512-974-5789", "isRed": false},
      {"name": "Vehicle Abatement", "no": "512-974-5789", "isRed": false},
      {"name": "Vehicular Homicide", "no": "512-974-5789", "isRed": false},
      {"name": "Wrecker Enforcement", "no": "512-974-5789", "isRed": false},
      {"name": "Homicide", "no": "512-974-5210", "isRed": false},
      {"name": "Homicide Cold Case", "no": "512-974-5250", "isRed": false},
      {"name": "Homicide Tip Line", "no": "512-974-8477", "isRed": false},
      {
        "name": "Hospitals – Dell Children’s",
        "no": "512-324-0000",
        "isRed": false
      },
      {"name": "Hospitals - Dell Seton", "no": "512-324-7010", "isRed": false},
      {"name": "Hospitals - Georgetown", "no": "512-942-4367", "isRed": false},
      {"name": "Hospitals - Heart Hosp.", "no": "512-407-7700", "isRed": false},
      {
        "name": "Hospitals - North Austin Medical",
        "no": "512-901-1100",
        "isRed": false
      },
      {"name": "Hospitals - Round Rock", "no": "512-341-6428", "isRed": false},
      {"name": "Hospitals - St. David’s", "no": "512-544-4240", "isRed": false},
      {"name": "Hospitals – Seton Main", "no": "512-324-1010", "isRed": false},
      {
        "name": "Hospitals - Seton North West",
        "no": "512-324-6010",
        "isRed": false
      },
      {
        "name": "Hospitals - Seton South West",
        "no": "512-324-9010",
        "isRed": false
      },
      {
        "name": "Hospitals - South Austin",
        "no": "512-447-2211",
        "isRed": false
      },
      {"name": "Human Resources - APD", "no": "512-974-5007", "isRed": false},
      {
        "name": "Human Resources - City Benefits",
        "no": "512-974-3284",
        "isRed": false
      },
      {
        "name": "Human Trafficking Hotline",
        "no": "512-974-4786",
        "isRed": false
      },
      {"name": "Identification", "no": "512-974-5127", "isRed": false},
      {"name": "Immigration", "no": "512-236-6385", "isRed": false},
      {"name": "ICE", "no": "512-236-6385", "isRed": false},
      {"name": "ICE - After Hours", "no": "866-441-2283", "isRed": false},
      {"name": "Inspections", "no": "512-974-8589", "isRed": false},
      {"name": "Integrity Crimes", "no": "512-974-6840", "isRed": false},
      {"name": "Internal Affairs", "no": "512-974-8501", "isRed": false},
      {"name": "Intelligence Unit", "no": "512-974-5428", "isRed": false},
      {
        "name": "Jail - Arrest Review Detective",
        "no": "512-854-7821",
        "isRed": false
      },
      {"name": "Jail - Booking", "no": "512-854-9178", "isRed": true},
      {"name": "Jail - Del Valle", "no": "512-854-4180", "isRed": false},
      {"name": "Jail - Information", "no": "512-854-9889", "isRed": false},
      {
        "name": "Jail - Report Writing – APD",
        "no": "512-854-3223",
        "isRed": false
      },
      {"name": "Jail - Warrants (TCSO)", "no": "512-854-9751", "isRed": false},
      {
        "name": "Justice of the Peace - Pct 1",
        "no": "512-854-7700",
        "isRed": false
      },
      {
        "name": "Justice of the Peace - Pct 2",
        "no": "512-854-4545",
        "isRed": false
      },
      {
        "name": "Justice of the Peace - Pct 3",
        "no": "512-854-6763",
        "isRed": false
      },
      {
        "name": "Justice of the Peace - Pct 4",
        "no": "512-854-9478",
        "isRed": false
      },
      {
        "name": "Justice of the Peace - Pct 5",
        "no": "512-854-9049",
        "isRed": false
      },
      {"name": "K-9", "no": "512-974-5524", "isRed": false},
      {"name": "Kramer Service Center", "no": "512-978-2340", "isRed": false},
      {"name": "Language Line", "no": "866-998-0338", "isRed": false},
      {"name": "License & Weights", "no": "512-974-5789", "isRed": false},
      {"name": "Lifeworks", "no": "512-735-2400", "isRed": false},
      {"name": "Mail Room", "no": "512-974-5053", "isRed": false},
      {
        "name": "Medical Examiner (Press 1, then 1)",
        "no": "512-854-9599",
        "isRed": false
      },
      {
        "name": "Meinardus Service Center",
        "no": "512-974-3075",
        "isRed": false
      },
      {"name": "Missing Persons", "no": "512-974-5250", "isRed": false},
      {"name": "MHMR", "no": "512-447-4141", "isRed": false},
      {"name": "Motors", "no": "512-974-5789", "isRed": false},
      {"name": "Mounted Patrol", "no": "512-272-5634", "isRed": false},
      {"name": "Multi Media Lab", "no": "512-974-5115", "isRed": false},
      {"name": "Muni Ct", "no": "512-974-4800", "isRed": false},
      {"name": "Muni Ct - Liaison", "no": "512-974-5711", "isRed": false},
      {"name": "Muni Ct - Main", "no": "512-974-4800", "isRed": false},
      {
        "name": "Muni Ct - Stassney / Manchaca",
        "no": "512-974-4591",
        "isRed": false
      },
      {"name": "Muni Ct - Warrants", "no": "512-974-4650", "isRed": true},
      {"name": "Narcotics / Gangs", "no": "512-974-8600", "isRed": false},
      {
        "name": "Narcotics / Gangs Hotline",
        "no": "512-974-8600",
        "isRed": false
      },
      {
        "name": "Night Shift Detective (After 6:00pm)",
        "no": "512-974-4442",
        "isRed": true
      },
      {"name": "North Sub - Gym", "no": "512-974-5582", "isRed": false},
      {"name": "North Sub - Main Number", "no": "512-974-5500", "isRed": false},
      {"name": "Nuisance Abatement Unit", "no": "512-974-8600", "isRed": false},
      {"name": "Organized Crime", "no": "512-974-8600", "isRed": false},
      {"name": "Park Units", "no": "512-974-7707", "isRed": false},
      {"name": "Peer Support", "no": "512-974-8283", "isRed": false},
      {"name": "Pension Office – Police", "no": "512-416-7672", "isRed": false},
      {"name": "Personnel", "no": "512-974-5007", "isRed": false},
      {
        "name": "P.E.S. (Psychiatric Emergency Services)",
        "no": "512-472-4357",
        "isRed": false
      },
      {"name": "Poison Control", "no": "500-222-1222", "isRed": false},
      {
        "name": "Police Equipment (Basement)",
        "no": "512-974-5055",
        "isRed": false
      },
      {
        "name": "Police & Fireman’s Insurance",
        "no": "512-940-6085",
        "isRed": false
      },
      {
        "name": "Police & Fireman’s Insurance",
        "no": "979-716-6793",
        "isRed": false
      },
      {"name": "Police Monitor", "no": "512-974-9090", "isRed": false},
      {"name": "Police - ACC", "no": "512-223-7999", "isRed": false},
      {"name": "Police - AISD", "no": "512-414-1703", "isRed": false},
      {"name": "Police - Bastrop", "no": "512-303-5779", "isRed": false},
      {"name": "Police - Capitol", "no": "512-463-3556", "isRed": false},
      {"name": "Police - Cedar Park", "no": "512-258-2800", "isRed": false},
      {"name": "Police - DEA", "no": "512-344-4900", "isRed": false},
      {"name": "Police - DPS", "no": "512-424-2000", "isRed": false},
      {
        "name": "Police - DPS Communications",
        "no": "512-997-4100",
        "isRed": false
      },
      {"name": "Police - DPS", "no": "512-997-4100", "isRed": false},
      {"name": "Police - DPS Northwest", "no": "512-506-2800", "isRed": false},
      {"name": "Police - DPS South", "no": "512-997-4130", "isRed": false},
      {"name": "Police - Elgin", "no": "512-285-5757", "isRed": false},
      {"name": "Police - Georgetown", "no": "512-930-3510", "isRed": false},
      {
        "name": "Police - Hays County S.O.",
        "no": "512-393-7800",
        "isRed": false
      },
      {"name": "Police - Kyle", "no": "512-268-0859", "isRed": false},
      {"name": "Police - Lago Vista", "no": "512-267-7141", "isRed": false},
      {"name": "Police - Lakeway", "no": "512-261-6090", "isRed": false},
      {"name": "Police - Leander", "no": "512-259-0613", "isRed": false},
      {"name": "Police - Lee County", "no": "979-542-2800", "isRed": false},
      {"name": "Police - Pflugerville", "no": "512-251-4004", "isRed": false},
      {"name": "Police - Rollingwood", "no": "512-328-1900", "isRed": false},
      {"name": "Police - Round Rock", "no": "512-218-5500", "isRed": false},
      {"name": "Police - San Marcos", "no": "512-753-2108", "isRed": false},
      {"name": "Police - Sunset Valley", "no": "512-206-3333", "isRed": false},
      {"name": "Police - TCSO", "no": "512-974-0845", "isRed": false},
      {
        "name": "Police - TCSO Association",
        "no": "512-632-7477",
        "isRed": false
      },
      {"name": "Police - TCSO Warrants", "no": "512-854-9751", "isRed": false},
      {"name": "Police - Westlake", "no": "512-327-1195", "isRed": false},
      {
        "name": "Police - Williamson County",
        "no": "512-943-1394",
        "isRed": false
      },
      {"name": "Police - UTPD", "no": "512-471-4441", "isRed": false},
      {"name": "PCO - East", "no": "512-974-1271", "isRed": false},
      {"name": "PCO - Main", "no": "512-974-5256", "isRed": false},
      {"name": "PCO - North", "no": "512-974-1279", "isRed": false},
      {"name": "PCO - South", "no": "512-974-8260", "isRed": false},
      {"name": "Photo Lab", "no": "512-974-5115", "isRed": false},
      {"name": "Polygraph", "no": "512-974-5111", "isRed": false},
      {
        "name": "Public Information – PIO",
        "no": "512-974-5017",
        "isRed": false
      },
      {"name": "Radio Shop", "no": "512-972-3200", "isRed": false},
      {"name": "Real Time Crime Center", "no": "512-974-7822", "isRed": true},
      {"name": "Recruiting", "no": "512-974-4211", "isRed": false},
      {"name": "Region 1 – Patrol Admin", "no": "512-974-5774", "isRed": false},
      {"name": "Region 2 - Property", "no": "512-974-5484", "isRed": false},
      {"name": "Region 2 - Persons", "no": "512-974-5484", "isRed": false},
      {"name": "Region 3 – Patrol Admin", "no": "512-974-6982", "isRed": false},
      {"name": "Report Sales", "no": "512-974-5212", "isRed": false},
      {
        "name": "Retirement – Austin Police",
        "no": "512-416-7672",
        "isRed": false
      },
      {
        "name": "Risk Management Division",
        "no": "512-974-8589",
        "isRed": false
      },
      {"name": "Robbery Hotline", "no": "512-974-5092", "isRed": false},
      {"name": "Robbery (Day)", "no": "512-974-5270", "isRed": false},
      {"name": "Robbery (Night)", "no": "512-974-4442", "isRed": true},
      {"name": "RTCC", "no": "512-974-7822", "isRed": true},
      {"name": "Rutherford Lane", "no": "512-974-8600", "isRed": false},
      {"name": "Sex Crimes", "no": "512-974-5230", "isRed": false},
      {"name": "Sex Crimes", "no": "512-974-5240", "isRed": true},
      {"name": "Sex Crimes Tip Line", "no": "512-974-5095", "isRed": false},
      {
        "name": "Sex Offender Registration",
        "no": "512-974-4727",
        "isRed": false
      },
      {"name": "Show-Down - Main", "no": "512-974-5258", "isRed": false},
      {"name": "Show-Down - North", "no": "512-974-5586", "isRed": false},
      {"name": "Show-Down - South", "no": "512-974-8256", "isRed": false},
      {"name": "Show-Up - East", "no": "512-974-4288", "isRed": false},
      {"name": "Show-Up - Main", "no": "512-974-5258", "isRed": false},
      {"name": "Show-Up - North", "no": "512-974-5585", "isRed": false},
      {"name": "SIU", "no": "512-974-6840", "isRed": false},
      {"name": "SOAR", "no": "512-974-6280", "isRed": false},
      {"name": "SouthSide Towing", "no": "512-441-7094", "isRed": false},
      {"name": "Special Events", "no": "512-974-5032", "isRed": false},
      {
        "name": "Special Investigation Unit",
        "no": "512-974-6840",
        "isRed": false
      },
      {"name": "Spectrum Insurance", "no": "210-824-8004", "isRed": false},
      {"name": "STEP – Overtime", "no": "512-974-6898", "isRed": false},
      {"name": "SWAT", "no": "512-974-7928", "isRed": false},
      {"name": "TCOLE", "no": "512-936-7700", "isRed": false},
      {"name": "Taxis - Austin", "no": "512-478-2222", "isRed": false},
      {"name": "Taxis - Lone Star", "no": "512-836-4900", "isRed": false},
      {"name": "Taxis - Yellow", "no": "512-452-9999", "isRed": false},
      {"name": "Teleserve", "no": "512-974-5750", "isRed": false},
      {"name": "Teletype", "no": "512-974-0916", "isRed": false},
      {
        "name": "Texas Department of Corrections",
        "no": "512-926-4482",
        "isRed": false
      },
      {
        "name": "Todd Lane Service Center",
        "no": "512-974-4368",
        "isRed": false
      },
      {"name": "Training", "no": "512-974-6955", "isRed": false},
      {
        "name": "Travis County ALR Hearing",
        "no": "512-936-6634",
        "isRed": false
      },
      {
        "name": "TTY Phone (911 for Deaf)",
        "no": "512-476-8311",
        "isRed": false
      },
      {"name": "Victim Services", "no": "512-974-5037", "isRed": false},
      {"name": "Vehicular Homicide", "no": "512-974-5789", "isRed": false},
      {"name": "Velocity Credit Union", "no": "512-469-7000", "isRed": false},
      {"name": "Violent Crimes", "no": "512-974-4442", "isRed": true},
      {"name": "Warrants - APD", "no": "512-974-5299", "isRed": false},
      {
        "name": "Warrants - Credit Card Payouts",
        "no": "512-974-4581",
        "isRed": false
      },
      {
        "name": "Warrants - Municipal Court",
        "no": "512-854-7817",
        "isRed": false
      },
      {
        "name": "Warrants - Travis County",
        "no": "512-854-9751",
        "isRed": false
      },
      {
        "name": "Warrants - Williamson County",
        "no": "512-943-1345",
        "isRed": false
      },
      {"name": "Watch Commander", "no": "512-974-7822", "isRed": true},
      {"name": "Wellness", "no": "512-974-5087", "isRed": false},
      {"name": "White Collar Crime", "no": "512-854-4407", "isRed": false},
      {"name": "Wireless Radio Shop", "no": "512-927-3200", "isRed": false},
      {"name": "Workers Comp", "no": "512-974-5016", "isRed": false},
      {
        "name": "Workers Comp (Alternate 2)",
        "no": "512-974-5058",
        "isRed": false
      },
      {
        "name": "Workers Comp (Alternate 3)",
        "no": "512-974-5839",
        "isRed": false
      },
      {"name": "Workers Comp (24 Hour)", "no": "512-802-4805", "isRed": false},
      {"name": "Wrecker Enforcement", "no": "512-974-8110", "isRed": false}
    ]
  };
}
