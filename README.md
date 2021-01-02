# CrossCompare
A simple application for comparing two lists of strings to produce a list with unique or shared values. Allows simple VLookups without the use of Excel or a similar application.

![CrossCompare Demo GIF](https://raw.githubusercontent.com/nhwood/CrossCompare/master/docs/demo.gif)

# License

CrossCompare is licensed under the terms of the GNU General Public License v3.0. You may view the most [up-to-date terms of the license](https://github.com/nhwood/CrossCompare/blob/master/LICENSE) at any time.

# Features

* Written in [Free Pascal](https://www.freepascal.org/) to be cross-platform (Windows, macOS, and Linux)
* Simple UI with minimal resource usage
* Instant comparison between two lists
* Ability to filter on shared or left/right unique items
* Ability to auto-trim whitespace on paste of a large list
* Case sensitive/insensitive comparison
* Not reliant on any libraries other than the LCL provide with Free Pascal/Lazarus
* Basic customization abilities (Font, panel width, toolbar/status bar visibility)

# How to Download

**NOTE:** Precompiled binaries are coming, for now you must compile from source. Don't worry, it's very easy!

## Windows

Tested on Windows 10, Windows 7, and Windows XP (32-bit).

### 64-Bit

Tested on Windows 10

| Method |Hash                                                              |
|--------|------------------------------------------------------------------|
|SHA-1   |`7945779D7ACAC0F5E33C7F64AE0F500D3DEE733E`                        |
|SHA-256 |`75E5B4E66F97A96454F890317A17CCF4CE08A96EDF2865B8AF13B51F7DDBF6D5`|

**[Windows x64 Download - ZIP Folder Size: 1512134 bytes (1476 KiB)](https://www.noahw.org/Download/CrossCompare/x64)**

### 32-Bit

| Method |Hash                                                              |
|--------|------------------------------------------------------------------|
|SHA-1   |`BAC11FEC0AD0738207A856F495068B5FB95AEBD4`                        |
|SHA-256 |`B75B1D7018935308BD214CC95C41F487B595B95958145888CE20FDEE8DC34A64`|

**[Windows x86 Download - ZIP Folder Size: 1337040 bytes (1305 KiB)](https://www.noahw.org/Download/CrossCompare/x86)**

## macOS

Tested on macOS 10.13 (High Sierra). Intel x64 only.

| Method |Hash                                                              |
|--------|------------------------------------------------------------------|
|SHA-1   |`8B3BE3BABBD48AB348E1BEB8A1D145FB2BC97EFE`                        |
|SHA-256 |`7A666E6C6BBADE8C094AC3AA529D08A9EBB7F5A9A7E5A2BE8C0452543CA5E827`|

**[macOS x64 Download - App/ZIP Size: 123028 bytes (120 KiB)](https://www.noahw.org/Download/CrossCompare/macos)**

## Linux (Qt)

**NOTE:** There is a known issue with the Linux build using Qt5. This bug will show that the application quit unexpectedly when trying to close the program (resulting in  a SIGSEGV). This bug does not cause any issues with the application and is an issue with Qt and Free Pascal.

> Binary Coming Soon!

# How to Build from Source

You will need a copy of [Lazarus](https://www.lazarus-ide.org/). Simply download Lazarus and open the CrossCompare project file. From there you can build the application in Debug or Release modes. More detailed instructions coming soon!