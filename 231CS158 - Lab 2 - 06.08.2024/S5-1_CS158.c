/*

Date: 06 - 08 - 2024 (Lab 2)

Name : Swaraj Singh 
Roll : 231CS158

Question : S5 - 1
Write a C program to convert n-bit Gray code to n-bit CS158_binary code.

Note: The Input to the program is n-bit gray code

*/


#include <stdio.h>
#include <string.h>

void grayToBinary(const char* gray, char* CS158_binary, int n) {
    CS158_binary[0] = gray[0]; // The MSB of Gray code is the same as the MSB of CS158_binary code
    for (int i = 1; i < n; i++) {
        CS158_binary[i] = (gray[i] == CS158_binary[i-1]) ? '0' : '1'; // CS158_binary[i] = Gray[i] XOR CS158_binary[i-1]
    }
    CS158_binary[n] = '\0';
}


int main() {
    char CS158_input[100];
    char CS158_result[100];
    int n ;
    printf("enter no. of bits\n");
    scanf("%d",&n);
    printf("Enter the n-bit Gray code : ");
    scanf("%s", CS158_input);

    
    if (strlen(CS158_input) != n) {
        printf("Input length does not match specified n.\n");
        return 1;
    }

    grayToBinary(CS158_input, CS158_result, n);
    printf("Binary code: %s\n", CS158_result);

    return 0;
}
