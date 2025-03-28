BEGIN
DEFINE TOKEN FOR KEYWORD,NUMBER,
WHILE READ INPUT
MATCH TOKEN USING PATTERN
DISPLAY TOKEN WITH CAPTION
END WHILE
END





digit   [0-9]
letter  [A-Za-z]
%{
int count_id = 0, count_key = 0;
%}
%%
<stdio.h|conio.h>    { printf("%s is a standard library\n", yytext); }
<include|void|main|printf|int> { printf("%s is a keyword\n", yytext); count_key++; }
{letter}({letter}|{digit})*  { printf("%s is an identifier\n", yytext); count_id++; }
{digit}+  { printf("%s is a number\n", yytext); }
\"(\\.|[^"\\])*\"  { printf("%s is a string literal\n", yytext); }
.|\n  { }
%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: a.exe <source_file.c>\n");
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Cannot open file %s\n", argv[1]);
        return 1;
    }
    yylex();
    printf("Number of identifiers = %d\n", count_id);
    printf("Number of keywords = %d\n", count_key);
    fclose(yyin);
    return 0;
}





flex token.l
gcc lex.yy.c -o lexer
lexer.exe sample.c






#include<stdio.h>
void main()
{
    int a, b, c = 30;
    printf("hello");
}

