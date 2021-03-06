unset xtics
unset ytics
unset border

set terminal pdf size 3.5, 3.18
set xrange [ -1 : 0.8 ]
set yrange [ -1 : 1 ]
set xzeroaxis ls 1 lw 4 linecolor rgb '#000000'
set style line 1 linecolor rgb '#9600ff' linetype 1 linewidth 4
set samples 30000

set output "trichotomy-1.pdf"
plot sin(x-0.3)**2 + 0.1 t "" w l ls 1

set output "trichotomy-2.pdf"
plot -abs((x-0.3)**3 + 2*x**2 - 0.8*x) - 0.1 t "" w l ls 1

set output "trichotomy-3.pdf"
plot x + 0.1*sin(x*10) + x**2 - 0.5 t "" w l ls 1
