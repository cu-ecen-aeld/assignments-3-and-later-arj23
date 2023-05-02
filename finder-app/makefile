# Default target: compile the program with GCC
writer: writer.c
ifdef CROSS_COMPILE
	$(CROSS_COMPILE)gcc -Wall -Wextra -o writer writer.c
else
	gcc -Wall -Wextra -o writer writer.c
endif

# Clean target: remove the compiled program
clean:
	rm -f writer