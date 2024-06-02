import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../device_manager/colors.dart';
import '../device_manager/screen_constants.dart';
import '../device_manager/strings.dart';
import '../device_manager/text_styles.dart';

enum Type {
  emailOrPhone,
  passWord,
  signInPassWord,
  name,
  postalCode,
  phone,
  email,
  otp,
  verifiedEmail,
  verifiedPhone,
  biography,
  date,
  location,
  userFName,
  userLName,
  cardNumber,
  expiry,
  cvv,
  amount,
  suffixIcon,
  general
}

// ignore: must_be_immutable
class RequireTextField extends StatefulWidget {
  final TextEditingController controller;
  final Type type;
  final caption;
  var errorFree;
  final FocusNode? myFocusNode;
  final hintText;
  final mobileNumber;
  final readWriteStatus;
  final onTap;
  final labelText;
  final autoValidate;
  final autoSubmit;
  final verified;
  final suggestions;
  final autoKey;
  final isPast;
  final double? boxHeight;
  final double? boxWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isReadOnly;
  final bool showDecoration;
  final bool showDecorationForCall;
  String? Function(String? value)? validationFunction;

  RequireTextField({
    Key? key,
    required this.type,
    required this.controller,
    this.caption,
    this.errorFree,
    this.myFocusNode,
    this.hintText,
    this.mobileNumber,
    this.readWriteStatus,
    this.onTap,
    this.labelText,
    this.autoValidate,
    this.autoSubmit,
    this.verified = false,
    this.suggestions,
    this.autoKey,
    this.isPast = false,
    this.boxHeight,
    this.boxWidth,
    this.suffixIcon,
    this.prefixIcon,
    required this.validationFunction,
    this.isReadOnly = false,
    this.showDecoration = false,
    this.showDecorationForCall = false,
  }) : super(key: key);

  @override
  _RequireTextFieldState createState() => _RequireTextFieldState();
}

class _RequireTextFieldState extends State<RequireTextField> {
  late TextEditingController _controller;
  late Type type;

  var _value;

  bool _errorFree = true;

  bool validate = false;

  get errorFree => _errorFree;

  Type get _type => widget.type;
  var searchTextField;

  TextEditingController get _thisController => widget.controller;
  late GlobalKey<NavigatorState> navigatorKey;
  bool indicator = true;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
    if (widget.controller == null) {
      _controller = TextEditingController(text: '');
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
    if (widget.mobileNumber != null) {
      _thisController.text = widget.mobileNumber;
    }
  }

  void _handleControllerChanged() {
    if (_thisController.text != _value || _value.trim().isNotEmpty)
      didChange(_thisController.text);
  }

  void didChange(var value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void didUpdateWidget(RequireTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_handleControllerChanged);
      widget.controller.addListener(_handleControllerChanged);

      if (widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      }
      _thisController.text = widget.controller.text;
      if (oldWidget.controller == null) _controller;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case Type.passWord:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            validator: (val) {
              if (val?.isEmpty ?? false) {
                return "This field is required";
              }
              return null;
            },
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: widget.validationFunction ,
            obscureText: indicator,
            obscuringCharacter: '●',
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              border: InputBorder.none,
              fillColor: Colors.black12,
              focusColor: Colors.black12,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: AppLabels.passwordRequiredForLogin,
              filled: true,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black12)),
            ),
          );
        }
      case Type.signInPassWord:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val?.isEmpty ?? false) {
                return "This field is required";
              }
              return null;
            },
            //validateSignInPassword,
            obscureText: indicator,
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              errorMaxLines: 2,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              suffixIcon: IconButton(
                icon: Icon(
                  indicator
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    indicator = !indicator;
                  });
                },
              ),
              hintText: widget.labelText,
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.emailOrPhone:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            validator: (val) {
              if (val?.isEmpty ?? false) {
                return "This field is required";
              }
              return null;
            },
            //validateEmailAndMobile,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: AppLabels.enterEmailAddress,
              //filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColorDash,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black12)),
            ),
          );
        }

      case Type.phone:
        {
          return TextFormField(
              controller: _thisController,
              keyboardType: //TextInputType.phone,
                  const TextInputType.numberWithOptions(
                signed: true,
              ),
              autofocus: false,
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              //maxLength: 10,
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyles.smallHintText,
              validator: validateMobile,
              decoration: widget.showDecorationForCall
                  ? InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyles.lowerSubTitle.copyWith(
                          fontSize: FontSize.s15, fontWeight: FontWeight.w400),
                      hintText: AppLabels.enterCellPhone,
                      //filled: true,
                      disabledBorder: InputBorder.none,
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      focusedBorder: InputBorder.none,
                    )
                  : InputDecoration(
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      fillColor: Colors.black12,
                      focusColor: Colors.black12,
                      hintStyle: TextStyles.lowerSubTitle.copyWith(
                          fontSize: FontSize.s15, fontWeight: FontWeight.w400),
                      hintText: "Enter your phone number",
                      filled: true,
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black12)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black12)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black12)),
                    ));
        }

      case Type.name:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            validator: validateName,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: widget.labelText,
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.postalCode:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.number,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.userFName:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            //validator: validateFName,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: AppLabels.enterFirstName,
              //filled: true,
              disabledBorder: InputBorder.none,
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedBorder: InputBorder.none,
            ),
          );
        }

      case Type.userLName:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            // validator: validateLName,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: AppLabels.enterLastName,
              //filled: true,
              disabledBorder: InputBorder.none,
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedBorder: InputBorder.none,
            ),
          );
        }

      case Type.biography:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 5,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: widget.labelText,
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.verifiedPhone:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            readOnly: true,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateMobile,
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              suffixIcon: widget.verified
                  ? const Icon(
                      Icons.done_all_rounded,
                      color: AppColors.green,
                      size: 18,
                    )
                  : const Icon(
                      Icons.priority_high_rounded,
                      color: AppColors.red,
                      size: 18,
                    ),
              //errorText: _value != null ? validateMobile(_value) : null,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: widget.labelText,
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.email:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            maxLines: 1,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val?.trim().isEmpty ?? false) {
                return "please enter email Id.";
              }
            },
            style: TextStyles.smallHintText,
            decoration: widget.showDecoration
                ? InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyles.lowerSubTitle.copyWith(
                        fontSize: FontSize.s15, fontWeight: FontWeight.w400),
                    hintText: AppLabels.enterEmailAddress,
                    //filled: true,
                    disabledBorder: InputBorder.none,
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    focusedBorder: InputBorder.none,
                  )
                : InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.black12,
                    hintStyle: TextStyles.lowerSubTitle.copyWith(
                        fontSize: FontSize.s15, fontWeight: FontWeight.w400),
                    hintText: AppLabels.enterEmailAddress,
                    filled: true,
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12)),
                  ),
          );
        }

      case Type.verifiedEmail:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            readOnly: true,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateEmail,
            style: TextStyles.smallHintText,
            decoration: InputDecoration(
              suffixIcon: widget.verified
                  ? const Icon(
                      Icons.done_all_rounded,
                      color: AppColors.green,
                      size: 18,
                    )
                  : const Icon(
                      Icons.priority_high_rounded,
                      color: AppColors.red,
                      size: 18,
                    ),
              //errorText: _value != null ? validateEmail(_value) : null,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: widget.labelText,
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }

      case Type.otp:
        {
          return BoxEntryTextField(
            boxHeight: widget.boxHeight ?? ScreenConstant.sizeXXXL,
            boxWidth: widget.boxWidth ?? ScreenConstant.sizeXXXL,
            onSubmit: (String pin) {
              setState(() {
                _thisController.text = pin;
              });
              /*showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Pin"),
                      content: Text('Pin entered is $pin'),
                    );
                  }
              ); */ //end showDialog()
            }, // end onSubmit
          );
        }

      // case Type.cardNumber:
      //   {
      //     return TextFormField(
      //       controller: _thisController,
      //       keyboardType: TextInputType.number,
      //       autofocus: false,
      //       maxLines: 1,
      //       //autovalidateMode: AutovalidateMode.onUserInteraction,
      //       style: TextStyles.smallHintText,
      //       validator: validateCardNumber,
      //       decoration: InputDecoration(
      //         hintStyle: TextStyles.lowerSubTitle.copyWith(fontSize: FontSize.s15,fontWeight: FontWeight.w400),
      //         hintText: widget.labelText,
      //         //filled: true,
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.primaryColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.textBoxColorGray,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         disabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.cardBackgroundColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         errorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         focusedErrorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //       ),
      //     );
      //   }

      // case Type.expiry:
      //   {
      //     return TextFormField(
      //       controller: _thisController,
      //       keyboardType: TextInputType.number,
      //       autofocus: false,
      //       maxLines: 1,
      //       //autovalidateMode: AutovalidateMode.onUserInteraction,
      //       style: TextStyles.smallHintText,
      //       validator: validateExpiryDate,
      //       decoration: InputDecoration(
      //         hintStyle: TextStyles.lowerSubTitle.copyWith(fontSize: FontSize.s15,fontWeight: FontWeight.w400),
      //         hintText: widget.labelText,
      //         //filled: true,
      //         suffixIcon: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: SvgPicture.asset(Assets.calendar),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.primaryColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.textBoxColorGray,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         disabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.cardBackgroundColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         errorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         focusedErrorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //       ),
      //     );
      //   }

      // case Type.cvv:
      //   {
      //     return TextFormField(
      //       controller: _thisController,
      //       keyboardType: TextInputType.number,
      //       autofocus: false,
      //       maxLines: 1,
      //       //autovalidateMode: AutovalidateMode.onUserInteraction,
      //       style: TextStyles.smallHintText,
      //       validator: validateCvv,
      //       decoration: InputDecoration(
      //         hintStyle: TextStyles.lowerSubTitle.copyWith(fontSize: FontSize.s15,fontWeight: FontWeight.w400),
      //         hintText: widget.labelText,
      //         //filled: true,
      //         suffixIcon: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: SvgPicture.asset(Assets.information),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.primaryColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.textBoxColorGray,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         disabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.cardBackgroundColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         errorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         focusedErrorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //       ),
      //     );
      //   }

      // case Type.amount:{
      //   return TextFormField(
      //     controller: _thisController,
      //     keyboardType: TextInputType.number,
      //     autofocus: false,
      //     maxLines: 1,
      //
      //     //autovalidateMode: AutovalidateMode.onUserInteraction,
      //     validator: validateAmount,
      //     style: TextStyles.smallHintText,
      //     decoration: InputDecoration(
      //       hintStyle: TextStyles.lowerSubTitle.copyWith(fontSize: FontSize.s15,fontWeight: FontWeight.w400),
      //       hintText: widget.labelText,
      //       //filled: true,
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: AppColors.primaryColor,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //       enabledBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: AppColors.textBoxColorGray,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //       disabledBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: AppColors.cardBackgroundColor,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //       errorBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: AppColors.red,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //       focusedErrorBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: AppColors.red,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //     ),
      //   );
      // }

      // case Type.suffixIcon:
      //   {
      //     return TextFormField(
      //       controller: _thisController,
      //       keyboardType: TextInputType.text,
      //       autofocus: false,
      //       maxLines: 1,
      //       onTap: (){
      //         widget.onTap();
      //       },
      //       readOnly: widget.isReadOnly,
      //       //autovalidateMode: AutovalidateMode.onUserInteraction,
      //       style: TextStyles.smallHintText,
      //       validator: widget.validationFunction??validateSuffixText,
      //       decoration: InputDecoration(
      //         hintStyle: TextStyles.lowerSubTitle.copyWith(fontSize: FontSize.s15,fontWeight: FontWeight.w400),
      //         hintText: widget.labelText,
      //         //filled: true,
      //         suffixIcon: widget.suffixIcon,
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.primaryColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.textBoxColorGray,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         disabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.cardBackgroundColor,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         errorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         focusedErrorBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: AppColors.red,
      //           ),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //       ),
      //     );
      //   }

      case Type.general:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(5),
            ],
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            //textCapitalization: widget.isAutoCapital?TextCapitalization.characters:TextCapitalization.none,
            style: TextStyles.smallHintText,
            validator: widget.validationFunction ?? validateGeneral,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyles.lowerSubTitle.copyWith(
                  fontSize: FontSize.s15, fontWeight: FontWeight.w400),
              hintText: widget.hintText,
              //filled: true,
              disabledBorder: InputBorder.none,
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedBorder: InputBorder.none,
            ),
          );
        }
      default:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            focusNode: widget.myFocusNode,
            autofocus: false,
            maxLines: 1,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: widget.caption ?? AppLabels.appName.tr,
              hintStyle: const TextStyle(
                color: Colors.black45,
              ),
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
    }
  }

  void toggle() {
    setState(() {
      indicator = !indicator;
    });
  }

  String? validateEmailAndMobile(String value) {
    if (value.length > 3) {
      if (value.isNumericOnly) {
        return validateMobile(value);
      } else {
        return validateEmail(value);
      }
    } else {
      validate = true;
      return AppLabels.validateEmail.tr;
    }
  }

  String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? false) {
      return AppLabels.mobileRequired.tr;
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? false) {
      return AppLabels.emailRequired.tr;
    } else if (!GetUtils.isEmail(value!)) {
      return AppLabels.validateEmail.tr;
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return AppLabels.firstNameRequired.tr;
    } else {
      return null;
    }
  }

  String validateFName(String value) {
    if (value.isEmpty) {
      return AppLabels.firstNameRequired.tr;
    } else {
      return "";
    }
  }

  String validateLName(String value) {
    if (value.isEmpty) {
      return AppLabels.lastNameRequired.tr;
    } else {
      return "";
    }
  }

  String? validatePassword(String value) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return AppLabels.passwordRequiredForLogin;
    } else if (value.length < 6) {
      return AppLabels.validateEmailOrPassword;
    }
    // else if (!regExp.hasMatch(value!)) {
    //   return AppLabels.passwordValidation.tr;
    // }
    return null;
  }

  String validateSignInPassword(String value) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return AppLabels.validateEmailOrPassword.tr;
    }
    return "";
  }

  String? validateGeneral(String? value) {
    if (value?.isEmpty ?? false) {
      return "This field is required";
    }
    return null;
  }
}

class BoxEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final ValueChanged<String> onSubmit;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final Color
      cursorColor; // Leaving the data type dynamic for adding Color or Material Color
  final Color boxColor;
  final Color textColor;
  final Color fillColor;
  final double? boxHeight;
  final double? boxWidth;

  const BoxEntryTextField({
    Key? key,
    this.lastPin,
    this.fields = 4,
    required this.onSubmit,
    this.fieldWidth = 40.0,
    this.fontSize = 20.0,
    this.isTextObscure = false,
    this.showFieldAsBox = true,
    this.cursorColor = AppColors
        .primaryColor, // Adding a Material Color so that if the user want black, it get accepted too
    this.boxColor = AppColors.primaryColor,
    this.textColor = AppColors.titleBlack,
    this.fillColor = AppColors.textBoxColor,
    this.boxHeight,
    this.boxWidth,
  }) : super(key: key);

  @override
  State createState() {
    return BoxEntryTextFieldState();
  }
}

class BoxEntryTextFieldState extends State<BoxEntryTextField> {
  final List<String> _pin = <String>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];
  final List<TextEditingController> _textControllers =
      <TextEditingController>[];

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.fields; i++) {
      _textControllers.add(TextEditingController());
      _pin.add("");
      _focusNodes.add(FocusNode());
    }
    String lastfourDigit = widget.lastPin ?? "";
    int lastfourLength = lastfourDigit.length;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (int i = 0; i < lastfourLength; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    FocusScope.of(context).requestFocus(_focusNodes[0]);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    for (var tEditController in _textControllers) {
      tEditController.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin![i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    //final String lastDigit = _textControllers[i].text;

    return Container(
      width: widget.boxWidth,
      height: widget.boxHeight,
      margin: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor,
            // color: Colors.black,
            fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            counterText: "",
            contentPadding: const EdgeInsets.only(top: 5),
            enabledBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: widget.boxColor),
                    borderRadius: BorderRadius.circular(10),
                  )
                : null,
            focusedBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: widget.boxColor),
                    borderRadius: BorderRadius.circular(10),
                  )
                : null),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i].unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i].unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String digit) => digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String digit) => digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
