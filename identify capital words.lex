BEGIN
    PRINT "Enter String:"
    READ input string
    FOR each word in the input:
        IF word contains only uppercase letters:
            PRINT word + " is a capital word"
END




%%
[A-Z]+   { printf("%s is a capital word\n", yytext); } 
.        { ; }  // Ignore all other characters
%%

int yywrap() { return 1; }

int main() {
    printf("Enter String:\n");
    yylex();
    return 0;
}




flex capital.l           # Generates lex.yy.c
gcc lex.yy.c -o capital  # Compiles the generated file
capital.exe              # Runs the program





Enter String:
CAPITAL of INDIA is DELHI
CAPITAL is a capital word
INDIA is a capital word
DELHI is a capital word



