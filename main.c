#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <libgen.h>

// todo:done safe creating files
// todo:done safe creating dir
// todo:done safe creating dir with parents

#define FAIL "✗"
#define PASS "✓"

#define BUF 1024
#define MAX_REC_DIRS 10

size_t pathnameToNames(const char *pathname, char *names[MAX_REC_DIRS])
{
	if (pathname == NULL || names == NULL)
	{
		perror("NULL ptrs!\n");
		return -1;
	}
	char cpathname[BUF];
	strncpy(cpathname, pathname, BUF);

	// love strtok
	size_t nameIdx = 0;
	names[nameIdx] = strtok(cpathname, "/");

	while (names[nameIdx] != NULL)
	{
		nameIdx++;
		names[nameIdx] = strtok(NULL, "/");
	}

	return nameIdx; // length
}

// check this is RG file or not
int isRG(char *name)
{
	if (strchr(name, '.') != NULL)
		return 0;
	return -1;
}

void safeCreateRG(char *path)
{

	// the open syscall, will not create it exists, O_EXCL
	int fd = open(path, O_RDONLY | O_CREAT | O_EXCL, 0644);

	if (fd == -1)
	{
		printf(FAIL " %s: %s\n", path, strerror(errno));
	}
	else
	{
		printf(PASS " %s: created!\n", path);
	}

	close(fd);
}

void safeCreateDir(char *path)
{
	// aleady safe, create new or empty only
	if (mkdir(path, 0755) == 0)
	{
		printf(PASS " %s\n", path);
	}
	else
	{
		printf(FAIL " %s : %s\n", path, strerror(errno));
	}
}

int main(int argc, char *argv[])
{

	// check args
	if (argc == 1)
	{
		printf("Add your pathnames!\n");
		exit(1);
	}

	// every loop for take one argv
	for (size_t i = 1; i < argc; i++)
	{
		char buildPath[BUF] = "";
		char *names[MAX_REC_DIRS];
		// int error = 0;

		size_t lenNames = pathnameToNames(argv[i], names);

		// more than one name: path
		if (lenNames != 1)
		{

			for (size_t element = 0; element < lenNames - 1; element++)
			{
				strcat(buildPath, names[element]);
				strcat(buildPath, "/");

				safeCreateDir(buildPath);
			}
		}

		strcat(buildPath, names[lenNames - 1]);

		if (isRG(names[lenNames - 1]) == 0)
		{
			safeCreateRG(buildPath);
		}
		else
		{
			safeCreateDir(buildPath);
		}
	}

	return 0;
}