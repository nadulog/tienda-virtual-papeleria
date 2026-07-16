Add-Type -AssemblyName System.Drawing

$root = Split-Path -Parent $PSScriptRoot
$sourcePath = Join-Path $root 'public\images\bloomdate-hero.png'
$logoPath = Join-Path $root 'public\images\bloomdate-logo.png'
$outputPath = Join-Path $root 'public\images\whatsapp-preview.png'

$width = 1200
$height = 630
$canvas = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$photo = [System.Drawing.Image]::FromFile($sourcePath)
$scale = [Math]::Max($width / $photo.Width, $height / $photo.Height)
$drawWidth = [int]($photo.Width * $scale)
$drawHeight = [int]($photo.Height * $scale)
$drawX = [int](($width - $drawWidth) / 2)
$drawY = [int](($height - $drawHeight) / 2)
$graphics.DrawImage($photo, $drawX, $drawY, $drawWidth, $drawHeight)

$warmOverlay = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(105, 255, 249, 244))
$graphics.FillRectangle($warmOverlay, 0, 0, $width, $height)
$panel = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(232, 255, 255, 255))
$graphics.FillRectangle($panel, 55, 52, 650, 526)
$accent = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 48, 184, 161))
$graphics.FillRectangle($accent, 55, 52, 12, 526)

$logo = [System.Drawing.Image]::FromFile($logoPath)
$logoWidth = 350
$logoHeight = [int]($logo.Height * ($logoWidth / $logo.Width))
$graphics.DrawImage($logo, 105, 105, $logoWidth, $logoHeight)

$dark = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 65, 65, 63))
$green = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 48, 184, 161))
$titleFont = New-Object System.Drawing.Font('Segoe UI', 36, [System.Drawing.FontStyle]::Bold)
$bodyFont = New-Object System.Drawing.Font('Segoe UI', 21, [System.Drawing.FontStyle]::Regular)
$smallFont = New-Object System.Drawing.Font('Segoe UI', 15, [System.Drawing.FontStyle]::Bold)
$graphics.DrawString('Bienvenidos a BloomDate', $titleFont, $dark, 105, 270)
$subtitle = 'Papeler' + [char]0x00ED + 'a digital personalizada para momentos ' + [char]0x00FA + 'nicos.'
$bodyRect = New-Object System.Drawing.RectangleF(105, 340, 520, 100)
$graphics.DrawString($subtitle, $bodyFont, $dark, $bodyRect)
$graphics.DrawString('DISE' + [char]0x00D1 + 'OS CREADOS PARA TU EVENTO', $smallFont, $green, 105, 485)

$canvas.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$smallFont.Dispose(); $bodyFont.Dispose(); $titleFont.Dispose()
$green.Dispose(); $dark.Dispose(); $accent.Dispose(); $panel.Dispose(); $warmOverlay.Dispose()
$logo.Dispose(); $photo.Dispose(); $graphics.Dispose(); $canvas.Dispose()
Write-Output $outputPath
