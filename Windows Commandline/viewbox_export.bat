@echo off
set path=C:\Users\%username%\Documents\

cd %path%
mkdir viewbox_export

cd viewbox_export

set datestr=%date:/=%

set dirname=%datestr:~8,4%_%datestr:~6,2%_%datestr:~4,2%

mkdir %dirname%

cd %dirname%







echo " --------------------------------- Exporting System A --------------------------------- "

:: KIMENETI FILE NEVE
set sysname=System A

:: HOST IP
set ipcim=192.168...

:: PORT
set portcim=3410

:: VIEWBOX (vb vagy vb_new)
set vbtipus=vb

:: VIEWBOX NEVE
set vbnev=viewbox

"C:\Program Files\Devart\dbForge Studio for MySQL\dbforgemysql.com" /dataexport /connection:"User Id=service;Host=%ipcim%;Port=%portcim%;Database=%vbnev%;Character Set=utf8" /password:x...y...z /outputfile:%path%viewbox_export\%dirname%\%sysname%_viewbox.sql /singlefile:true /templatefile:"N:\Viewbuilders\viewbox_backup\%vbtipus%.det"







echo " --------------------------------- Exporting System B --------------------------------- "

:: KIMENETI FILE NEVE
set sysname=System B

:: HOST IP
set ipcim=192.16...

:: PORT
set portcim=3308

:: VIEWBOX (vb vagy vb_new)
set vbtipus=vb_new

"C:\Program Files\Devart\dbForge Studio for MySQL\dbforgemysql.com" /dataexport /connection:"User Id=service;Host=%ipcim%;Port=%portcim%;Database=viewbox;Character Set=utf8" /password:x...y...z /outputfile:%path%viewbox_export\%dirname%\%sysname%_viewbox.sql /singlefile:true /templatefile:"N:\Viewbuilders\viewbox_backup\%vbtipus%.det"
