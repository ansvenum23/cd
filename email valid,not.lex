BEGIN
    SET flag = 0
    READ input email
    IF email matches pattern "[a-z . 0-9]+@[a-z]+.(com|in)":
        SET flag = 1
    IF flag == 1:
        PRINT "Accepted"
    ELSE:
        PRINT "Not Accepted"
END




%{
int flag=0;
%}
%%
[a-z0-9._%+-]+@[a-z0-9.-]+\.(com|in) { flag=1; }
.|\n { ; } // Ignore other characters
%%
int yywrap() { return 1; }

int main() {
    printf("Enter email address:\n");
    yylex();
    if(flag == 1)
        printf("Accepted\n");
    else
        printf("Not Accepted\n");
    return 0;
}




flex email_valid.l         # Generates lex.yy.c
gcc lex.yy.c -o email      # Compiles the generated file
email.exe                  # Runs the program






Enter email address:
user123@gmail.com
Accepted

Enter email address:
invalid_email@com
Not Accepted
