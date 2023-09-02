[Variables]
; Determines whether resolution monitoring is enabled
EnableMonitoring=1
; Determines whether the debug string meter is displayed
EnableDebugString=0
; Delay time (in seconds) after the skin is loaded before starting the resolution monitoring
OnLoadDelayTime=5
; Determines whether to fallback to the DefaultLayout if no resolution layout is found after a resolution change
EnableDefaultLayout=0
; Specifies the default layout name to fallback to. This is only used if EnableDefaultLayout is set to 1
DefaultLayout="DefaultLayout"
; Associates resolutions with layouts
; Format: [virtual screen width]x[virtual screen height], separated by LayoutMapDelimiter
LayoutMap="4480x1440=Layout1|2560x1440=Layout2|1920x1080=Layout3"
; The delimiter used in LayoutMap
LayoutMapDelimiter="|"
