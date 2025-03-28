BEGIN
    DEFINE patterns for:
        - Keywords: include, void, main, printf, int
        - Standard Libraries: stdio.h, conio.h
        - Identifiers: combination of letters and digits
        - Numbers
        - String Literals

    OPEN the input file (C program)
    
    FOR EACH token in the file DO
        IF token matches a keyword THEN
            PRINT "token is a keyword"
            INCREMENT keyword count
        ELSE IF token matches a standard library THEN
            PRINT "token is a standard library"
        ELSE IF token matches an identifier THEN
            PRINT "token is an identifier"
            INCREMENT identifier count
        ELSE IF token matches a number THEN
            PRINT "token is a number"
        ELSE IF token matches a string literal THEN
            PRINT "token is a string literal"
        END IF
    END FOR

    PRINT total number of keywords and identifiers
CLOSE the input file
END





digit [0-9]
letter [A-Za-z]
%{
int count_id = 0, count_key = 0;
%}
%%
(stdio.h|conio.h) { printf("%s is a standard library\n", yytext); }
(include|void|main|printf|int) { printf("%s is a keyword\n",yytext); count_key++; }
{letter}({letter}|{digit})* { printf("%s is an identifier\n", yytext); count_id++; }
{digit}+ { printf("%s is a number\n", yytext); }
\"(\\.|[^"\\])*\" { printf("%s is a string literal\n", yytext); }
.|\n { }
%%
int yywrap(void) { return 1; }
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    printf("Number of identifiers = %d\n", count_id);
    printf("Number of keywords = %d\n", count_key);
    fclose(yyin);
}





flex token.l            # Generates lex.yy.c
gcc lex.yy.c -o token   # Compiles into executable
./token sample.c        # Runs the program with input file




#include<stdio.h> 
void main()
{
    int a, b, c = 30; 
    printf("hello");
}



include is a keyword
stdio.h is a standard library
void is a keyword
main is a keyword
int is a keyword
a is an identifier
b is an identifier
c is an identifier
30 is a number
printf is a keyword
"hello" is a string literal
Number of identifiers = 3
Number of keywords = 5

