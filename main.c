#include <stdio.h>

extern long area(void);

int main(void) {
	printf("Welcome to you friendly calculator.\n");
	printf("The main program will now call the area function.\n\n");

	long the_area = area();

	printf("\nThe main program received this integer: %ld\n", area_int);
	printf("Have a nice  day. Main will now return 0  to the operating system.\n");
	return 0;
}
