#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <libgen.h>

// todo:done safe creating files
// todo: safe creating dir
// todo: safe creating dir with paret

#define FAIL "✗"
#define PASS "✓"

int main(int argc, char *argv[])
{

	int d = mkdir("dirr", 0755);

	if (d == -1)
	{
		perror("");

		exit(1);
	}

	return 0;
}