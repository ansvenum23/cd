BEGIN
    READ input string
    FOR each occurrence of "abc" in input:
        REPLACE "abc" with "ABC"
    PRINT modified string
END




%%
abc { printf("ABC"); }  // Replace 'abc' with 'ABC'
.   { printf("%s", yytext); } // Print all other characters as they are
%%

int yywrap() { return 1; }

int main() {
    printf("Enter string:\n");
    yylex();
    return 0;
}





flex substring.l         # Generates lex.yy.c
gcc lex.yy.c -o substring  # Compiles the generated file
substring.exe             # Runs the program





Enter string:
abcdefghabcijkla
ABCDEFGHABCIJKLA

