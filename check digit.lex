BEGIN  
    PRINT "Enter input: "  
    READ input  

    IF input consists only of digits (0-9) THEN  
        PRINT "Valid digit"  
    ELSE  
        PRINT "Invalid digit"  
    END IF  
END  





%%
[0-9]+   {printf("\nValid digit\n");} 
.*       {printf("\nInvalid digit\n");}
%%
int yywrap(){}

int main()
{
    printf("Enter input: ");
    yylex();
    return 0;
}





flex digit_or_not.l          # Generates lex.yy.c  
gcc lex.yy.c -o digit_checker  # Compiles into an executable  
./digit_checker              # Runs the program  




Enter input: 23  
Enter input: h56  


Valid digit  
Invalid digit  


