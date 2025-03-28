BEGIN  
    PRINT "Enter Date of Birth (DD/MM/YYYY):"  
    READ input DOB  

    IF DOB matches pattern ((0[1-9])|([1-2][0-9])|(3[0-1]))\/((0[1-9])|(1[0-2]))\/(19[0-9]{2}|2[0-9]{3}) THEN  
        PRINT "Valid DoB"  
    ELSE  
        PRINT "Invalid DoB"  
    END IF  
END  




%%
((0[1-9])|([1-2][0-9])|(3[0-1]))\/((0[1-9])|(1[0-2]))\/(19[0-9]{2}|2[0-9]{3}) 
printf("Valid DoB\n");
.* printf("Invalid DoB\n");
%%
int main()
{
    printf("Enter Date of Birth (DD/MM/YYYY): ");
    yylex();
    return 0;
}
int yywrap() {}





flex dob.l          # Generates lex.yy.c  
gcc lex.yy.c -o dob_validator  # Compiles into an executable  
./dob_validator     # Runs the program  



Enter Date of Birth (DD/MM/YYYY): 26/07/1995  
Enter Date of Birth (DD/MM/YYYY): 13\2\96  



Valid DoB  
Invalid DoB  

