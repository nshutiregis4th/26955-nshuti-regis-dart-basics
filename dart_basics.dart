// Student: Regis NSHUTI
// Reg no: 26955
const String regNo = '26955';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
int countVowels(String text) {
  // by R.Nshuti
  String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// B3: Make initials
String initials(String fullName) {
  // by R.Nshuti
  String trimmedName = fullName.trim();

  if (trimmedName.isEmpty) {
    return '';
  }

  List<String> names = trimmedName.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// C5: Draw a right-aligned triangle
void drawTriangle(int height) {
  // by R.Nshuti
  int row = 1;

  while (row <= height) {
    String symbol = row.isOdd ? '*' : '#';
    String spaces = ' ' * (height - row);
    String marks = symbol * row;

    print('$spaces$marks');
    row++;
  }
}

// D2: Calculate the MoMo fee
int momoFee(int amount) {
  // by R.Nshuti
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// D2: Mask the phone number
String maskPhone(String phone) {
  // by R.Nshuti
  if (phone.length != 10) {
    return 'INVALID';
  }

  String stars = '*' * (phone.length - 5);
  return '${phone.substring(0, 3)}$stars${phone.substring(phone.length - 2)}';
}

// Run B2, B3, C5, and D2
void main() {
  // by R.Nshuti
  print('Reg no: $regNo | D = $d | T = $t');

  // B2: Test vowel counting
  print('Regis NSHUTI has ${countVowels('Regis NSHUTI')} vowels');

  // B3: Test initials
  print(initials('Regis NSHUTI'));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5: Test the triangle
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: Print receipts and total fees
  String phone = maskPhone('0788123456');
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to $phone');
    i++;
  }

  print('Total fees: $totalFees RWF');
}