#include <fcntl.h>
#include <unistd.h>
#include <error.h>
#include <err.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

// todo:done safe creating files
// todo: safe creating dir
// todo: safe creating dir with paret

#define FAIL "✗"
#define PASS "✓"

int main(int argc, char *argv[])
{

	if (argc == 1)
	{
		printf("Enter your filenames!\n");
		exit(2);
	}

	for (size_t i = 1; i < argc; i++)
	{

		// atomically
		int fd = open(argv[i], O_RDONLY | O_CREAT | O_EXCL, 0644);

		if (fd == -1)
		{
			printf(FAIL " %s: %s\n", argv[i], strerror(errno));
		}
		else
		{
			printf(PASS " %s: created!\n", argv[i]);
		}

		close(fd);
	}

	return 0;
}