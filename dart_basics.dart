// Student: Regis NSHUTI
// Reg no: 26955
const String regNo = '26955';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  // by R.Nshuti
  print('Reg no: $regNo | D = $d | T = $t');
}