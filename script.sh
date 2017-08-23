# !/bin/Bash
# Bash script for classifying the messy directories
# script will look for the extensions of the files in the folder
# and organize them accordingly into 7 sections:
# text,data,audio,video,images,archives,developer, and other if no extension was found

text=('txt' 'doc' 'docx' 'log' 'msg' 'odt' 'pages' 'rtf' 'tex' 'wpd' 'wps'
	'TXT' 'DOC' 'DOCX' 'LOG' 'MSG' 'ODT' 'PAGES' 'RTF' 'TEX' 'WPD' 'WPS')

data=('csv' 'dat' 'ged' 'key' 'keychain' 'pps' 'ppt' 'pptx' 'sdf' 'tar' 'tax2016' 'vcf' 'xml' 'xlr' 'xls' 'xlsx'
	'CSV' 'DAT' 'GED' 'KEY' 'KEYCHAIN' 'PPS' 'PPT' 'PPTX' 'SDF' 'TAR' 'TAX2016' 'VCF' 'XML' 'XLR' 'XLS' 'XLSX')

audio=('aif' 'iff' 'm3u' 'm4a' 'mid' 'mp3' 'mpa' 'wav' 'wma'
	'AIF' 'IFF' 'M3U' 'M4A' 'MID' 'MP3' 'MPA' 'WAV' 'WMA')

video=('3g2' '3gp' 'asf' 'avi' 'flv' 'm4v' 'mov' 'mp4' 'mpg' 'rm' 'srt' 'swf' 'vob' 'wmv'
	'3G2' '3GP' 'ASF' 'AVI' 'FLV' 'M4V' 'MOV' 'MP4' 'MPG' 'RM' 'SRT' 'SWF' 'VOB' 'WMV')

images=('3dm' '3ds' 'max' 'obj' 'bmp' 'dds' 'gif' 'jpg' 'png' 'psd' 'pspimage' 'tga' 'thm' 'tif' 'tiff' 'yuv' 'ai' 'svg'
	'3DM' '3DS' 'MAX' 'OBJ' 'BMP' 'DDS' 'GIF' 'JPG' 'PNG' 'PSD' 'PSPIMAGE' 'TGA' 'THM' 'TIF' 'TIFF' 'YUV' 'AI' 'SVG')

archives=('7z' 'cbr' 'deb' 'gz' 'pkg' 'rar' 'rpm' 'sitx' 'tar' 'gz' 'zip' 'zipx'
	'7Z' 'CBR' 'DEB' 'GZ' 'PKG' 'RAR' 'RPM' 'SITX' 'TAR' 'GZ' 'ZIP' 'ZIPX')

developer=('c' 'javac' 'cpp' 'cs' 'dtd' 'fla' 'h' 'java' 'lua' 'm' 'pl' 'py' 'sh' 'sln' 'swift' 'vb' 'vcxproj' 'xcodeproj'
	'C' 'JAVAC' 'CPP' 'CS' 'DTD' 'FLA' 'H' 'JAVA' 'LUA' 'M' 'PL' 'PY' 'SH' 'SLN' 'SWIFT' 'VB' 'VCXPROJ' 'XCODEPROJ')

# Above are different extensions, unfortunately had to list both capital and lower case,
# since Bash (below 4) does not support the ,, - for lower case 

# function checks if the extensions exists within the array
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

# checks if the folder exists, if not - creates a folder
function folder() {
	if [ ! -d "$1" ]; then
		mkdir $1
	fi
}


path=$1
echo "Classifying the files..."
# looping through every file within a directory
for fullfile in /path/{.,}*; do
	filename=$(basename "$fullfile") # extracting the filename
	extension="${filename##*.}" # extracting the extension
	filename="${filename%.*}" # filename without extension

	# there are files that users don't see, but machine does. such as . or .., 
	# those files and our organized folders should not be classified

	if [ "${fullfile}" == "." ] || [ "${fullfile}" == ".." ] || [ "${fullfile}" == "text" ] || [ "${fullfile}" == "data" ] || [ "${fullfile}" == "audio" ] || [ "${fullfile}" == "video" ] || [ "${fullfile}" == "images" ] || [ "${fullfile}" == "archives" ] || [ "${fullfile}" == "developer" ]; then
		echo "folder detected"
	# checks if the file extension exists in the array of text: steps repeated
  	elif [ $(contains "${text[@]}" "${extension}") == "y" ]; then
    	folder text
    	mv "${fullfile}" text/$filename
  	elif [ $(contains "${images[@]}" "${extension}") == "y" ]; then
		folder images 
		mv "${fullfile}" images
	elif [ $(contains "${audio[@]}" "${extension}") == "y" ]; then
		folder audio
    	mv "${fullfile}" audio
  	elif [ $(contains "${data[@]}" "${extension}") == "y" ]; then
		folder data
		mv "${fullfile}" data
  	elif [ $(contains "${video[@]}" "${extension}") == "y" ]; then
		folder video
		mv "${fullfile}" video
  	elif [ $(contains "${developer[@]}" "${extension}") == "y" ]; then
		folder developer
		mv "${fullfile}" developer
  	elif [ $(contains "${archives[@]}" "${extension}") == "y" ]; then
		folder archives
		mv "${fullfile}" archives
  	else
  		folder other
  		mv "${fullfile}" other
	fi
done
echo "All set"