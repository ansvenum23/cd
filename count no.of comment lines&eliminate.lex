BEGIN
    SET comment_count = 0
    OPEN input C program file
    OPEN output file to write modified content
    FOR each line in input file:
        IF line contains a single-line or multi-line comment:
            INCREMENT comment_count
            REMOVE the comment from the line
        WRITE the modified line to output file
    PRINT total number of comments
END



%{
    #include <stdio.h>
    #include <stdlib.h>
    int com = 0;  // Counter for comments
%}

%s COMMENT  // Defining comment state

%%
// Multi-line comment start
"/*"         { BEGIN COMMENT; }

// Multi-line comment end
<COMMENT>"*/"  { BEGIN 0; com++; }

// New line within multi-line comment
<COMMENT>\n { com++; }

// Any character inside multi-line comment (ignored)
<COMMENT>.  { ; }

// Single-line comment
"//".*      { com++; }

// Copy everything else to output
.|\n        { fprintf(yyout, "%s", yytext); }

%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <input.c> <output.c>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Cannot open file %s\n", argv[1]);
        return 1;
    }

    yyout = fopen(argv[2], "w");
    if (!yyout) {
        printf("Error: Cannot create file %s\n", argv[2]);
        fclose(yyin);
        return 1;
    }

    yylex();

    printf("\nNumber of comments removed = %d\n", com);

    fclose(yyin);
    fclose(yyout);
    
    return 0;
}





flex comment.l            # Generates lex.yy.c
gcc lex.yy.c -o comment.exe  # Compiles the generated file
comment.exe input.c output.c  # Runs the program with input and output files





Number of comments removed = 2

