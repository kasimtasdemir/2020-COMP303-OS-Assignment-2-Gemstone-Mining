TARGET_01        = solution1
SOURCE_01        = solution1.c

TARGET_02        = solution2
SOURCE_02        = solution2.c

TARGET_UTIL_GENERATE_BUCKET = utilities/generate_gemstone_bucket
SOURCE_UTIL_GENERATE_BUCKET = utilities/generate_gemstone_bucket.c

SEED			= 123

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
	rm -f $(TARGET_01) $(TARGET_02) "$(TARGET_UTIL_GENERATE_BUCKET)" $(OBJS)

.PHONY: tests
tests: test1 test2

test1: ans1
	@./$(TARGET_01)
test2: ans2
	@./$(TARGET_02)

.PHONY: generate
generate: run_generate
run_generate: $(TARGET_UTIL_GENERATE_BUCKET)
	@./$(TARGET_UTIL_GENERATE_BUCKET) $(SEED)	

$(TARGET_UTIL_GENERATE_BUCKET): $(SOURCE_UTIL_GENERATE_BUCKET)
