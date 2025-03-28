BEGIN
    INITIALIZE constant count to 0  
    READ input file character by character  
    IF sequence of digits found:  
        PRINT number as constant  
        INCREMENT constant count  
    PRINT total number of constants found  
END



%{
    #include <stdio.h>
    int cons = 0;
%}

digit   [0-9]+    // Regular expression for numeric constants

%%
{digit}  { cons++; printf("%s is a constant\n", yytext); }  
.|\n     { }  // Ignore all other characters
%%

int yywrap(void) { return 1; }

int main(void) {
    FILE *f;
    char file[100];

    printf("Enter File Name: ");
    scanf("%s", file);
    
    f = fopen(file, "r");
    if (!f) {
        printf("Error: Cannot open file %s\n", file);
        return 1;
    }

    yyin = f;
    yylex();
    fclose(yyin);

    printf("Number of Constants: %d\n", cons);
    return 0;
}



flex countconstants.l    # Generates lex.yy.c
gcc lex.yy.c -o countconstants.exe   # Compiles the generated file
countconstants.exe       # Runs the program


Enter File Name: sample.c
314 is a constant
30 is a constant
Number of Constants: 2
