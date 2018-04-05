unset xtics
unset ytics
unset border

set terminal png size 700,540
set xrange [ -1 : 1 ]
set yrange [ -1 : 1 ]
set xzeroaxis ls 1
set style line 1 linecolor rgb '#9600ff' linetype 1 linewidth 2
set samples 10000

! rm -r video
! mkdir video

f(a,x) = \
  x <= -0.5 ? 2*(1+a) * (x+1) - 1 : \
  x <=  0.5 ? a : \
              2*(1-a) * (x-0.5) + a
zer(a) = \
  a > 0 ? 1./(2.*(1+a)) - 1 : \
          -a / (2.*(1-a)) + 0.5

do for [t=0:188] {
  print(t)
  a = cos(t/30.) * 0.5
  filenamePNG=sprintf("video/%04d.png", t)
  set output filenamePNG
  plot f(a,x) t "" w l ls 1, "<" . sprintf("echo %f %f", zer(a), 0) t "" w p ps 3 pt 7, \
    abs(a) < 0.01 ? (x >= -0.5 && x <= 0.5 ? 0 : 1/0) : 1/0 t "" w l lw 30
}

! ffmpeg -i video/%04d.png -vcodec libx264 -s 640x480 video/video.mp4
! qt-faststart video/video.mp4 zeros-in-families.mp4
