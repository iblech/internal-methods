unset xtics
unset ytics
unset border

set terminal pdf size 3.5, 3.18
set xrange [ -1 : 1 ]
set yrange [ -1 : 1 ]
set xzeroaxis ls 1 lw 4 linecolor rgb '#000000'
set style line 1 linecolor rgb '#9600ff' linetype 1 linewidth 4
set samples 30000

f(a,x) = \
  x <= -0.5 ? 2*(1+a) * (x+1) - 1 : \
  x <=  0.5 ? a : \
              2*(1-a) * (x-0.5) + a
zer(a) = \
  a > 0 ? 1./(2.*(1+a)) - 1 : \
          -a / (2.*(1-a)) + 0.5

a = 0

set output "/dev/null"
plot f(a,x) t "" w l ls 1

set output "zeros-in-families-still-1.pdf"
a = cos(70/30.) * 0.7
replot

set output "zeros-in-families-still-2.pdf"
a = 0
replot

set output "zeros-in-families-still-3.pdf"
a = cos(10/30.) * 0.7
replot
