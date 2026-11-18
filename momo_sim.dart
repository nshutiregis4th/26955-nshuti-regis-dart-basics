// Student: Regis NSHUTI
// Reg no: 26955
const String regNo = '26955';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// F1: Format an amount with commas
String formatRwf(int amount) {
  // by R.Nshuti
  String digits = amount.abs().toString();
  String formatted = '';
  int i = 0;

  while (i < digits.length) {
    formatted += digits[i];

    int remainingDigits = digits.length - i - 1;
    if (remainingDigits > 0 && remainingDigits % 3 == 0) {
      formatted += ',';
    }

    i++;
  }

  String sign = amount < 0 ? '-' : '';
  return '$sign$formatted RWF';
}

// F2: Check whether a PIN is valid
bool isValidPin(String pin) {
  // by R.Nshuti
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    int digit = pin.codeUnitAt(i);
    if (digit < 48 || digit > 57) {
      return false;
    }
    i++;
  }

  bool allDigitsAreSame = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allDigitsAreSame = false;
      break;
    }
    i++;
  }

  return !allDigitsAreSame;
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

// F3: Send money and return the new balance
int sendMoney(int balance, int amount) {
  // by R.Nshuti
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// F4: Buy airtime and return the new balance
int buyAirtime(int balance, int amount) {
  // by R.Nshuti
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;
  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Run the PIN checks and MoMo transactions
void main() {
  // by R.Nshuti
  print('Reg no: $regNo | D = $d | T = $t');

  // F main: required PIN checks
  String personalPin = '4821$d';
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin(personalPin));

  // F main: starting balance and transactions
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // F main: extra tests (expected output is in each comment)
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF; tests a negative amount
  print(isValidPin('12a45')); // Expected: false; tests a non-digit
}