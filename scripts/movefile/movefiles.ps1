$SrcPath = "C:\Users\Usuario\Downloads\bot\tramas"
$DestPath = "C:\Users\Usuario\Downloads\bot\tramas2"
Get-ChildItem -Path $SrcPath -File -Recurse -Filter *.zip | Move-Item -Destination $DestPath -force
