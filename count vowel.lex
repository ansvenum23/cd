BEGIN
    DECLARE vow_count ← 0
    DECLARE const_count ← 0

    PRINT "Enter a string:"
    
    READ input_string
    
    FOR EACH character in input_string DO
        IF character is a vowel (a, e, i, o, u, A, E, I, O, U) THEN
            INCREMENT vow_count
        ELSE IF character is an alphabet (A-Z or a-z) THEN
            INCREMENT const_count
        END IF
    END FOR

    PRINT "Vowels:", vow_count
    PRINT "Consonants:", const_count
END








%{
    int vow_count = 0;   // Counter for vowels
    int const_count = 0; // Counter for consonants
%}

%%
// Rule to match vowels and increment the vowel count
[aeiouAEIOU] { vow_count++; }

// Rule to match consonants (letters that are not vowels) and increment the consonant count
[a-zA-Z] { const_count++; }

// Rule to match any other characters (spaces, digits, punctuation) - ignored
. { }

%%

// Function to indicate end of input
int yywrap() { 
    return 1; 
}

// Main function
int main() {
    printf("Enter the string of vowels and consonants:\n");
    yylex(); // Perform lexical analysis

    // Print the counts of vowels and consonants
    printf("Number of vowels: %d\n", vow_count);
    printf("Number of consonants: %d\n", const_count);

    return 0;
}








Enter the string of vowels and consonants:
The quick brown fox jumps over the lazy dog.




Number of vowels: 11
Number of consonants: 24

