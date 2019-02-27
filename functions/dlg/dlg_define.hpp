#include "msot_components.hpp"


#define DIACOMB(var) DOUBLES(TAG,var)
#define DIARSC(var1,var2) DOUBLES(DIACOMB(var1),var2)

#define X_ANCHOR safeZoneX
#define X_SCREEN_SIZE safeZoneW
#define Y_ANCHOR safeZoneY
#define Y_SCREEN_SIZE safeZoneH

#define X_CENTERED(dar) (X_SCREEN_SIZE * 0.5) * (1 - (dar * 0.75)) + X_ANCHOR
#define Y_CENTERED(dar) ((Y_SCREEN_SIZE * 0.5) * (1 - dar)) + Y_ANCHOR

#define X_CALC(dar) ((dar * 0.75) * X_SCREEN_SIZE) + X_ANCHOR
#define Y_CALC(dar) (dar * Y_SCREEN_SIZE) + Y_ANCHOR

#define W_SIZE(dar) ((dar * 0.75) * X_SCREEN_SIZE)
#define H_SIZE(dar) (dar * Y_SCREEN_SIZE)

#define X_LEFT_SIDED(dar,dar1) ((X_SCREEN_SIZE * 0.5) + X_ANCHOR) - (W_SIZE(dar) + dar1)
#define Y_UP_SIDED(dar,dar1) ((Y_SCREEN_SIZE * 0.5) + Y_ANCHOR) - (H_SIZE(dar) + dar1)

#define X_RIGHT_SIDED(dar,dar1) ((X_SCREEN_SIZE * 0.5) + X_ANCHOR) + (W_SIZE(dar) + dar1)
#define Y_DOWN_SIDED(dar,dar1) ((Y_SCREEN_SIZE * 0.5) + Y_ANCHOR) + (H_SIZE(dar) + dar1)
