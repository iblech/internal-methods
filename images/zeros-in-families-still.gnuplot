unset xtics
unset ytics
unset border

set terminal pngcairo size 350,318
set xrange [ -1 : 1 ]
set yrange [ -1 : 1 ]
set xzeroaxis ls 1 lw 4 linecolor rgb '#000000'
set style line 1 linecolor rgb '#9600ff' linetype 1 linewidth 4
set samples 30000

set output "zeros-in-families-still.png"

f(a,x) = \
  x <= -0.5 ? 2*(1+a) * (x+1) - 1 : \
  x <=  0.5 ? a : \
              2*(1-a) * (x-0.5) + a
zer(a) = \
  a > 0 ? 1./(2.*(1+a)) - 1 : \
          -a / (2.*(1-a)) + 0.5

a = cos(70/30.) * 0.7
plot f(a,x) t "" w l ls 1, "<" . sprintf("echo %f %f", zer(a), 0) t "" w p ps 4 pt 7 lc rgb "#4545ff", \
    abs(a) < 0.01 ? (x >= -0.5 && x <= 0.5 ? 0 : 1/0) : 1/0 t "" w l lw 60
