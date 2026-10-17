
CC = gcc
AR = ar

CFLAGS = -Wall -Wextra -g -O0 -I./lib

.PHONY: all clean run-static run-shared run-dynamic

# 기본 빌드: 세 가지 방식 모두 생성
all: calc_static calc_shared calc_dynamic

# =====================================
#  정적 라이브러리
# =====================================

main.o: main.c lib/calc.h
	$(CC) $(CFLAGS) -c main.c -o main.o

lib/calc.o: lib/calc.c lib/calc.h
	$(CC) $(CFLAGS) -c lib/calc.c -o lib/calc.o

lib/libcalc.a: lib/calc.o
	$(AR) rcs lib/libcalc.a lib/calc.o

calc_static: main.o lib/libcalc.a
	$(CC) main.o lib/libcalc.a -o calc_static


# =====================================
#  공유 라이브러리
# =====================================

lib/calc.pic.o: lib/calc.c lib/calc.h
	$(CC) $(CFLAGS) -fPIC -c lib/calc.c -o lib/calc.pic.o

lib/libcalc.so: lib/calc.pic.o
	$(CC) -shared lib/calc.pic.o -o lib/libcalc.so

calc_shared: main.o lib/libcalc.so
	$(CC) main.o -L./lib -lcalc -o calc_shared


# =====================================
#  명시적 동적 로딩 (dlopen)
# =====================================

main_dynamic.o: main_dynamic.c
	$(CC) $(CFLAGS) -c main_dynamic.c -o main_dynamic.o

calc_dynamic: main_dynamic.o
	$(CC) main_dynamic.o -ldl -o calc_dynamic


# =====================================
#  실행
# =====================================

run-static: calc_static
	./calc_static

run-shared: calc_shared
	LD_LIBRARY_PATH=./lib ./calc_shared

run-dynamic: calc_dynamic lib/libcalc.so
	./calc_dynamic


# =====================================
#  빌드 결과물 삭제
# =====================================

clean:
	rm -f main.o main_dynamic.o
	rm -f lib/calc.o lib/calc.pic.o
	rm -f lib/libcalc.a lib/libcalc.so
	rm -f calc_static calc_shared calc_dynamic

