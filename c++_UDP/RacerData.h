struct DVector3 {
  float x;
  float y; 
  float z;
} ;

struct RDashData
{
  enum Version
  {
    V_FEB2007=0x1000,            // First version
    V_JUN2007=0x1001,            // Added statistics (I-Vent)
    V_JAN2008=0x1002,            // Added lap timing
    V_JAN2008B=0x1003,           // Added flags (32 bits) for indicators
    V_OCT2010=0x1004,            // Added telemetry for remote telemetry viewing
    V_xxx
  };
  enum Flags
  {
    F_INDICATOR_LEFT=1,
    F_INDICATOR_RIGHT=2,
    F_LIGHTS=4,                 // Normal driving lights
    F_HIGHBEAM=8,               // Big lights
    F_SPEED_LIMITER=0x10,       // Speed limiter enabled
    F_xxx
  };
  enum Max
  {
    MAX_CAR_NAME=32,
    MAX_TRACK_NAME=32,
    MAX_CUSTOM_SIGNAL=10        // Other signals (log signals from ePhyse for example)
  };

  char   id[4];                 // Packet type
  int    version;

  // Sync'ed vars to display on the remote dashboard
  int    gearEngaged;
  float  rpm;
  float  rpmWarning;
  float  vehSpeed;
  bool   safetyBelt[2];
  bool   engineState;           // Engine running?
  float  gforceLat,gforceLon;   // Acceleration
  DVector3 acc;                 // Pure acceleration in m/s^2
  DVector3 pos;                 // Absolute world position (in meters)
  // Statistics (4-6-07)
  int    racePosition,
         intermediate,          // Last intermediate
         pacenote,              // Main pacenote image (-5..+5)
         timeDiffFront,         // Time difference to car in front
         timeDiffRear;          // Time diff to car behind current car
  float  lapDistance;           // Distance along the track
  float  totalDistance;         // Distance this race
  int    lap;                   // Lap number
  // Timing (15-1-08)
  int    time;                  // Total (absolute) time (ever increasing)
  int    lapTime,               // Current lap time (ms)
         bestLapTime;           // Best lap time
  int    flags;                 // Several single-bit values
  // Extra signals
  float  customSignal[MAX_CUSTOM_SIGNAL];

  // Controls
  float  steering;              // -1..1
  float  throttle,
         brakes,
         clutch,
         handBrakes;
  int    buttons;

  // Preview image (16-5-08)
  int    preview;
  // Track (16-5-08) for preview_layout.tga. Taken out until 3-11-2010 where the dash needs to swap.
  char   carName[MAX_CAR_NAME];
  char   trackName[MAX_TRACK_NAME];
};
