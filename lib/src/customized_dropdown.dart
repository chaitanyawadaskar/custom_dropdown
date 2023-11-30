import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedDropdown extends StatelessWidget {
  const CustomizedDropdown({
    super.key,
    required this.hintText,
    required this.list,
    required this.selectedValue,
    required this.onChange,
    this.hintColor,
    this.hintSize = 16,
    this.contentPadding = const EdgeInsets.only(top: 15, bottom: 15, right: 10),
    this.searchController,
    this.enableSearch = false,
    this.dropdownIcon,
    this.maxHeight = 200,
    this.border,
    this.enableBorder,
    this.focusedBorder,
    this.borderRadius = 8,
    this.style,
    this.hintStyle,
    this.validator,
  });
  final String hintText;
  final List<DropdownMenuItem<String>>? list;
  final String? selectedValue;
  final Color? hintColor;
  final double hintSize;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController? searchController;
  final bool enableSearch;
  final Function(Object?) onChange;
  final Widget? dropdownIcon;
  final double maxHeight;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final double borderRadius;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? Function(Object?)? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      style: style ?? const TextStyle(fontSize: 12, color: Colors.grey),
      iconStyleData: IconStyleData(
        icon: dropdownIcon ??
            const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.grey,
              size: 15,
            ),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: maxHeight,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        border: border ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
        enabledBorder: enableBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
      ),
      isExpanded: true,
      hint: Text(
        hintText,
        style: hintStyle ??
            TextStyle(
              fontSize: hintSize,
              color: hintColor,
            ),
      ),
      items: list,
      value: selectedValue,
      validator: (value) => validator!(value),
      dropdownSearchData: enableSearch
          ? DropdownSearchData(
              searchController: searchController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: searchController,
                  cursorColor: Colors.amber,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an item...',
                    hintStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue);
              },
            )
          : null,
      onMenuStateChange: (isOpen) {
        if (!isOpen && searchController != null) {
          searchController!.clear();
        }
      },
      onChanged: (value) => onChange(value),
    );
  }
}
