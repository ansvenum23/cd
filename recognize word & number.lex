BEGIN
    DEFINE patterns for:
        - Numbers (integers and decimals)
        - Words (alphabetic sequences)
        - Comments (lines starting with #)
        - Whitespace (ignored)

    READ input statement
    
    FOR EACH token in input DO
        IF token matches a number THEN
            PRINT "token is NUMBER"
        ELSE IF token matches a word THEN
            PRINT "token is WORD"
        ELSE IF token matches a comment THEN
            PRINT "token is COMMENT"
        END IF
    END FOR
END








%%
[\t ]+ ;  /* Ignore spaces and tabs */
[0-9]+|[0-9]*\.[0-9]+ { printf("\n%s is NUMBER", yytext); }
#.* { printf("\n%s is COMMENT", yytext); }
[a-zA-Z]+ { printf("\n%s is WORD", yytext); }
\n { ECHO; }
%%
int main()
{
    while (yylex());
}
int yywrap()
{
    return 1;
}




flex numbers_words.l          # Generates lex.yy.c
gcc lex.yy.c -o numbers_words # Compiles into executable
./numbers_words               # Runs the program




Variables A and B contains 10 and 20 respectively




                    
Variables is WORD
A is WORD
and is WORD
B is WORD
contains is WORD
10 is NUMBER
and is WORD
20 is NUMBER
respectively is WORD
                    
                    

                    
