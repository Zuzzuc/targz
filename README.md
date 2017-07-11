# targz
Simple script used to archive and unarchive .tar.gz files. Can be used both as a inline function and a standalone script.

This readme will soon be written.

# Usage

## Exampels

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

## Exit codes
0: Everything went well.<br>
1: No input file specified.<br>
2: The input file does not exist.<br>
3: Unknown argument supplied to script<br>
4: Unknown mode supplied.<br>
5: Incorrect compression level. It must be between 1 and 9.
