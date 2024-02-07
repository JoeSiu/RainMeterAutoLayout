# RainMeterAutoLayout

A rainmeter skin that will automatically switch to a specific layout on resolution changes. I often need to connect / disconnect multiple monitors, and Rainmeter seems doesn't provide a way to auto switch the layout when that happens, I will need to manually switch layout everytime that happens, which is annoying.

So far I only found a tool named [RainRez](https://forum.rainmeter.net/viewtopic.php?t=10471) that offers similar functionality, but it only checks the default monitor's resolution, and requires running a separate .exe file, therefore I decided to make my own...

## Installation

1. Download the `.rmskin` file from the [Releases](https://github.com/JoeSiu/RainMeterAutoLayout/releases/latest) section.
2. Double click the `.rmskin` file to install the skin.

## Usage

1. To utilize AutoLayout, you must first load the `AutoLayout/Main.ini` for each layout you want to switch to, and then save the layout.
2. Edit the configuration files located at `~YourRainMeterSkinFolder\AutoLayout\@Resources\Variables.inc`, specifically the `LayoutMap` variable.
3. The skin will monitor any resolution changes, and auto switch to the associated layout in ``LayoutMap`` if provided.

### Configs

| Variables               | Description                                                                                                                                              | Default |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `EnableMonitoring`    | Determines whether resolution monitoring is enabled (0 to disable, 1 to enable).                                                                         | 1       |
| `EnableDebugString`   | Determines whether the debug string meter is displayed at the center of the screen (0 to disable, 1 to enable).                                         | 0       |
| `OnLoadDelayTime`     | Delay time (in seconds) after the skin is loaded before starting the resolution monitoring.                                                              | 5       |
| `EnableDefaultLayout` | Determines whether to fallback to the `DefaultLayout` if no resolution layout is found after a resolution change (0 to disable, 1 to enable).          | 0       |
| `DefaultLayout`       | Specifies the default layout name to fallback to. This is only used if `EnableDefaultLayout` is set to 1.                                              |         |
| `LayoutMap`           | Associates resolutions with layouts.<br />Format: `{virtual screen width}x{virtual screen height}={layout name}`, separated by `LayoutMapDelimiter`. |         |
| `LayoutMapDelimiter`  | The delimiter used in `LayoutMap`.                                                                                                                     | "\|"    |

## Note

- The term "virtual screen" refers to the screen that encompasses all display monitors. For example, if two horizontally aligned monitors with resolutions of `2560x1440` and `1920x1080`, the virtual screen size would be `4480x1440`. Refer to [Rainmeter documentation](https://docs.rainmeter.net/manual/measures/sysinfo/#Monitor) for info.
- In the `LayoutMap` variable, if for example value `"4480x1440=Layout1|2560x1440=Layout2|1920x1080=Layout3"` is provided:
  - Both the 1440p and 1080p monitors are connected → switch to `Layout1`
  - Only the 1440p monitor is connected → switch to `Layout2`
  - Only the 1080p monitor is connected → switch to `Layout3`
- The skin will check resolution changes every second, modify the [skin's update rate](https://github.com/JoeSiu/RainMeterAutoLayout/blob/9f94f5701e5a4d54b572e97680d19852c6bfc2f6/AutoLayout/Main.ini#L9) if needed.
- Check [Rainmeter's log](https://docs.rainmeter.net/manual/user-interface/about/#LogTab) for log messages from the skin.
