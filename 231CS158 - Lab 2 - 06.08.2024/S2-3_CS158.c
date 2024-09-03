/*

Date: 06 - 08 - 2024 (Lab 2)

Name : Swaraj Singh 
Roll : 231CS158

Question : S2 - 3
Write a C program to determine the number-2.

(number-1)2 =(number-2)r

Note: The input to the program is number-1 (integer or real) and r=11

Write a C program to perform the following using (r-1)'s and r's complement
number-1 r +- number - 2

The input to the program is number -1 and number 2 (integer or real) and r = 8;



*/




/*


Approach

I take two cases, when first number is smaller than second number (in this case subtraction goes negative)
and when first number is not smaller than second number.

Then I remove the decimal point, do the calculation for addition and subtraction in base 8, 
and then add the decimal back to the final result.


1) Addition
We can simply add the two numbers in the base 8, implementing a carry over

2) Subtraction
Here we have two cases,
If the first number is smaller than the second number,and our difference would have been negative
In this case, to do M-N, I take N complement, add it to M, and then again take the complement, and 
then pre-fix it with a '-' before printing the answer

In the other case, when first number is not smaller than the second number, we simply 
take the complement of N and add it to the number, and then drop the carry over

I have used 5 functions in total
1) to remove the decimal point
2) to add the decimal point back
3) to get complement of any number in base 8
4) to perform addition
5) to perform subtraction with both the cases included


*/


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void remove_decimal(char* CS158_number, int* decimal_position) {
    int len = strlen(CS158_number);
    //To perform the addition and subtraction normally, I first remove the decimal from the input and store its position
    *decimal_position = -1;
    int j = 0;
    for (int i = 0; i < len; i++) {
        if (CS158_number[i] == '.') {
            *decimal_position = len - i - 1;
        } else {
            CS158_number[j++] = CS158_number[i];
        }
    }
    CS158_number[j] = '\0';
}

void add_decimal(char* CS158_number, int decimal_position) {
    // After getting the final answer, I place the decimal in the appropriate place
    if (decimal_position == -1) return;
    
    int len = strlen(CS158_number);
    for (int i = len; i > len - decimal_position; i--) {
        CS158_number[i] = CS158_number[i-1];
    }
    CS158_number[len - decimal_position] = '.';
    CS158_number[len + 1] = '\0';
}

void r_complement(char* CS158_number, char* CS158_result, int length, int base) {
    for (int i = 0; i < length; i++) {
        int digit = (CS158_number[i] >= 'A') ? (CS158_number[i] - 'A' + 10) : (CS158_number[i] - '0');
        int CS158_complement_digit = base - 1 - digit;
        CS158_result[i] = (CS158_complement_digit >= 10) ? (CS158_complement_digit - 10 + 'A') : (CS158_complement_digit + '0');
    }
    CS158_result[length] = '\0';

    // Add 1 to the complement
    int carry = 1;
    for (int i = length - 1; i >= 0; i--) {
        int digit = (CS158_result[i] >= 'A') ? (CS158_result[i] - 'A' + 10) : (CS158_result[i] - '0');
        digit += carry;
        if (digit == base) {
            CS158_result[i] = '0';
            carry = 1;
        } else {
            CS158_result[i] = (digit >= 10) ? (digit - 10 + 'A') : (digit + '0');
            carry = 0;
        }
    }
}

void addition(char* CS158_number1, char* CS158_number2, char* CS158_result, int base) {
    int carry = 0;
    int length1 = strlen(CS158_number1);
    int length2 = strlen(CS158_number2);
    int max_length = (length1 > length2) ? length1 : length2;
    // Perform addition in base 8
    for (int i = 0; i < max_length; i++) {
        int digit1 = (i < length1) ? CS158_number1[length1 - 1 - i] - '0' : 0;

        int digit2 = (i < length2) ? CS158_number2[length2 - 1 - i] - '0': 0;
        
        int CS158_sum = digit1 + digit2 + carry;
        carry = CS158_sum / base;
        int sum_digit = CS158_sum % base;
        
        CS158_result[max_length - 1 - i] = (sum_digit + '0');
    }
    // Case for carry over
    if (carry) {
        for (int i = max_length; i > 0; i--) {
            CS158_result[i] = CS158_result[i - 1];
        }
        CS158_result[0] = '1';
        CS158_result[max_length + 1] = '\0';
    } else {
        CS158_result[max_length] = '\0';
    }
}

int compare_numbers(char* CS158_number1, char* CS158_number2) {
    // To check which of the two numbers is larger
    int len1 = strlen(CS158_number1);
    int len2 = strlen(CS158_number2);
    
    if (len1 != len2) {
        return len1 - len2;
    }
    
    return strcmp(CS158_number1, CS158_number2);
}

void subtraction(char* CS158_number1, char* CS158_number2, char* CS158_result, int* is_neg, int base) {
    char CS158_r_comp[50];
    char temp_result[50];
    int length1 = strlen(CS158_number1);
    int length2 = strlen(CS158_number2);
    int max_length = (length1 > length2) ? length1 : length2;

    // Pad the shorter number with zeros
    char padded_number1[50] = {0};
    char padded_number2[50] = {0};
    for (int i = 0; i < max_length - length1; i++) padded_number1[i] = '0';
    strcat(padded_number1, CS158_number1);
    for (int i = 0; i < max_length - length2; i++) padded_number2[i] = '0';
    strcat(padded_number2, CS158_number2);

    if (compare_numbers(padded_number1, padded_number2) < 0) {

        // If number2 is greater, swap the numbers and set is_negative to 1(true) (to keep track that it is larger)
        // We take complement, perform addition, again take complement, and prefix it with a '-' sign before printing it.
        r_complement(padded_number2, CS158_r_comp, max_length, base);

        addition(padded_number1, CS158_r_comp, temp_result, base);

        r_complement(temp_result, CS158_result, strlen(temp_result), base);
        
        *is_neg = 1;
    } else {
        r_complement(padded_number2, CS158_r_comp, max_length, base);
        addition(padded_number1, CS158_r_comp, CS158_result, base);
        // We drop our '1' carry over, since difference is positive
        *is_neg = 0;
        int length = strlen(CS158_result);
        CS158_result[length]='\0';
        for(int i = 0; i<=length-1; i++){
            CS158_result[i] = CS158_result[i+1];
        }

    }

    // Remove leading zeros
    int i = 0;
    while (CS158_result[i] == '0' && CS158_result[i+1] != '\0') i++;
    memmove(CS158_result, CS158_result + i, strlen(CS158_result) - i + 1);
}

int main() {
    char CS158_number1[50], CS158_number2[50];
    char CS158_result[50];
    int CS158_decimal1, CS158_decimal2;
    int is_neg;
    int base = 8;

    // Read base and two numbers from input
    printf("Enter the first number: ");
    scanf("%s", CS158_number1);
    printf("Enter the second number: ");
    scanf("%s", CS158_number2);

    // Remove decimal points from the numbers
    remove_decimal(CS158_number1, &CS158_decimal1);
    remove_decimal(CS158_number2, &CS158_decimal2);

    // Perform addition
    addition(CS158_number1, CS158_number2, CS158_result, base);
    int CS158_decimal_add = (CS158_decimal1 > CS158_decimal2) ? CS158_decimal1 : CS158_decimal2;
    add_decimal(CS158_result, CS158_decimal_add);
    printf("Addition: %s\n", CS158_result);

    // Perform subtraction
    subtraction(CS158_number1, CS158_number2, CS158_result, &is_neg, base);
    int CS158_decimal_sub = (CS158_decimal1 > CS158_decimal2) ? CS158_decimal1 : CS158_decimal2;
    add_decimal(CS158_result, CS158_decimal_sub);
    
    //Handles the case when the second input is larger, by adding a - sign to it
    printf("Subtraction: %s%s\n", is_neg ? "-" : "", CS158_result); 

    return 0;
}