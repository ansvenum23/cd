BEGIN
READ-INPUT STRING
IF STRING MATCHES MOBILE NUMBER
PRINT"VALID"
ELSE
PRINT "INVALID"
END




%%
^[1-9][0-9]{9}$ { printf("\nMobile Number Valid\n"); }
.* { printf("\nMobile Number Invalid\n"); }
%%

int main() {
    printf("\nEnter Mobile Number: ");
    yylex();
    return 0;
}

int yywrap() { return 1; }



flex mobile.l
gcc lex.yy.c -o mobile
mobile.exe




Enter Mobile Number: 9876543210
Mobile Number Valid

Enter Mobile Number: 0123456789
Mobile Number Invalid

Enter Mobile Number: abc12345
Mobile Number Invalid

