TARGET_01        = solution1
SOURCE_01        = solution1.c

TARGET_02        = solution2
SOURCE_02        = solution2.c

CC = gcc
CFLAGS = -Wall -g3 -gdwarf-2 -DDEBUG

.PHONY: all
all: ans1 ans2
ans1: $(TARGET_01)
ans2: $(TARGET_02)

$(TARGET_01): $(SOURCE_01)
$(TARGET_02): $(SOURCE_02)

.PHONY: clean
clean:
	rm $(TARGET_01) $(TARGET_02) $(OBJS)

.PHONY: tests
tests: test1 test2

test1: ans1
	@./$(TARGET_01)
test2: ans2
	@./$(TARGET_02)