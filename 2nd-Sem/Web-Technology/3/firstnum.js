function fibo() {
    var n = parseInt(prompt("Enter the number for fibonacci: "));
    var f1 = 0, f2 = 1, f3;
    document.write("<h2>Fibonacci Sequence</h2><br>");
    if (n == 0) {
        document.write("Enter number greater than zero");
    }
    else if (n == 1) {
        document.write(f1);
    }
    else if (n == 2) {
        document.write(f1 + " " + f2);
    }
    else {
        document.write(f1 + " " + f2)
        for (var i = 0; i < n - 2; i++) {
            f3 = f1 + f2;
            document.write(" " + f3);
            f1 = f2;
            f2 = f3;
        }
    }
}

function square() {
var n = parseInt(prompt("Enter the limit: "));
var string = "";
for (var i = 1; i <= n; i++) {
    string += i.toString() + " | " + (i * i).toString() + "\n";
}
alert(string);
}
