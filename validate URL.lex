BEGIN
    PRINT "Enter URL:"
    READ input URL

    IF URL matches pattern ((http)|(ftp))s?:\/\/[a-zA-Z0-9](.[a-z])+(.[a-zA-Z0-9+=?]*)* THEN
        PRINT "URL Valid"
    ELSE
        PRINT "URL Invalid"
    END IF
END




%%
((http)|(ftp))s?:\/\/[a-zA-Z0-9](.[a-z])+(.[a-zA-Z0-9+=?]*)* {printf("\nURL Valid\n");}
.+ {printf("\nURL Invalid\n");}
%%
void main()
{
    printf("\nEnter URL : ");
    yylex();
    printf("\n");
}
int yywrap()
{
    return 1;
}




flex url.l          # Generates lex.yy.c
gcc lex.yy.c -o url_validator  # Compiles into an executable
./url_validator     # Runs the program






https://www.example.com
http://openai.com
ftp://files.example.org
abcd://invalid.url


Enter URL: https://www.example.com
URL Valid

Enter URL: http://openai.com
URL Valid

Enter URL: ftp://files.example.org
URL Valid

Enter URL: abcd://invalid.url
URL Invalid


