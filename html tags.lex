BEGIN
    INITIALIZE tag count to 0  
    READ input HTML file line by line  
    IF a pattern matches an HTML tag enclosed in `< >`:  
        PRINT the matched tag  
        INCREMENT tag count  
    PRINT total number of tags found  
END


      %{
    #include <stdio.h>
    int tags = 0;
%}

%%
"<"[^>]*">" { tags++; printf("%s\n", yytext); }  // Match HTML tags enclosed in < >
.|\n        { }  // Ignore all other characters
%%

int yywrap(void) { return 1; }

int main(void) {
    char file[50];
    printf("Enter File Name: ");
    scanf("%s", file);

    FILE *f = fopen(file, "r");
    if (!f) {
        printf("Error: Cannot open file %s\n", file);
        return 1;
    }

    yyin = f;
    yylex();
    fclose(yyin);

    printf("\nNumber of HTML tags: %d\n", tags);
    return 0;
}



flex html.l            # Generates lex.yy.c
gcc lex.yy.c -o html_parser.exe  # Compiles the generated file
html_parser.exe       # Runs the program




  Enter File Name: sample.html
<html>
<body>
<h1>
</h1>
<p>
</p>
</body>
</html>

Number of HTML tags: 8
