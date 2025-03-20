#import "notes.typ": *
#import "@preview/cetz:0.3.3"
#import "@preview/cetz-plot:0.1.1": *

#show math.lt.eq: math.lt.slant
#show math.gt.eq: math.gt.slant

= Лекция 5

Вспомним задачу математического программирования
$ cases(phi(x)->min, x in X subset RR^N) $

Далее будем рассматривать задачу следующего вида:
$ u(x),quad cases(x in X subset RR^N, u in RR^M) $

$x$ --- параметры, $u$ --- вектор критериев, по которым оценивается система. Для определенности рассмотрим случай, когда все критерии желательно максимизировать.

#table(
  columns: (45%, 10%, 45%),
  stroke: none,
  align: horizon + center,
  [#cetz.canvas(
      {
        import cetz.draw: *
        set-style(
          axes: (
            stroke: (thickness: .5pt, dash: none, paint: auto),
            tick: (stroke: .5pt),
          ),
          legend: (stroke: none, orientation: ttb, item: (spacing: .1), scale: 5%),
        )
        let domain = (-1, 3)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -0.4,
          x-max: 2.5,
          y-min: -0.4,
          y-max: 2.5,
          y-tick-step: 10,
          x-tick-step: 10,
          x-label: $x_1$,
          y-label: $x_N$,
          {
            plot.add-contour(
              (x, y) => { (x - 1) * (x - 1) + (y - 1) * (y - 1) },
              x-domain: domain,
              y-domain: domain,
              fill: true,
              style: (fill: rgb(50, 50, 250, 50), stroke: none),
              op: "<",
              z: 0.8,
            )
            plot.add-anchor("X", (1, 1))
          },
        )
        content("plot.X", $X$)
      },
      length: 80%,
    )],
  [$ stretch(=>)^(u(x)) $],
  [#cetz.canvas(
      {
        import cetz.draw: *
        set-style(
          axes: (
            stroke: (thickness: .5pt, dash: none, paint: auto),
            tick: (stroke: .5pt),
          ),
          legend: (stroke: none, orientation: ttb, item: (spacing: .1), scale: 5%),
        )
        let domain = (-1, 3)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -0.4,
          x-max: 2.5,
          y-min: -0.4,
          y-max: 2.5,
          y-tick-step: 10,
          x-tick-step: 10,
          x-label: $u_1$,
          y-label: $u_N$,
          {
            plot.add-contour(
              (x, y) => { (x - 1.2) * (x - 1.2) + (y - 1.5) * (y - 1.5) },
              x-domain: domain,
              y-domain: domain,
              fill: true,
              style: (fill: rgb(50, 250, 50, 50), stroke: none),
              op: "<",
              z: 1,
            )
            plot.add-anchor("U", (1.2, 1.5))
          },
        )
        content("plot.U", $U$)
      },
      length: 80%,
    )],
)

#definition[
  Точка $x_п in X$ называется оптимальной по Парето, если не существует другой точки из данного множества, такой, что $exists.not x in X: u(x)>=u(x_п); u(x)!=u(x_п)$
]

Аналогично и в пространстве критериев:
#definition[
  Точка $u_п in U$ называется оптимальной по Парето, если не существует другой точки из данного множества, такой, что $exists.not u in u: u>=u_п$
]

#definition[
  Точка $x_s in X$ называется точкой оптимальной по Слейтеру, если $exists.not x in X: x!=x_s, u(x)>u(x_s)$
]
Аналогично и в пространстве критериев:
#definition[
  Точка $u_s in U$ называется точкой оптимальной по Слейтеру, если $exists.not u in U: u!=u_s, u>u_s$
]

#example[
  На данном рисунке выделить точки оптимальные по Парето и Слейтеру.
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
        let domain = (-1, 3)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -0.4,
          x-max: 4,
          y-min: -0.4,
          y-max: 4,
          y-tick-step: 10,
          x-tick-step: 10,
          x-label: $u_1$,
          y-label: $u_2$,
          {
            plot.add-hline(3, min: 0, max: 1, style: (stroke: red + 2pt), label: "по Слейтеру")
            plot.add-hline(2, min: 1, max: 2, style: (stroke: red + 2pt))
            plot.add-hline(1, min: 2, max: 3, style: (stroke: red + 2pt))
            plot.add-vline(1, min: 2, max: 3, style: (stroke: red + 2pt))
            plot.add-vline(2, min: 1, max: 2, style: (stroke: red + 2pt))
            plot.add-vline(3, min: 0, max: 1, style: (stroke: red + 2pt))
            plot.add-anchor("p1", (1, 3))
            plot.add-anchor("p2", (2, 2))
            plot.add-anchor("p3", (3, 1))
            plot.add-legend(
              [по Парето],
              preview: () => {
                import cetz.draw: *
                circle((.5, .5), radius: .5)
              },
            )
            plot.add-fill-between(
              x => 3,
              x => 0,
              domain: (0, 1),
              style: (stroke: none, fill: blue.lighten(70%)),
            )
            plot.add-fill-between(
              x => 2,
              x => 0,
              domain: (1, 2),
              style: (stroke: none, fill: blue.lighten(70%)),
            )
            plot.add-fill-between(
              x => 1,
              x => 0,
              domain: (2, 3),
              style: (stroke: none, fill: blue.lighten(70%)),
            )
          },
        )
        mark("plot.p1", (0, 0), symbol: "o")
        mark("plot.p2", (0, 0), symbol: "o")
        mark("plot.p3", (0, 0), symbol: "o")
      },
      length: 50%,
    ),
    caption: [По Слейтеру оптимальные точки --- вся граница, по Парето --- угловые точки.],
  )
]

#todo[еще примеры с более сложными рисунками]

#example[
  M отраслей производит M продуктов. Каждая отрасль может производить только один продукт, но при помощи нескольких технологических процессов. Отрасли $i$ доступны технологические процессы $Lambda_i$. Общее количество трудовых ресурсов равно 1. $u_i$ --- доля трудовых ресурсов $i$-ой отрасли ($sum_i u_i=1$).

  $a^(lambda_i)_(i j)$ --- количество $j$-ого продукта, производимого $i$-ой отраслью, когда она функционирует с единичным уровнем интенсивности ($u_i=1$) и применяется технологический процесс $lambda_i in Lambda_i$. Вектор $a^(lambda_i)_i$ с координатами $a_(i 1), a_(i 2), ...$ называется вектор-процессом. Каждому производственному процессу $lambda_i$ соответсвует свой вектор-процесс. Если для каждой отрасли выбран производственный процесс (зафиксирован вектор $lambda$), то чистый выпуск продукта всей системы будет равен $C_j = sum_i u_i a_(i j)^(lambda_i)$

  На практике интересен случай, когда все $C_j > 0$. То есть можно организовать производство всех продуктов, что каждая отрасль будет производить продуктов больше, чем требуется для потребления всеми отраслями системы.

  #smallcaps[Задача]

  $ M=2, space a^1_1 = vec(3,-1), space a^2_1=vec(1.5,-3), space a^1_2=vec(-3,1), space a^2_2=vec(-1,2) $

  Графически найти множество оптимальных по Парето решений, выделить

  #smallcaps[Решение]
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
        let domain = (-4, 4)
        let a11 = (3, -1)
        let a21 = (1.5, -3)
        let a12 = (-3, 1)
        let a22 = (-1, 2)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -4,
          x-max: 4,
          y-min: -4,
          y-max: 3,
          y-tick-step: 1,
          x-tick-step: 1,
          x-label: $u_1$,
          y-label: $u_2$,
          {
            plot.add-anchor("a11", a11)
            plot.add-anchor("a21", a21)
            plot.add-anchor("a12", a12)
            plot.add-anchor("a22", a22)
            plot.add-anchor("par", (0.8, 0.8))
          },
        )
        mark("plot.a11", (0, 0), symbol: "o", fill: red)
        content("plot.a11", $a^1_1$, anchor: "west", padding: 5pt)
        mark("plot.a21", (0, 0), symbol: "o", fill: green)
        content("plot.a21", $a^2_1$, anchor: "west", padding: 5pt)
        mark("plot.a12", (0, 0), symbol: "o", fill: blue)
        content("plot.a12", $a^1_2$, anchor: "east", padding: 3pt)
        mark("plot.a22", (0, 0), symbol: "o", fill: purple)
        content("plot.a22", $a^2_2$, anchor: "east", padding: 3pt)

        content("plot.par", angle: -40deg, [*оптималные по Парето*])

        line("plot.a22", "plot.a11", stroke: red + 2pt)
        line("plot.a22", "plot.a21")
        line("plot.a12", "plot.a11")
        line("plot.a12", "plot.a21")
      },
      length: 80%,
    ),
  )
]

== Методы решения

#enum(
  [
    *Метод линейной свертки*. В данном случае предполагается что ЛПР(лицо, принимающее решение) может указать веса критериев ($alpha_i$). Тогда оптимальное решение ищется как решение задачи математического программирования для целевой функции $ cases(sum_i alpha_i u_i(x) ->max,x in X) $
    #example[
      Найти решение графически:
      $ alpha_1=5, space alpha_2=8 $
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
            let domain = (-1, 3)
            // set-style(mark: (symbol: ">"))
            plot.plot(
              name: "plot",
              axis-style: "school-book",
              x-min: -0.4,
              x-max: 2.5,
              y-min: -0.4,
              y-max: 2.5,
              y-tick-step: 10,
              x-tick-step: 10,
              x-label: $u_1$,
              y-label: $u_2$,
              {
                plot.add-contour(
                  (x, y) => { (x - 1.2) * (x - 1.2) + (y - 1.5) * (y - 1.5) },
                  x-domain: domain,
                  y-domain: domain,
                  fill: true,
                  style: (fill: rgb(50, 50, 50, 50), stroke: none),
                  op: "<",
                  z: 1,
                )
                plot.add-contour(
                  (x, y) => { 5 * x + 8 * y },
                  x-domain: domain,
                  y-domain: domain,
                  fill: false,
                  style: (stroke: purple),
                  op: "<",
                  z: (27.5, 20, 15, 10),
                  label: [Линии уровня],
                )
                plot.add-anchor("U", (1.2, 1.5))
                plot.add-anchor("O", (0, 0))
                plot.add-anchor("a", (1, 1.6))
                plot.add-anchor("at", (5, 8))
              },
            )
            content("plot.U", $U$)
            line("plot.O", "plot.a")
            mark("plot.a", "plot.at", symbol: ">")
          },
          length: 50%,
        ),
      )

    ]
  ],
  [
    *Метод идеальной точки*. Состоит из двух этапов.

    Первый этап. Решается $M$ задач математического программирования и определяется величина $u_i^0=max u_i(x), space x in X, i=dash(1\,M)$, $I=vec(u^0_1, ..., u^0_M)$

    Второй этап. Находится точка на допустимом множестве ближайшая к идеальной. То есть решается задача:
    $
      cases(rho(I, u(x)) ->min, x in X)
    $
    #figure(
      placement: auto,
      scope: "parent",
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
          let domain = (-1, 3)
          // set-style(mark: (symbol: ">"))
          plot.plot(
            name: "plot",
            axis-style: "school-book",
            x-min: -0.4,
            x-max: 2.5,
            y-min: -0.4,
            y-max: 2.5,
            y-tick-step: 10,
            x-tick-step: 10,
            x-label: $u_1$,
            y-label: $u_2$,
            {
              plot.add-contour(
                (x, y) => { (x - 2.2) * (x - 2.2) + (y - 2.5) * (y - 2.5) },
                x-domain: domain,
                y-domain: domain,
                fill: true,
                style: (fill: rgb(50, 150, 150, 50)),
                op: "<",
                z: (0.159167, 0.13, 0.1, 0.05),
                y-samples: 100,
                x-samples: 100,
              )
              plot.add-contour(
                (x, y) => { (x - 1.2) * (x - 1.2) + (y - 1.5) * (y - 1.5) },
                x-domain: domain,
                y-domain: domain,
                fill: true,
                style: (fill: rgb(50, 50, 50, 50), stroke: none),
                op: "<",
                z: 1,
              )
              plot.add-hline(2.5, min: 0, max: 2.2, style: (stroke: red))
              plot.add-vline(2.2, min: 0, max: 2.5, style: (stroke: red))
              plot.add-anchor("O", (0, 0))
              plot.add-anchor("U", (1.2, 1.5))
              plot.add-anchor("top", (2.2, 2.5))
            },
          )
          content("plot.top", [идеальная точка], anchor: "south", padding: 5pt)
          content("plot.U", $U$)
        },
        length: 90%,
      ),
    )
  ],
  [
    *Метод лексикографического упорядочивания*. Предполагается, что ЛПР может упорядочить по важности $u_1, u_2, ...$. Получаем несколько задач математического прорграммирования
    $
      cases(u_1^0=max u_1(x), x in X), quad
      cases(u_2^0=max u_2(x),u_1(x)=u^0, x in X), quad ...
    $

    Недостатком метода является то, что во многих случаев поиск оптимального решения сводится к оптимизации только первого критерия.
  ],
)

#example[
  $
    cases(
      f_1=4x_1+x_2,
      f_2=x_1+2x_2,
      x_1+x_2<=7,
      x_1<=5,
      x_2<=4,
      x_1>=0,
      x_2>=0
    )
  $
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
        let domain = (-2, 10)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -1.9,
          x-max: 10,
          y-min: -1.9,
          y-max: 10,
          y-tick-step: 1,
          x-tick-step: 1,
          x-label: $x_1$,
          y-label: $x_2$,
          {
            plot.add(
              x => { -4 * x },
              domain: domain,
              label: $f_1$,
            )
            plot.add(
              x => { -x / 2 },
              domain: domain,
              label: $f_2$,
            )
            plot.add(
              x => { -x + 7 },
              domain: (0, 7),
              label: $x_1+x_2<=7$,
            )
            plot.add-hline(4, min: 0, style: (dash: "dashed"))
            plot.add-vline(5, min: 0, style: (dash: "dashed"))
          },
        )
      },
      length: 50%,
    ),
  )

  $
    Z = {z | z=lambda vec(3,4) + (1 - lambda) vec(5,2), lambda in [0,1]}
  $
]

#example[
  _условие на фото_
  $
    A = mat(1,2;1,1;3,1;), quad Q=mat(1,1,4;), quad P=mat(17,12;), quad B=vec(20,15,39)
  $

  Выручка:
  $ f_1=17x_1+12x_2 -> max $
  $ Q A arrow(x) = mat(1,1,4;)mat(1,2;1,1;3,1;)vec(x_1,x_2)=14x_1+7x_2 $

  Прибыль:
  $ f_2=17x_1+12x_2-14x_1-7x_2=3x_1+5x_2->max $

  $
    cases(
      x_1>=0,
      x_2>=0,
      x_1+2x_2<=20,
      x_1+x_2<=15,
      3x_1+x_2<=39
    )
  $
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
        let domain = (-2, 20)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -1.9,
          x-max: 20,
          y-min: -1.9,
          y-max: 40,
          y-tick-step: 5,
          x-tick-step: 5,
          x-label: $x_1$,
          y-label: $x_2$,
          {
            plot.add(
              x => { 15 - x },
              domain: domain,
            )
            plot.add(
              x => { 10 - x / 2 },
              domain: domain,
            )
            plot.add(
              x => { 39 - 3 * x },
              domain: domain,
            )
            plot.add-fill-between(
              x => { 0 },
              x => calc.min(15 - x, 10 - x / 2, 39 - 3 * x),
              domain: (0, 13),
              style: (stroke: none, fill: gray.lighten(50%)),
            )
          },
        )
      },
      length: 50%,
    ),
  )
]

#example[
  Решить задачу методом линейной свертки ($alpha_1=0.4, alpha_2=0.6$)
  $
    cases(
      f_1=4x_1+x_2 -> max,
      f_2=x_1+2x_2 -> max,
      x_1+x_2<=7,
      0<=x_1<=5,
      0<=x_2<=4
    ) => f=0.4 f_1 + 0.6 f_2=2.2x_1+1.6x_2 -> max
  $
  $
    cases(
  x_1+x_2+x_3=7,
  x_1+x_4=5
  x_2+x_5=4,
  x_1,space x_2>=0
  ), f-2.2x_1-1.6x_2=0
  $
  Симплекс таблица:

  #box(fill: red.lighten(80%), outset: 4pt, "   ") --- выбранный разрешающий столбец

  #box(fill: yellow.lighten(80%), outset: 4pt, "   ") --- элемент, для которого $b_i/a_(i j)=min{b_i / a_(i j)}$

  #box(fill: blue.lighten(70%), outset: 4pt, "   ") --- элемент с которым произведены действия

  #let y = table.cell.with(fill: yellow.lighten(80%))
  #let r = table.cell.with(fill: red.lighten(80%))
  #let b = table.cell.with(fill: blue.lighten(70%))
  #figure(
    table(
      columns: (1.5fr, 1fr, 1fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr, 2.5fr),
      inset: 10pt,
      align: horizon + center,
      fill: (x, y) => if x == 0 or y == 0 {
        gray.lighten(50%)
      } else if calc.rem(y, 4) == 0 {
        gray.lighten(85%)
      },
      [*Шаг*], [*БН*], [*СЧ*], [$bold(x_1)$], [$bold(x_2)$], [$bold(x_3)$], [$bold(x_4)$], [$bold(x_5)$], [#text(
          size: 10pt,
        )[*Вычисления*]],
      row-gutter: (0pt, 0pt, 0pt, 0pt, 3pt, 0pt, 0pt, 0pt, 3pt, 0pt),
      column-gutter: (0pt, 0pt, 2.5pt, 0pt),
      table.cell(rowspan: 4)[*1*],
      [$x_3$], [7], r[1], [1], [1], [0], [0], [7],
      [$x_4$], [5], y[1], [0], [0], [1], [0], y[5],
      [$x_5$], [4], r[0], [1], [0], [0], [1], [$in.not RR$],
      [$f$], [0], r[-2.2], [-1.6], [0], [0], [0], [],

      table.cell(rowspan: 4)[*2*],
      [$x_3$], [2], [0], y[1], [1], [-1], [0], y[2],
      [$x_1$], [5], [1], r[0], [0], [1], [0], [$in.not RR$],
      [$x_5$], [4], [0], r[1], [0], [0], [1], [4],
      [$f$], [11], [0], r[-1.6], [0], [2.2], [0], [],

      table.cell(rowspan: 4)[*3*],
      [$x_2$], [2], [0], [0], [1], [-1], [0], [],
      [$x_1$], [5], [1], [0], [0], [1], [0], [],
      [$x_5$], [2], [0], [0], [-1], [1], [1], [],
      [$f$], b[14.2], b[0], b[0], b[1.6], b[0.6], b[0], [],
    ),
  )

  $
    x^*=(5;2;cancel(0\;0\;2, stroke: #red)) => x^*=(5;2), f^*=14.2, f^*_1=22, f^*_2=9
  $
]

#example[
  $
    A=mat(1,3;2,2;), quad Q=(2; 1), quad p=(6; 9), quad B=vec(18,16)
  $
  $ f_1=6x_1+9x_2->max, quad f_2=2x_1+x_2 ->max $
  $
    cases(
      x_1+3x_2<=18,
      2x_1+2x_2<=16,
      x_1\,x_2 >= 0
    )
  $
  Построим рисунок допустимой области, см. @ex1.

  #figure(
    placement: auto,
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
        let domain = (-2, 20)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -1.9,
          x-max: 20,
          y-min: -1.9,
          y-max: 10,
          y-tick-step: 2,
          x-tick-step: 2,
          x-label: $x_1$,
          y-label: $x_2$,
          {
            plot.add(x => (1 - x / 18) * 6, domain: domain, label: $l_1$)
            plot.add(x => (1 - x / 8) * 8, domain: domain, label: $l_2$)
            plot.add-fill-between(
              x => calc.min(
                (1 - x / 18) * 6,
                (1 - x / 8) * 8,
              ),
              x => 0,
              domain: (0, 8),
              style: (fill: green.lighten(70%), stroke: none),
              label: "Допустимая\nобласть",
            )
            plot.add-anchor("O", (0, 0))
            plot.add-anchor("A", (0, 6))
            plot.add-anchor("B", (3, 5))
            plot.add-anchor("C", (8, 0))
          },
        )
        content("plot.O", $O$, anchor: "west", padding: 5pt)
        content("plot.A", $A$, anchor: "west", padding: 5pt)
        content("plot.B", $B$, anchor: "west", padding: 5pt)
        content("plot.C", $C$, anchor: "south", padding: 5pt)
      },
      length: 50%,
    ),
    caption: "Допустимая область",
  )<ex1>
  $ F=mat(6,9;2,1;) $
  $ f(O)=F dot vec(0,0) = vec(0,0), quad F(A)=vec(54,6), quad F(B)=vec(63,11), quad F(C)=vec(48,16) $
  Тогда получим преобразованную область, см. @ex12.
  #figure(
    placement: auto,
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
        let domain = (-2, 65)
        // set-style(mark: (symbol: ">"))
        plot.plot(
          name: "plot",
          axis-style: "school-book",
          x-min: -1.9,
          x-max: 65,
          y-min: -1.9,
          y-max: 65,
          y-tick-step: 5,
          x-tick-step: 10,
          x-label: $f_1$,
          y-label: $f_2$,
          {
            plot.add-anchor("O", (0, 0))
            plot.add-anchor("A", (54, 6))
            plot.add-anchor("B", (63, 11))
            plot.add-anchor("C", (48, 16))
            plot.add-anchor("I", (63, 16))
            plot.add-anchor("f", (61.5, 11.5))
            plot.add-hline(16, min: 48, max: 63, style: (stroke: (dash: "dashed", paint: blue)))
            plot.add-vline(63, min: 11, max: 16, style: (stroke: (dash: "dashed", paint: blue)))
          },
        )
        line("plot.A", "plot.B", "plot.C", "plot.O", close: true, fill: green.lighten(70%))
        content("plot.O", $O$, anchor: "west", padding: 5pt)
        content("plot.A", $A$, anchor: "west", padding: 5pt)
        content("plot.B", $B$, anchor: "west", padding: 5pt)
        content("plot.C", $C$, anchor: "south", padding: 5pt)
        content("plot.I", $I$, anchor: "south", padding: 5pt)
        content("plot.f", $f^*$, anchor: "east", padding: 5pt)
        line("plot.I", "plot.f")
      },
      length: 50%,
    ),
    caption: "Новая допустимая область",
  )<ex12>
  Идеальная точка на новой области:
  $ I = vec(63,16) $

  Ищем точку ближайшую к идеальной $f^*, x^*$.
  $
    cases(
      3f_1-f_2=173,
      3f_1+f_2=288
    ) => f^* = vec(61.5,11.5)
  $
  $ F^(-1) = -1 / 12 mat(1,-9;-2,6) = mat(-1/12, 3/4;1/6,-1/2) $
  $ x^* = mat(-1/12, 3/4;1/6,-1/2) vec(61.5,11.5) = vec(7/2, 9/2) $
]
