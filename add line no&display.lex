BEGIN
    SET line_number = 0
    READ input C program file line by line
    FOR each line in the file:
        INCREMENT line_number
        PRINT line_number followed by the line
END




%{
    #include <stdio.h>
    int yylineno = 0;
%}

%%
^(.*)\n    { printf("%4d\t%s\n", ++yylineno, yytext); }
.|\n       { }  // Ignore other characters
%%

int yywrap(void) { return 1; }

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Cannot open file %s\n", argv[1]);
        return 1;
    }

    yylex();
    fclose(yyin);
    
    return 0;
}




flex addlinenos.l            # Generates lex.yy.c
gcc lex.yy.c -o addlinenos.exe  # Compiles the generated file
addlinenos.exe sample.c       # Runs the program with input file




   1    #define PI 3.14
   2    #include<stdio.h>
   3    #include<conio.h>
   4    void main()
   5    {
   6    int a,b,c = 30;
   7    printf("hello");
   8    }
