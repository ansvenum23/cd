BEGIN
    INITIALIZE macro count and header file count to 0  
    READ input file line by line  
    IF line starts with `#define`:  
        INCREMENT macro count  
    IF line starts with `#include`:  
        INCREMENT header file count  
    PRINT total macros and header files found  
END

%{
    #include <stdio.h>
    int nmacro = 0, nheader = 0;
%}

%%
^#define   { nmacro++; }   // Matches lines starting with #define  
^#include  { nheader++; }  // Matches lines starting with #include  
.|\n       { }            // Ignore other characters  
%%

int yywrap(void) { return 1; }

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        printf("Error: Cannot open file %s\n", argv[1]);
        return 1;
    }

    yyin = f;
    yylex();
    fclose(yyin);

    printf("Number of macros defined = %d\n", nmacro);
    printf("Number of header files included = %d\n", nheader);
    return 0;
}



flex count_macro.l          # Generates lex.yy.c
gcc lex.yy.c -o count_macro.exe  # Compiles the generated file
count_macro.exe sample.c    # Runs the program with input file



Number of macros defined = 1
Number of header files included = 2
