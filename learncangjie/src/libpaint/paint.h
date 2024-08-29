#include <stdint.h>

typedef struct {
  int64_t x;
  int64_t y;
  int64_t w;
  int64_t h;
} Rect;

int64_t area(const Rect* rect);
