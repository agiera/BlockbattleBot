/*
Fast Artificial Neural Network Library (fann)
Copyright (C) 2003 Steffen Nissen (lukesky@diku.dk)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include <stdio.h>

#include "fann.h"

#define fann_scanf(type, name, val) \
{ \
	if(fscanf(file, name"="type"\n", &val) != 1) \
	{ \
		fann_error(NULL, FANN_E_CANT_READ_CONFIG, name, filename); \
		fann_destroy(ann); \
		return NULL; \
	} \
} 

int main()
{
	char * filename = "test.net";
	FILE *file;
	int t1=1, t2=2, t3=3, t4=4;
	float t5=1.111111111111111111111111;
	struct fann *ann = NULL;

    file = fopen(filename, "w");
	fprintf(file, "Test1=%d\n", t1);
	fprintf(file, "Test2=%d\n", t2);
	fprintf(file, "Test3=%d\n", t3);
	fprintf(file, "Test4=%d\n", t4);
	fprintf(file, "asdfgh="FANNPRINTF"\n", t5);
	fclose(file);

	printf("Test1=%d\n", t1);
	printf("Test2=%d\n", t2);
	printf("Test3=%d\n", t3);
	printf("Test4=%d\n", t4);
	printf("asdfgh="FANNPRINTF"\n", t5);

	t1=t2=t3=t4=0;
	t5=0;

	printf("Test1=%d\n", t1);
	printf("Test2=%d\n", t2);
	printf("Test3=%d\n", t3);
	printf("Test4=%d\n", t4);
	printf("asdfgh="FANNPRINTF"\n", t5);
	
	file = fopen(filename, "r");
	
    fann_scanf("%d", "Test1", t1);
    fann_scanf("%d", "Test2", t2);
    fann_scanf("%d", "Test3", t3);
    fann_scanf("%d", "Test4", t4);
    fann_scanf(FANNSCANF, "asdfgh", t5);

	fclose(file);

	printf("Test1=%d\n", t1);
	printf("Test2=%d\n", t2);
	printf("Test3=%d\n", t3);
	printf("Test4=%d\n", t4);
	printf("asdfgh="FANNPRINTF"\n", t5);

	return 0;
}
