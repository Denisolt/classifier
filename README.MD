# Classifier
The constant feeling of messy files (especially in Downloads folder) annoys everyone. 
script will look for the extensions of the files in the folder and organize them accordingly into 7 sections: 
- text
- data
- audio
- video
- images
- archives
- developer

if no extension was found, then it throws the file into filder called 'other'. 

## The extensions include:
<strong>Text extensions:</strong>
```text
'txt' 'doc' 'docx' 'log' 'msg' 'odt' 
'pages''rtf' 'tex' 'wpd' 'wps'
```
<strong>Data extensions:</strong>
```text
'csv' 'dat' 'ged' 'key' 'keychain' 'pps' 'ppt' 'pptx' 'sdf'
'tar' 'tax2016' 'vcf' 'xml' 'xlr' 'xls' 'xlsx'
```  

<strong>Audio extensions:</strong>
```text
'3g2' '3gp' 'asf' 'avi' 'flv' 'm4v' 'mov' 'mp4' 
'mpg' 'rm' 'srt' 'swf' 'vob' 'wmv'
````

<strong>Image extensions:</strong>
```text
'3dm' '3ds' 'max' 'obj' 'bmp' 'dds' 'gif' 'jpg' 'png' 
'psd' 'pspimage' 'tga' 'thm' 'tif' 'tiff' 'yuv' 'ai' 'svg'

```

<strong>Archives extensions:</strong>
```text
'7z' 'cbr' 'deb' 'gz' 'pkg' 'rar' 'rpm' 
'sitx' 'tar' 'gz' 'zip' 'zipx'
```

<strong>Developer extensions:</strong>
```text
'c' 'javac' 'cpp' 'cs' 'dtd' 'fla' 'h' 'java' 'lua' 'm'
'pl' 'py' 'sh' 'sln' 'swift' 'vb' 'vcxproj' 'xcodeproj'
```

## Challenges:
- Unfortunately Bash below version 4 does not support (,, for lower case, so I had to add the extensions both with capital and lower case letters)
- Have to add few lines so you can run the code through passing a path
 
