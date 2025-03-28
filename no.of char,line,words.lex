BEGIN
    INITIALIZE character count, word count, and line count to 0  
    READ input file character by character  
    IF character is newline (‘\n’):  
        INCREMENT line count and character count  
    IF sequence of non-whitespace characters found:  
        INCREMENT word count and character count accordingly  
    ELSE IF character is any other symbol:  
        INCREMENT character count  
    PRINT total number of characters, words, and lines  
END

%{
    #include <stdio.h>
    int nchar = 0, nword = 0, nline = 0;
%}

%%
\n       { nline++; nchar++; }  // Count new line as both character and line
[^ \t\n]+ { nword++; nchar += yyleng; }  // Count words and their length
.        { nchar++; }  // Count all other characters
%%

int yywrap(void) { return 1; }

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }

    yylex();
    fclose(yyin);
    
    printf("Number of characters = %d\n", nchar);
    printf("Number of words = %d\n", nword);
    printf("Number of lines = %d\n", nline);
    
    return 0;
}



//flex count_lines.l    # Generates lex.yy.c
gcc lex.yy.c -o count_lines.exe   # Compiles the generated file
count_lines.exe sample.c   # Runs the program on a C file//


Number of characters = 233
Number of words = 33
Number of lines = 10
