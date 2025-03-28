BEGIN
    Initialize counters:
        - positive_no = 0
        - negative_no = 0

    READ input values

    FOR EACH token in input DO
        IF token starts with '-' and is followed by digits THEN
            INCREMENT negative_no
            PRINT "negative number = token"
        ELSE IF token is a positive number THEN
            INCREMENT positive_no
            PRINT "positive number = token"
        END IF
    END FOR

    PRINT total count of positive and negative numbers
END








%{
int positive_no = 0, negative_no = 0;
%}
%%
^[-][0-9]+ { negative_no++;
             printf("negative number = %s\n", yytext);
           } // Negative number
[0-9]+ { positive_no++;
         printf("positive number = %s\n", yytext);
       } // Positive number
%%
int yywrap() { return 1; }
int main()
{
    yylex();
    printf("number of positive numbers = %d, number of negative numbers = %d\n",
           positive_no, negative_no);
    return 0;
}









flex positive_neg_nums.l         # Generates lex.yy.c
gcc lex.yy.c -o pos_neg_nums     # Compiles into an executable
./pos_neg_nums                   # Runs the program







-10
20
-35
42
-7



negative number = -10
positive number = 20
negative number = -35
positive number = 42
negative number = -7
number of positive numbers = 2, number of negative numbers = 3

