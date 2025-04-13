# RainMeterAutoLayout

A rainmeter skin that will automatically switch to a specific layout on resolution changes. I often need to connect / disconnect multiple monitors, and Rainmeter seems doesn't provide a way to auto switch the layout when that happens, I will need to manually switch layout everytime that happens, which is annoying.

So far I only found a tool named [RainRez](https://forum.rainmeter.net/viewtopic.php?t=10471) that offers similar functionality, but it only checks the default monitor's resolution, and requires running a separate .exe file, therefore I decided to make my own...

## Demo

As shown, the skin will automatically switch to 3 different layouts based on the connected display resolutions.

https://github.com/user-attachments/assets/656fe6ce-43f9-4bd4-a699-9d300eef3a3b

## Installation

1. Download the `.rmskin` file from the [Releases](https://github.com/JoeSiu/RainMeterAutoLayout/releases/latest) section.
2. Double click the `.rmskin` file to install the skin.

## Usage

1. To utilize AutoLayout, you must first load the `AutoLayout/Main.ini` for each layout you want to switch to, and then save the layout.
   ![image](https://github.com/user-attachments/assets/ac7bc74c-6ff8-4642-8001-4986009dc0a3)
   ![image](https://github.com/user-attachments/assets/04772a9f-3b48-4351-802f-975ce38f239d)
2. Find the configuration file `Variables.inc` located at `~YourRainMeterSkinFolder\AutoLayout\@Resources\` (In Rainmeter, right-click on the folder, then select `Open folder`)
   ![image](https://github.com/user-attachments/assets/a74cc265-2ae2-4470-bae6-5ebbd2365565)
4. Edit the file using any text editor, specifically the `LayoutMap` variable. Refer to section [LayoutMap](#layoutmap) for detail.
   ![image](https://github.com/user-attachments/assets/cf050aac-5d2b-4d7e-a2de-760eeaff2a26)
6. Refresh the layout, it will now monitor any resolution changes, and auto switch to the associated layout in ``LayoutMap`` if provided.

### Configs

| Variables             | Description                                                                                                                                          | Default |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `EnableMonitoring`    | Determines whether resolution monitoring is enabled (0 to disable, 1 to enable).                                                                     | 1       |
| `EnableDebugString`   | Determines whether the debug string meter is displayed at the center of the screen (0 to disable, 1 to enable).                                      | 0       |
| `OnLoadDelayTime`     | Delay time (in seconds) after the skin is loaded before starting the resolution monitoring.                                                          | 5       |
| `EnableDefaultLayout` | Determines whether to fallback to the `DefaultLayout` if no resolution layout is found after a resolution change (0 to disable, 1 to enable).        | 0       |
| `DefaultLayout`       | Specifies the default layout name to fallback to. This is only used if `EnableDefaultLayout` is set to 1.                                            |         |
| `LayoutMap`           | Associates resolutions with layouts.<br />Format: `{virtual screen width}x{virtual screen height}={layout name}`, separated by `LayoutMapDelimiter`. |         |
| `LayoutMapDelimiter`  | The delimiter used in `LayoutMap`.                                                                                                                   | "\|"    |

#### LayoutMap

- The term "virtual screen" refers to the screen that encompasses all display monitors. For example, if two horizontally aligned monitors with resolutions of `2560x1440` and `1920x1080`, the virtual screen size would be `4480x1440`. Refer to [Rainmeter documentation](https://docs.rainmeter.net/manual/measures/sysinfo/#Monitor) for info.
- In the `LayoutMap` variable, if for example value `"4480x1440=Layout 1|2560x1440=Layout 2|1920x1080=Layout 3"` is provided:
  - Both the 1440p and 1080p monitors are connected → switch to `Layout 1`
  - Only the 1440p monitor is connected → switch to `Layout 2`
  - Only the 1080p monitor is connected → switch to `Layout 3`

## Note

- The skin will check resolution changes every second, modify the [skin's update rate](https://github.com/JoeSiu/RainMeterAutoLayout/blob/9f94f5701e5a4d54b572e97680d19852c6bfc2f6/AutoLayout/Main.ini#L9) if needed.
- Check [Rainmeter's log](https://docs.rainmeter.net/manual/user-interface/about/#LogTab) for log messages from the skin.
