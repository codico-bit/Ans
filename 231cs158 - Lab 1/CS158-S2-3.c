/*
Name : Swaraj Singh 
Roll : 231CS158

Question : S4 - 3
Write a C program to determine the number-2.

(number-1)2 =(number-2)r

Note: The input to the program is number-1 (integer or real) and r=11
*/




/*


Approach

I have modified some of the code from CS158-S4-3 (The previous question), 
In this one we already have the value in base 10, hence we modified the functions to use
base 10 instead of base 2 initially

We will convert it first from base 10 to base 10(yes, because we re-used the same functions from previous question), then from base 10 to base 11.


*/


#include <stdio.h>
#include <string.h>
#include <math.h>
int val(char c);
char inBaseEleven(int num);
int toTenPre(char *str1);
void finalAns(char CS158_answer[], int CS158_pre, float CS158_post);
float toTenPost(char *str2);

// Driver code
int main() {
   
    while(1){ // For multiple inputs
        char strfull[100];
        char str1[100]="";
        char str2[100]="";
        int str1index=0, str2index=0;


        char CS158_answer[100];
        printf("Enter the number in base 10 ");
        scanf("%s", strfull);


        int postdec = 0;

        int length = strlen(strfull);


        //printf("strfull is %s\n",strfull);


        for(int i = 0; i < length; i++){
            if(strfull[i]=='.'){
                postdec=1;
                //printf("Entered\n");
            }
            else if(postdec){
                str2[str2index] = strfull[i];
                str2index++;
                //printf("str1=%s and str2=%s\n",str1,str2);
            }
            else{
                str1[str1index] = strfull[i];
                str1index++;
                //printf("str1=%s and str2=%s\n",str1,str2);
            }
        }
        
        // Convert from base 2 to decimal
        //printf("str1=%s and str2=%s \n",str1,str2);
        int CS158_pre = toTenPre(str1);
        float CS158_post = toTenPost(str2);
        //printf("CS158_post equals %f \n",CS158_post );
        if (CS158_pre != -1) {
            
            finalAns(CS158_answer, CS158_pre, CS158_post); // Convert from decimal to base 11
            printf("Equivalent number in base 11 is: %s\n", CS158_answer);
            
        }
    }
   
}

int toTenPre(char *str1) {
    /*
        We convert our input from base 2 to base 10 (decimal) by weighted sum, so 
        Decimal equivalent is str1[len-1]*1 + str1[len-2]*2 + str1[len-3]*(2^2) + ...

    */

    int len = strlen(str1);
    int power = 1; // initialize power
    int CS158_ans = 0; //initialize the answer that we will return
  
    for (int i = len - 1; i >= 0; i--) {
        if ((str1[i]-'0') >= 10) {
            printf("Invalid Number to ten pre\n"); // Input digits can only be 0 and 1
            return -1;
        }

        CS158_ans += (str1[i]-'0') * power;
        power = power * 10;
    }

    return CS158_ans;
}

float toTenPost(char *str2) {
    /*
        We convert our input from base 2 to base 10 (decimal) by weighted sum, so 
        Decimal equivalent is str1[len-1]*1 + str1[len-2]*2 + str1[len-3]*(2^2) + ...

    */

    int len = strlen(str2);
    float power = (1.0/2); // initialize power
    float CS158_ans = 0; //initialize the answer that we will return
  
    for (int i = len - 1; i >= 0; i--) {
        if ((str2[i]-'0') >= 10) {
            printf("Invalid Number to ten post\n"); // Input digits can only be 0 and 1
            return -1;
        }
        printf("ans = %f and power = %f\n", CS158_ans,power);
        CS158_ans += (str2[i]-'0') * power;
        power = power / 10;

    }

    return CS158_ans;
}


char inBaseEleven(int num) {
    /*
        Our digits in base 11 are taken as 
        0,1,2,3,4,,6,7,8,9,A

    */
    if (num >= 0 && num <= 9)
        return (char)(num + '0');
    else
        return (char)(num - 10 + 'A');
}


// Function to convert a given decimal number
// to a base 'base' and return the number in
// that base as a string

void finalAns(char CS158_answer[], int CS158_pre, float CS158_post) {
    int index = 0;  

   // We Convert to base 11 by repeated division
    while (CS158_pre > 0) {
        CS158_answer[index++] = inBaseEleven(CS158_pre % 11);
        CS158_pre /= 11;
    }
    CS158_answer[index] = '\0';

    // Reverse the CS158_answer to get the correct representation
    int len = strlen(CS158_answer);

    for (int i = 0; i < len/2; i++) {

        char CS158_temp = CS158_answer[i];
        CS158_answer[i] = CS158_answer[len-i-1];
        CS158_answer[len-i-1] = CS158_temp;
    }

    CS158_answer[index++] = '.';

    
    for(int i = 0; i<6; i++){
        CS158_post = CS158_post * 11;
        int digit = (int)(CS158_post);
        CS158_post-= (float)digit;
        CS158_answer[index+i] = inBaseEleven(digit);
    }

}

// 1010.0011
