void main() {
  RegExp exp = RegExp(r"^([+]962|0)7(7|8|9)[0-9]{7}");
  print(exp.hasMatch('+962785783785'));
}
// RegExp phone = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
// RegExp emailReg = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
