CC=gcc
CFLAGS=-Wall -D_GNU_SOURCE
OUTPUT_FILE=modbus_server
make:
	@echo [+] Compiling fileops
	$(CC)  $(CFLAGS) -c ./lib/common/file_ops.c -o fileops
	@echo [+] Compiling the final output file 
	$(CC)  $(CFLAGS) modbus_server.c -I./lib/modbus/ -lmodbus -I./lib/common/ -lpthread -lm ./lib/common/file_ops.c -o $(OUTPUT_FILE)
	@echo [+] Done
	@echo "************************************************************"
	@echo "* Done, now run ./$(OUTPUT_FILE) as root"
	@echo "************************************************************"
unmake:
	rm fileops
	rm $(OUTPUT_FILE)
