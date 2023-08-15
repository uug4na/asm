// Day 1, in osx inline asm
#include <iostream>
using namespace std;

int val = 0;

int main(void)
{
    asm volatile(
        "pushq %%rax\n"    // Use double '%' to escape '%'
        "movq $1337, %%rax\n"
        "movq %%rax, %0\n"
        "popq %%rax\n"
        : "=m" (val)    // Output to val
    );

    cout << "* Value: " << val << endl;
    return 0;
}

