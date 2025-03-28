BEGIN
    DECLARE vow_count ← 0   // Counter for vowels
    DECLARE const_count ← 0 // Counter for consonants

    DEFINE LEX RULES:
        MATCH [aeiouAEIOU]: 
            INCREMENT vow_count

        MATCH [a-zA-Z]: 
            INCREMENT const_count

        MATCH [^aeiouAEIOU \t\n]: 
            DECREMENT const_count  // To ensure only consonants are counted

    FUNCTION yywrap():
        RETURN 1  // Indicate end of input

    FUNCTION main():
        PRINT "Enter the string: "
        CALL yylex()  // Perform lexical analysis

        PRINT "Number of vowels: ", vow_count
        PRINT "Number of consonants: ", const_count
        
        RETURN 0
END





      %{
 int vow_count = 0;
 int const_count = 0;
%}
%%
[aeiouAEIOU] { vow_count++; }  // Count vowels
[a-zA-Z] { const_count++; }    // Count letters
[^aeiouAEIOU \t\n] { const_count--; } // Subtract vowels from consonants
%%
int yywrap() { return 1; }

int main() {
    printf("Enter the string: ");
    yylex();
    printf("Number of vowels: %d\n", vow_count);
    printf("Number of consonants: %d\n", const_count);
    return 0;
}






flex vowels.l
gcc lex.yy.c -o vowels
vowels.exe






  Enter the string: LEX is a powerful tool for lexical analysis.
Number of vowels: 14
Number of consonants: 22

