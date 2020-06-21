unset xtics
unset ytics
unset border

set terminal pngcairo size 400,418
set xrange [ -1 : 1 ]
set yrange [ -1 : 1 ]
set xzeroaxis ls 1 lw 4 linecolor rgb '#000000'
set style line 1 linecolor rgb '#9600ff' linetype 1 linewidth 4
set samples 10000

! rm -rf zeros-in-families-frames
! mkdir zeros-in-families-frames

f(a,x) = \
  x <= -0.5 ? 2*(1+a) * (x+1) - 1 : \
  x <=  0.5 ? a : \
              2*(1-a) * (x-0.5) + a
zer(a) = \
  a > 0 ? 1./(2.*(1+a)) - 1 : \
          -a / (2.*(1-a)) + 0.5

do for [t=0:188] {
  print(t)
  a = cos(t/30.) * 0.7
  filenamePNG=sprintf("zeros-in-families-frames/%04d.png", t)
  set output filenamePNG
  plot f(a,x) t "" w l ls 1, "<" . sprintf("echo %f %f", zer(a), 0) t "" w p ps 5 pt 7 lc rgb "#4545ff", \
    abs(a) < 0.01 ? (x >= -0.5 && x <= 0.5 ? 0 : 1/0) : 1/0 t "" w l lw 60
}

! avconv -i zeros-in-families-frames/%04d.png -vcodec copy zeros-in-families-frames/video.mp4
! qt-faststart zeros-in-families-frames/video.mp4 zeros-in-families.mp4
! rm zeros-in-families-frames/video.mp4
