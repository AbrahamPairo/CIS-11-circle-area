default:
	@echo "[compute circle area] Cleaning old artifacts..."
	rm -f main *.o
	@echo "[compute circle area] Assembling area.asm -> area.o"
	yasm -f elf64 -g dwarf2 -werror -o area.o area.asm
	@echo "[compute circle area] compiling main.c -> main.o"
	gcc -c -Wall -gdwarf-2 -m64 -no-pie -o main.o main.c
	@echo "[compute circle area] linking -> main"
	gcc -Wall -gdwarf-2 -m64 -Werror -no-pie -z noexecstack main.o area.o -o main
	@echo "[compute circle area] done. run with: ./main"
