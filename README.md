# targz
Simple script used to archive and unarchive .tar.gz files. Can be used both as a inline function and a standalone script.

# Usage
## Exampels
`./targz.sh -i="$HOME/Desktop" -o="/tmp/desktop.tar.gz" -m="archive" -cl=9`<br>
Archives the directory 'Desktop' with the higest compressesion level(9) and saving it to '/tmp/desktop.tar.gz'<br>
<br>

`./targz.sh -i="/tmp/desktop.tar.gz" -o="$HOME" -m="unarchive"`<br>
Unarchives the file desktop.tar.gz containing the directory 'Desktop' on '$HOME'<br>
<br>

## Arguments

### Input
#### -i or --input
#### Requires a parameter
#### This option is REQUIRED for this script to work.
<br>This option chooses what file/directory to archive/unarchive.<br><br>
Example: `./targz.sh -i=Somefile.plist`
<br><br><br>

### Output
#### -o or --output
#### Requires a parameter
#### This option will default to STDOUT if not set.
<br>This option chooses where to output the processed file.<br><br>
Example: `./targz.sh -i="/path/Somedir" -o="/tmp/dir.tar.gz"`
<br><br><br>

### Mode
#### -m or --mode
#### Requires a parameter
#### This option will default to 'archive' if not set.
<br>This option chooses wether to archive or unarchive files.<br>
Supported modes are 'archive' and 'unarchive'<br><br>
Example: `./targz.sh -i="/tmp/dir.tar.gz" -o="/tmp" -m=unarchive`
<br><br><br>

### Compression level
#### -cl or --compression-level
#### Requires a parameter
#### This option will default to '6' if not set.
<br>This option changes the compression level used when archiving files, with '1' being the fastest, with less compression, and '9' being the slowest, with optimal compression.<br><br>
Example: `./targz.sh -i="/path/Somedir" -o="/tmp/dir.tar.gz" -m=archive -cl=9`
<br><br><br>

## Exit codes
0: Everything went well.<br>
1: No input file specified.<br>
2: The input file does not exist.<br>
3: Unknown argument supplied to script<br>
4: Unknown mode supplied.<br>
5: Incorrect compression level. It must be between 1 and 9.
