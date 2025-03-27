#import "notes.typ": *
#import "@preview/cetz:0.3.3"
#import "@preview/cetz-plot:0.1.1": *

#show math.lt.eq: math.lt.slant
#show math.gt.eq: math.gt.slant

= Лекция 6

== Свертка #text(fill: gradient.radial(..color.map.rainbow), [Гермейера])

$ max_x min_i {alpha_i u_i (x)} $

$ exists u in RR^2, space alpha_1=alpha_2=1 $

#let ger = cetz.canvas(
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
      x-min: -.9,
      x-max: 7,
      y-min: -.9,
      y-max: 7,
      y-tick-step: 1,
      x-tick-step: 1,
      x-label: $u_1$,
      y-label: $u_2$,
      {
        for i in (1, 2, 3, 4, 5) {
          plot.add-hline(i, min: i, style: (stroke: rgb((5 - i) * 50, i * 50, i * 25)))
          plot.add-vline(i, min: i, style: (stroke: rgb((5 - i) * 50, i * 50, i * 25)))
        }
        plot.add(x => { x }, domain: domain, label: $y=x$)
      },
    )
  },
  length: 50%,
)
#figure(
  table(
    columns: 4,
    inset: 1em,
    align: center + horizon,
    [$u_1$], [$u_2$], [$f$], table.cell(rowspan: 5, stroke: none)[#ger],
    [$>=0$], [$0$], [$0$],
    [$0$], [$>=0$], [$0$],
    [$1.5$], [$0$], [$0$],
    [$2$], [$0$], [$0$],
  ),
)

#let ger = cetz.canvas(
  {
    import cetz.draw: *
    set-style(
      axes: (
        stroke: (thickness: .5pt, dash: none, paint: auto),
        tick: (stroke: .5pt),
      ),
      legend: (stroke: none, orientation: ttb, item: (spacing: .1), scale: 5%),
    )
    let domain = (-5, 10)
    // set-style(mark: (symbol: ">"))
    plot.plot(
      name: "plot",
      axis-style: "school-book",
      x-min: -.9,
      x-max: 9,
      y-min: -.9,
      y-max: 9,
      y-tick-step: 1,
      x-tick-step: 1,
      x-label: $u_1$,
      y-label: $u_2$,
      {
        for i in (1, 2, 3, 4, 5, 6, 7, 8) {
          plot.add-hline(i * 5 / 8, min: i, style: (stroke: rgb((8 - i) * 30, i * 30, i * 25)))
          plot.add-vline(i, min: i * 5 / 8, style: (stroke: rgb((8 - i) * 30, i * 30, i * 25)))
        }
        plot.add(x => { 5 / 8 * x }, domain: domain, label: $y=5 / 8 x$)
      },
    )
  },
  length: 50%,
)
$ alpha_1 = 5, quad alpha_2 = 8 $
#figure(
  table(
    columns: 4,
    inset: 1em,
    align: center + horizon,
    [$u_1$], [$u_2$], [$f$], table.cell(rowspan: 5, stroke: none)[#ger],
    [$$], [$$], [$0$],
    [$>=1 / 8$], [$>=1 / 8$], [$1$],
    [$8$], [$5$], [$40$],
    [$$], [$$], [$$],
  ),
)

Используя свёртку Гермейера можно получить Парето оптимальную точку.

Обычно мн-во допустимых значений в пространстве критериев неизвестно. Размерность м.б. $>3$.

ЛПР выбирает оптимальный вариант, исследуя множество допустимых значений в процессе _человеко-машинной_ процедуры. В _человеко-машинной_ процедуре можно использовать опыт и интуицию ЛПР, а также быстродействие и память компьютера.

Пример человеко-машинной процедуры с использованием свертки Гермейера см. @ger_ex

#algo[
  ЛПР задает значение желаемого варианта.

  #figure(
    placement: auto,
    cetz.canvas(
      {
        import cetz.draw: *
        set-style(
          axes: (
            stroke: (thickness: 1pt, dash: none, paint: auto),
            tick: (stroke: .5pt),
          ),
          legend: (stroke: none, orientation: ttb, item: (spacing: 1), scale: 5%),
        )
        let domain = (-1, 10)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -0.1,
          x-max: 10,
          y-min: -0.1,
          y-max: 10,
          y-tick-step: 15,
          x-tick-step: 15,
          x-label: $u_1$,
          y-label: $u_2$,
          {
            plot.add-anchor("O", (0, 0))
            plot.add-anchor("U", (5, 5))
            plot.add-contour(
              (x, y) => { (x - 5) * (x - 5) + (y - 5) * (y - 5) },
              x-domain: domain,
              y-domain: domain,
              fill: true,
              style: (fill: rgb(50, 50, 50, 50), stroke: none),
              op: "<",
              z: 4,
            )
            for i in (6.41, 6.75, 7.5, 8) {
              plot.add-hline(i, min: i, max: i + 1, style: (stroke: black))
              plot.add-vline(i, min: i, max: i + 1, style: (stroke: black))
            }
            for i in (8, 7) {
              plot.add-hline(i * 5 / 8, min: i, max: i + 1, style: (stroke: blue))
              plot.add-vline(i, min: i * 5 / 8, max: i * 5 / 8 + 1, style: (stroke: blue))
            }
            for i in (6, 5, 4.5) {
              plot.add-hline(i * 8 / 5, min: i, max: i + 1, style: (stroke: green))
              plot.add-vline(i, min: i * 8 / 5, max: i * 8 / 5 + 1, style: (stroke: green))
            }
            plot.add(x => { 5 / 8 * x }, domain: domain, label: $y=5 / 8 x,space u_1^*$, style: (stroke: blue))
            plot.add(x => { 8 / 5 * x }, domain: domain, label: $y=8 / 5 x,space u_2^*$, style: (stroke: green))
            plot.add(x => { x }, domain: domain, label: $y= x,space u_3^*$, style: (stroke: black))
            plot.add-anchor("U", (5, 5))
            plot.add-anchor("m1", (2.2, 2.5))
            plot.add-anchor("m2", (7, 7.4))
          },
        )
        content("plot.U", $U$, anchor: "west", padding: 7pt)
        content("plot.m1", [Задается человеком], angle: 45deg)
        content("plot.m2", text([Вычисляется компьютером], size: 12pt))
      },
      length: 50%,
    ),
  )
  По данному варианту вычисляются веса критериев. Компьютер вычисляет в смысле свертки ближайшее к желаемому значение.

  Если у ЛПР есть функция полезности и выполнена аксиома различимости, то процедура сходится за конечное число шагов.
]<ger_ex>

Функция $phi$ называется допустимым преобразованием, если после ее применения к критерию получается критерий позволяющий измерять то же качество.

#theorem[
  Если множество допустимых преобразований -- множество монотонных функций, то критерий называется качественным.
]
#theorem[
  Если множество допустимых преобразований:
  $ Phi = {phi | phi(u)=k u + l,space k>0} $
  то критерий называется количественным.
]

#example[
  Студенты получиили оценки:

  Студент А: 70, 70 (по 100 балльной) $<=>$ 4, 4 (по 5 балльной).

  Студент Б: 48, 100 (по 100 балльной) $<=>$ 2, 5 (по 5 балльной).

  Следовательно по 100 балльной шкале студент Б лучше, а по 5 балльной шкале студент А лучше. Отсюда вывод, что для качественных критериев использовать линейную свертку некорректно.
]

== Транспортная задача
#example(title: "Задача об инвестициях")[
  Две компании реализуют некоторый инвестиционный проект. Они должны разместить средства 40 и 60 миллиардов рублей в трёх банках в размерах 20, 30 и 50. При переводе денежных средств компании $k_i$ через банк $b_j$ уплачивается коммиссионный сбор в размере $c_(i j) dot 0.1%$ от суммы перевода. Считая известным матрицу коммиссий $C$
  $ C = mat(2,4,5;3,5,8;) $
  найти план перевода инвестиций, при котором величина коммиссионного сбора будет минимальной. Указать величину коммиссии. Пусть переменная $x_(i j)$ означает размер средств, которые переводится $i$-ый инвестор $j$-ому банку. Можно заметить, что $x_(i j)>=0$.
  $ i=dash(1\,2),quad j=dash(1\,3) $

  // #table(
  //   columns: 3
  // )
  Пусть $X$ --- некий план, $X^*$ --- оптимальный план.
  Целевая функция:
  $ f(X) = (2x_(1 1)+4x_(1 2)+5x_(1 3) + 3x_(2 1) + 5x_(2 2) + 8x_(2 3))dot 0.1% $

  #let p = 0.8em
  #let tr = place.with(top + right, dx: p, dy: -p)
  #let bl = place.with(bottom + left, dx: -p, dy: p)
  #let txr = text.with(fill: red)
  #enum(
    numbering: "Метод 1.",
    [
      Метод северозападного угла (@SZ_UGOL). Смотрим в верхний левый угол и в него отгружаем максимум.
      $ X = mat(20,20,0;0,10,50) $
      $ F(X) = 2dot 20 + 4dot 20 + 5 dot 10 + 50 dot 8 = 570 $
      #figure(
        table(
          columns: (auto, auto, auto, auto, auto, 10%),
          inset: p + 0.2em,
          align: center + horizon,
          table.cell(stroke: none)[], [B1], [B2], [B3], [$b_i$], table.cell(stroke: none)[],
          [A1], [#tr[#txr[2]]20], [#tr[#txr[4]]20], [#tr[#txr[5]]---], [40], table.cell(
            rowspan: 3,
            rotate(90deg, text(size: 10pt, [*возможности поставщиков*]), reflow: true),
          ),
          [A2], [#tr[#txr[3]]---], [#tr[#txr[5]]10], [#tr[#txr[8]]50], [60],
          [$a_j$], [20], [30], [50], [100],
          table.cell(stroke: none)[], table.cell(colspan: 3)[*запросы потребителей*], table.cell(
            stroke: none,
            colspan: 2,
          )[
            #txr[2,4,...] $=C_(i j)$
          ]
        ),
        caption: "Метод СЗ угла",
      )<SZ_UGOL>
      $ sum_i b_i = sum_j = a_j "- правильный баланс" $
    ],
    [
      Метод минимального тарифа (@MIN_TAR). Смотрим в первый столбец и отгружаем максимум туда, где циферка $C_(i j)$ меньше.
      $ X = mat(20,20,0;0,10,50) $
      $ F(X) = 2dot 20 + 4dot 20 + 5 dot 10 + 50 dot 8 = 570 $
      #figure(
        table(
          columns: 5,
          inset: p + 0.2em,
          align: center + horizon,
          [], [B1], [B2], [B3], [$b_i$],
          [A1], [#tr[2]20], [#tr[4]20], [#tr[5]---], [40],
          [A2], [#tr[3]---], [#tr[5]10], [#tr[8]50], [60],
          [$a_j$], [20], [30], [50], [100],
        ),
        caption: "Метод минимального тарифа",
      )<MIN_TAR>
    ],
    [
      Метод Фогеля (@FOGEL). Для каждого столбца и каждой строчки записываем разницу наименьшего и второго по малости элемента. В столбце (или строчке) с максимальной разницей выбираем клетку с минимальным тарифом и туда отгружаем максимум. Далее вычеркиваем строчку (или столбец), в которые отгрузили максимум. И повторяем пока не заполним таблицу.
      #figure(
        table(
          columns: 6,
          inset: p + 0.2em,
          align: center + horizon,
          [], [B1], [B2], [B3], [$b_i$], [],
          [A1], [#tr[2]---], [#tr[4]---], [#tr[5]40], [40], [$4-2=2$],
          [A2], [#tr[3]], [#tr[5]], [#tr[8]], [60], [$5-3=2$],
          [$a_j$], [20], [30], [50], [100], [],
          [], [$3-2=1$], [$5-4=1$], table.cell(fill: red.lighten(80%))[$8-5=3$], [],
        ),
        caption: "Метод Фогеля (одна итерация)",
      )<FOGEL>
    ],
    [
      Метод потенциалов (оптимизация метода Фогеля) (@poten).
      + Для заполненных клеток вычисляем #box(outset: 3pt, fill:red.lighten(80%), radius: 5pt)[$u_i + v_j = C_(i j)$].
      + Для пустых клеток вычисляем #box(outset: 3pt, fill:green.lighten(80%), radius: 5pt)[$Delta_(i j)$]$ = u_i + v_j - C_(i j)$.
      + Один из потенциалов (_любой_) берем равным #box(outset: 3pt, fill:blue.lighten(80%), radius: 5pt)[0].
      #figure(
        table(
          columns: 6,
          inset: p + 0.4em,
          align: center + horizon,
          [#place(top + right, dx: p, dy: -p)[$v_j$] #place(bottom + left, dx: -p, dy: p)[$u_i$] #line(
              start: (-p, -p),
              end: (p, p),
            )],
          [],
          [#box(outset: 3pt, fill: red.lighten(80%), radius: 5pt)[3]],
          [#box(outset: 3pt, fill: red.lighten(80%), radius: 5pt)[5]],
          [#box(outset: 3pt, fill: red.lighten(80%), radius: 5pt)[8]],
          [],

          [], [], [B1], [B2], [B3], [$b_i$],
          [1],
          [A1],
          [#tr[2]#bl[#box(outset: 3pt, fill: green.lighten(80%), radius: 5pt)[$2$]]---],
          [#tr[4]#bl[#box(outset: 3pt, fill: green.lighten(80%), radius: 5pt)[$2$]]---],
          [#tr[5]40],
          [40],

          [#box(outset: 3pt, fill: blue.lighten(80%), radius: 5pt)[0]], [A2], [#tr[3]20], [#tr[5]30], [#tr[8]10], [60],
          [], [$a_j$], [20], [30], [50], [100],
        ),
        caption: "Таблица, полученная по методу Фогеля, с пометками для метода потенциалов.",
      )<poten>

      Если все оценки отрицательные, то решение найдено.

      Иначе выбираем клетку с максимальной положительной оценкий и начинаем из неё цикл, двигаясь только по вертикали и горизонтали, при этом углы в заполненных клетках.
    ],
  )

]

