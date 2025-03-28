BEGIN  
    READ first number  
    READ operator (+, -, *, /)  
    READ second number  

    IF operator is '+'
        RESULT = first number + second number  
    ELSE IF operator is '-'
        RESULT = first number - second number  
    ELSE IF operator is '*'  
        RESULT = first number * second number  
    ELSE IF operator is '/'  
        IF second number is 0  
            PRINT "ERROR: Division by zero"  
        ELSE  
            RESULT = first number / second number  
    ELSE  
        PRINT "Invalid operator"  

    PRINT "The answer is:", RESULT  
END  





%{
#undef yywrap
#define yywrap() 1 
int f1=0, f2=0;
char oper;
float op1=0, op2=0, ans=0;
void eval();
%}

DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
OP [*/+-]

%%

{NUM} {
    if(f1==0) {
        op1=atof(yytext);
        f1=1;
    } 
    else if(f2==-1) {
        op2=atof(yytext);
        f2=1;
    }
    if((f1==1) && (f2==1)) {
        eval();
        f1=0;
        f2=0;
    }
}

{OP} {
    oper=(char) *yytext;
    f2=-1;
}

[\n] {
    if(f1==1 && f2==1) {
        eval();
        f1=0;
        f2=0;
    }
}

%%

int main() {
    yylex();
}

void eval() {
    switch(oper) {
        case '+':
            ans = op1 + op2;
            break;
        case '-':
            ans = op1 - op2;
            break;
        case '*':
            ans = op1 * op2;
            break;
        case '/':
            if(op2 == 0) {
                printf("ERROR: Division by zero\n");
                return;
            } else {
                ans = op1 / op2;
            }
            break;
        default:
            printf("Invalid operation\n");
            return;
    }
    printf("The answer is = %lf\n", ans);
}







flex cal.l          # Generates lex.yy.c  
gcc lex.yy.c -o calculator  # Compiles into an executable  
./calculator        # Runs the program  





20 + 30  
25 * 5  
10 / 0  

The answer is = 50.000000  
The answer is = 125.000000  
ERROR: Division by zero  

