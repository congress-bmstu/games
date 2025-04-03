#import "notes.typ": *
#import "@preview/cetz:0.3.3"
#import "@preview/cetz-plot:0.1.1": *

#show math.lt.eq: math.lt.slant
#show math.gt.eq: math.gt.slant

= Лекция 8

#example[
  Самолет в начальный момент времени находится на высоте $h_0$ и имеет скорость $v_0$.
  В конечный момент он должен достичь скорости $v_"конечное"$ и высоты $h_"конечное"$ с минимальным расходом горючего.

  Для решения задачи интервал $[v_0, v_k]$ разбивается на достаточно малые участки.
  Аналогично интервал $[h_0, h_k]$ разбивается на достаточно малые участки.
  #figure(
    cetz.canvas(
      {
        import cetz.draw: *
        set-style(
          axes: (
            stroke: (thickness: .5pt, dash: none, paint: auto),
            tick: (stroke: .5pt),
          ),
          legend: (stroke: none, orientation: ttb, item: (spacing: .1), scale: 5%),
        )
        let domain = (-5, 8)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -.3,
          x-max: 4.5,
          y-min: -.3,
          y-max: 4.5,
          y-tick-step: 10,
          x-tick-step: 10,
          x-label: $v$,
          y-label: $h$,
          {
            for i in (1, 2, 3, 4) {
              plot.add-hline(i, min: 1, max: 4, style: (stroke: black))
              plot.add-vline(i, min: 1, max: 4, style: (stroke: black))
            }
            for i in (0, 1, 2, 3, 4, 5, 6, 7, 8) {
              plot.add-anchor(
                str(int(i / 3)) + str(calc.rem(i, 3)) + "b",
                (int(i / 3) + 0.6 + 1, 1 + calc.rem(i, 3) + 0.2),
              )
              plot.add-anchor(
                str(int(i / 3)) + str(calc.rem(i, 3)) + "l",
                (int(i / 3) + 0.15 + 1, 1 + calc.rem(i, 3) + 0.6),
              )
            }
          },
        )
        content("plot.00l", $4$)
        content("plot.00b", $8$)
        content("plot.10l", $15$)
        content("plot.10b", $9$)
        content("plot.20l", $14$)
        content("plot.20b", $10$)

        content("plot.01l", $9$)
        content("plot.01b", $7$)
        content("plot.11l", $9$)
        content("plot.11b", $8$)
        content("plot.21l", $12$)
        content("plot.21b", $4$)

        content("plot.02l", $3$)
        content("plot.02b", $2$)
        content("plot.12l", $5$)
        content("plot.12b", $6$)
        content("plot.22l", $3$)
        content("plot.22b", $9$)
      },
      length: 50%,
    ),
  )

  Полагается, что в каждый момент времени самолет увеличивает либо скорость, либо высоту.

  Для решения данной задачи будем использовать метод динамического программирования.
  #todo[дописать]
]

#example[
  Фонд капитальных вложений $A$ нужно распределить между $N$ предприятиями. Прирост выпуска продукции на $i$-ом предприятии будем обозначать $x_i$. Тогда задача о распределении капитальных вложений будет определена следующим образом:
  $
    sum f_i (x_i) -> max, quad sum x_i = a
  $
  Пусть $c_k$ --- это средства вложенные в последние предприятия, начиная с $k$-ого:
  $ c_k = sum_(i=k)^n x_i $

  Обозначим через $F_k$ максимальную прибыль:
  $ F_k (c_k) = max sum_(i=k)^n f_i (x_i) $

  Используя принцип оптимальности можем записать:
  $ F_k = max_(x_k <= c_k) [f_k (x_k) + F_(k+1) (c_(k+1))], quad "где" c_(k+1)=c_k - x_k $
  $ F_k= max_(x_k <= c_k) [f_k (x_k) + F_(k+1) (c_k - x_k)] $
]
