# Magic-Wand
Magic Wand is a barcode scanner utility for EHR training environments. At its core, the app is a compiled AutoHotKey GUI script.

## Quick Start
If you just want to add some barcodes and test the app all you need to do is save the following files to a directory on your computer, add barcodes, and run. No installer is required and the executable can run from a network share. **The executable must be run from the same directory as the required files unless you customize the script with AutoHotKey**

To use the tool, run the executable (or script from AutoHotKey). Select the active window to send a barcode to from the Select open application drop-menu. Then press the button that corresponds to the barcode you wish to send. The window you selected will activate and the barcode will send. If your sound is on you should hear a satisfying "beep" when the barcode is sent. After a brief delay the app window will be activated for you to send additional barcodes.

### Required Files
* MagicWand.exe
* MW.ico (because it's pretty)
* barcodelist.txt

### Adding Barcodes
1. Open barcodelist.txt in your editor of choice
2. Add barcodes in the format "Stuff you want to display|barcodetoscan" without the quotes
    1. Each line in the file represents a barcode
    2. The easiest way to add a barcode is to scan it into the file after the pipe character. This ensures all special characters (preabmle, terminator, check digit) are included.
    3. You can also create a barcode without a scanner. Consult your EHR documentation for EHR specific barcode formatting

## Customization
To customize, you will need to edit MagicWand.ahk. See [AutoHotKey Documentation](https://www.autohotkey.com/docs/AutoHotkey.htm) for details. You can run the script on a computer with AutoHotKey installed or compile an executable with ahk2exe.

## Versioning 
* Version 1.0 - Released 5.19.2020

## Authors
* **Chris Liston** - *Initial work* - [clobbered](https://github.com/clobbered)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements
* Thanks to [PurpleBooth](https://github.com/PurpleBooth) for the great ReadMe example!