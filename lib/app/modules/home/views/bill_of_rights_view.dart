import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../routes/app_routes.dart';


class BillofRightsView extends GetView<HomeController> {
  const BillofRightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff08084a),
          centerTitle: true,
          title:const Text(AppLabels.billOfRights),
          leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Container(
              margin: const EdgeInsets.all(13.0),
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xffffffff)),
                  borderRadius: BorderRadius.circular(5)),
              child:const Icon(
                Icons.arrow_back,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body:
        SingleChildScrollView(child:
        ListView(
          physics:const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text("Police Officer’s Bill of Rights Texas Local Government Code",style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text('Bill of Rights\n\n143.312 INVESTIGATION OF POLICE OFFICERS\n\n(a) This section does not apply to a municipality to which Section 143.123 applies. (M population of 1.1 million or more)\n\n(b) In this section:\n\n(1) "Complainant" means a person claiming to be the victim of misconduct by a fire fighter or police officer.\n\n(2) "Investigation" means an administrative investigation, conducted by the municipality, of alleged misconduct by a fire fighter or police officer that could result in punitive action against that person.\n\n(3) "Investigator" means an agent or employee of the municipality who is assigned to conduct an investigation.\n\n(4) "Normally assigned working hours" includes those hours during which a fire fighter or police officer is actually at work or at the person\'s assigned place of work, but does not include any time when the person is off duty on authorized leave, including sick leave.\n\n(5) "Punitive action" means a disciplinary suspension, indefinite suspension, demotion in rank, written reprimand, or any combination of those actions.\n\n(c) An investigator may interrogate a fire fighter or police officer who is the subject of an investigation only during the fire fighter\'s or police officer\'s normally assigned working hours unless:\n\n(1) the seriousness of the investigation, as determined by the fire fighter\'s or police officer\'s department head or the department head\'s designee, requires interrogation at another time; and\n\n(2) the fire fighter or police officer is compensated for the interrogation time on an overtime basis.\n\n(d) The department head may not consider work time missed from regular duties by a fire fighter or police officer due to participation in the conduct of an investigation in determining whether to impose a punitive action or in determining the severity of a punitive action.\n\n(e) An investigator may not interrogate a fire fighter or police officer who is the subject of an investigation or conduct any part of the investigation at that person\'s home without that person\'s permission.\n\n(f) A person may not be assigned to conduct an investigation if the person is the complainant, the ultimate decision-maker regarding disciplinary action, or a person who has any personal involvement regarding the alleged misconduct. A fire fighter or police officer who is the subject of an investigation has the right to inquire and, on inquiry, to be informed of the identities of each investigator participating in an interrogation of the fire fighter or police officer.\n\n(g) Not less than 48 hours before an investigator begins the initial interrogation of a fire fighter or police officer who is the subject of an investigation, the investigator must inform the fire fighter or police officer in writing of the allegations in the complaint. An investigator may not interrogate a fire fighter or police officer based on a complaint by a complainant who is not a fire fighter or police officer unless the complainant verifies the complaint in writing before a public officer who is authorized by law to take statements under oath. In an investigation under this subsection, an investigator may interrogate a fire fighter or police officer about events or conduct reported by a witness who is not a complainant without disclosing the name of the witness. An interrogation may be based on a complaint from an anonymous complainant if the departmental employee receiving the anonymous complaint certifies in writing, under oath, that the complaint was anonymous. This subsection does not apply to an on-the-scene investigation that occurs immediately after an incident being investigated, except that the fire fighter or police officer under investigation must be furnished, as soon as practicable, a written statement of the allegations in the complaint.\n\n(h) An interrogation session of a fire fighter or police officer who is the subject of an investigation may not be unreasonably long. In determining reasonableness, the gravity and complexity of the investigation must be considered. The investigators shall allow reasonable interruptions to permit the fire fighter or police officer to attend to personal physical necessities.\n\n(i) An investigator may not threaten a fire fighter or police officer who is the subject of an investigation with punitive action during an interrogation. An investigator may inform a fire fighter or police officer that failure to answer truthfully reasonable questions directly related to the investigation or to cooperate fully in the conduct of the investigation may result in punitive action.\n\n(j) If prior notification of intent to record an interrogation is given to the other party, either the investigator or the fire fighter or police officer who is the subject of an interrogation may record the interrogation.\n\n(k) If an investigation does not result in punitive action against a fire fighter or police officer but does result in a written reprimand or an adverse finding or determination regarding that person, the reprimand, finding, or determination may not be placed in that person\'s personnel file unless the fire fighter or police officer is first given an opportunity to read and sign the document. If the fire fighter or police officer refuses to sign the reprimand, finding, or determination, it may be placed in the personnel file with a notation that the person refused to sign it. A fire fighter or police officer may respond in writing to a reprimand, finding, or determination that is placed in the person\'s personnel file under this subsection by submitting a written response to the department head not later than the 10th day after the date the fire fighter or police officer is asked to sign the document. The response shall be placed in the personnel file. A fire fighter or police officer who receives a punitive action and who elects not to appeal the action may file a written response as prescribed by this subsection not later than the 10th day after the date the person is given written notice of the punitive action from the department head.\n\n(l) A violation of this section may be considered by the commission or hearing examiner during a disciplinary appeal hearing if the violation substantially impaired the fire fighter\'s or police officer\'s ability to defend against the allegations of misconduct.')
            ),)
          ],
        ),)
    );
  }
}
