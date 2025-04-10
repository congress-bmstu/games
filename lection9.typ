#import "notes.typ": *
#import "@preview/cetz:0.3.3"
#import "@preview/cetz-plot:0.1.1": *

#show math.lt.eq: math.lt.slant
#show math.gt.eq: math.gt.slant

= Лекция 9

#example[
  #figure(
    table(
      columns: 5,
      inset: 1em,
      [$x_i$], table.vline(stroke: 2pt), [0], [1], [2], [3],
      table.hline(stroke: 2pt),

      [$f_1 (x_1)$], [0], [7], [9], [10],
      [$f_2 (x_2)$], [0], [4], [8], [12],
      [$f_3 (x_3)$], [0], [5], [9], [11],
    ),
  )
  $ F_k ( c_k ) = max_(x_k <= c_k) [ f_k (x_k) + F_(k+1) (c_k - x_k) ] $
  $
    k=3:quad F_3 ( c_3 ) = max_(x_3 <= c_3) [ f_3 (x_3) + overbrace(cancel(F_4 (c_3 - x_3)),"т.к. 3 предприятия") ] = f_3 (c_3), space x_3^* = c_3
  $
  $ k=2:quad F_2 ( c_2 ) = max_(x_2 <= c_2) [ f_2 (x_2) + overbrace(F_3 (c_2 - x_2), c_3) ] $
  #figure(
    table(
      columns: 7,
      inset: 1em,
      [$c_2 quad x_2$], [0], [1], [2], [3], [$F(c_2)$], [$x_2^*$],
      [0], [0+0], [---], [---], [---], [0], [0],
      [1], [0+5], [4+0], [---], [---], [5], [0],
      [2], [0+9], [4+5], [8+0], [---], [9], [0; 1],
      [3], [0+9], [4+9], [8+5], [12+0], [14], [1; 2],
    ),
  )
  $ k=1:quad F_1 ( c_1 ) = max_(x_1 <= c_1) [ f_1 (x_1) + overbrace(F_2 (c_1 - x_1), c_2) ] $
  #figure(
    table(
      columns: 7,
      inset: 1em,
      [$c_1 quad x_1$], [0], [1], [2], [3], [$F(c_2)$], [$x_2^*$],
      [0], [0+0], [---], [---], [---], [0], [0],
      [1], [0+5], [7+0], [---], [---], [7], [1],
      [2], [0+9], [7+5], [9+0], [---], [12], [1],
      [3], [0+13], [7+9], [9+5], [10+0], box(radius: 1em, fill: red.lighten(80%), outset: 0.5em, stroke: 1pt)[16], [1],
    ),
  )
  $ F^*=16, quad x_1^*=1,quad c_1=3 $
  $ c_2=c_1-x_1=3-1=2 $
  $ x_2^*={0; 1} $
  $
    cases(x_2^(1 *)=0,x_2^(2 *)=1, delim:"["), quad c_2=2 => cases(c_3^1=2-0=2,c_3^2=2-1=1, delim: "[")=> c_3={2; 1}space(=x_3^*)
  $
  $ cases(delim: "[", dash(x)^(1 *)=(1; 0; 2), dash(x)^(2 *)=(1; 1; 1)) $
]

#example[
  Планируется работа двух отраслей производства I, II на период $n$ лет. Количество средств $u$, вложенных в отрасль $i (i in {1,2})$ в начале года дает к концу года доход $f_i (u)$ и уменьшается до величины $r_i (u)$. В конце каждого года оставшиеся средства перераспределяются между отраслями. Найти такой способ распределения средств между отраслями, при котором об отрасли за $n$ лет получат суммарный максимальный доход.

  #smallcaps[*Решение*]

  Разобьем период в $n$ лет на $n$ шагов. Если $x_(k-1)$ --- средства, перераспределенные в начале $k$-ого года, а $u_k$ --- средства, выделенные I отрасли в $k$-ом году, то получим следующую модель задачи:
  $ J(x,u) = sum_(k=1)^n [ f_1 (u_k) + f_2 (x_(k-1)-u_k) ] -> max $
  $ x_k = r_1 (u_k) + r_2 (x_(k-1)-u_k), quad k=overline(1\,n) $
  $ u_k in [0, x_(k-1)], quad x_0=a, quad x_n>=0 $

  $ F_k (x_(k-1)) = max_(u_k, ... ,u_n) sum_(i=k)^n [ f_1 (u_i) + f_2 (x_(i-1)-u_i) ] $
  $
    F_k (x_(k-1)) = max_(u_k) { f_1 (u_k) + f_2 (x_(k-1)-u_k)+F_(k+1) (x_k) } =\
    = max_(u_k) { f_1 (u_k) + f_2 (x_(k-1)-u_k) +F_(k+1) [r_1 (u_k)+r_2 (x_(k-1)-u_k)] }
  $

  Пусть $f_1 (u) = u^2,space f_2 (u)=2u^2,space r_1=0.75 u,space r_2=0.3u, space n=3$. Решим задачу с конца.
  #enum(
    numbering: i => [*Шаг #i.*],
    [
      $k=3$
      $
        F_3 (x_2) = max_(u_3) { f_1 (u_3) + f_2 (x_2-u_3)+F_4 (x_3) } =\
        = max_(u_3) { f_1 (u_3) + f_2 (x_2-u_3) +cancel(F_4 [r_1 (u_3)+r_2 (x_2-u_3)]) } =\
        =max_(u_3 in [0,space x_2]) underbrace(u_3^2 + 2(x_2-u_3)^2, W(u_3)) = max{W(0)= 2x_2^2, quad W(x_2)=x_2^2}=2x_2^2, quad u_3^*=0
      $
    ],
    [
      $k=2$
      $
        F_2 (x_1) = max_(u_2) { f_1 (u_2) + f_2 (x_1-u_2)+F_3 (x_2) } =\
        = max_(u_2) { f_1 (u_2) + f_1 (x_1-u_2) +F_3 [r_1 (u_2)+r_1 (x_1-u_2)] } =\
        =max_(u_2 in [0,space x_1]) underbrace(u_2^2 + 2(x_1-u_2)^2+2(0.75u_2 +0.3(x_1-u_2))^2, W(u_2)) = max{W(0), W(x_1)} =\
        = max{2.18x_1^2,space 2.125x_1^2} = 2.18x_1^2, quad u_2^*=0
      $
    ],
    [
      $k=1$
      $
        F_1 (x_0) = max_(u_1) { f_1 (u_1) + f_2 (x_0-u_1)+F_2 (x_1) } =\
        = max_(u_1) { f_1 (u_1) + f_2 (x_0-u_1) +F_2 [r_1 (u_1)+r_2 (x_0-u_1)] } =\
        =max_(u_1 in [0,space x_0]) underbrace(u_1^2 + 2(x_0-u_1)^2+2.18(0.75u_1 + 0.3(x_0-u_1))^2, W(u_1)) = max{W(0), W(x_0)} =\
        = max{2.1962x_0^2,space 2.22625x_0^2} = underbrace(#box(fill:green.lighten(80%),radius:1em, outset: 0.3em,$2.22625x_0^2$), "доход за 3 года"), quad u_1^*=x_0=a
      $
    ],
  )
  Получили, что:
  $
    cases(delim: "[",
      dash(u_1)^*=(a;space 0;space 0),
      dash(u_2)^*=(0;space x_1;space x_2)=(0;space 0.75a;space 0.3dot 0.75a),
    )
  $
]

#example(title: [#emoji.toolbox Задача о замене оборудования #emoji.bolt])[
  #let tr = $"тыс."#{sym.ruble}$
  $p=13 #tr$, $s(t)=s=4#tr$, $N=10$, $t_0=2$.
  #let add(a, b) = { a.zip(b).map(a => { a.at(0) + a.at(1) }) }
  #let sub(a, b) = { a.zip(b).map(a => { a.at(0) - a.at(1) }) }
  #let rotate(arr, n) = {
    for _ in range(n) {
      arr.push(arr.remove(0))
    }
    arr
  }
  #let f = (27, 26, 26, 25, 24, 23, 23, 22, 21, 21, 20)
  #let r = (15, 15, 16, 16, 16, 17, 18, 18, 19, 20, 20)
  #let arr1 = sub(f, r).map(i => calc.max(3, i))

  #let arr2 = add(arr1, rotate(arr1, 1)).map(i => calc.max(14, i))
  #{ arr2.last() = 14 }
  #figure(
    table(
      columns: 12,
      inset: 0.5em,

      [$t_"лет"$], ..range(11).map(i => [#i]),
      [$f#tr$], ..f.map(i => [#i]),
      [$r#tr$], ..r.map(i => [#i]),
      [1], ..arr1.map(i => [#i]), table.vline(
        stroke: red + 2pt,
        start: 3,
        end: 4,
        x: 9,
      ),
      [2], ..arr2.map(i => [#i])
    ),
  )
  $
    F_n (t) = max cases(
      f(t) - r(t) + F_(n-1) (t+1),
      s - p + f(0) - r(0) + F_(n-1) (1)
    )
  $
  $
    F_1 (t) = max cases(
    f(t) - r(t)\, &"С.О. (сохранение оборудования)",
    s-p+f(0)-r(0)\, quad &"З.О. (замена оборудования)"
  )
  $
  $
    F_1(0) = max cases(27-15=12,3) = 12
  $
  $
    F_1(1) = max cases(11,3)=11
  $
]

#example[
  #figure(
    grid(
      columns: (50%, 50%),
      align: (center, left),
      table(
        columns: 4,
        inset: 1em,
        table.header([Этап $i$], [$xi_i$], [$k_i$], [$h_i$]),
        [1], [3], [3.00], [1.00],
        [2], [2], [7.00], [3.00],
        [3], [4], [6.00], [2.00],
      ),
      text(size: 12pt)[
        #set list(marker: emoji.banana)
        - $z_i$ --- количество заказанной продукции
        - $xi_i$ --- спрос
        - $x_i$ --- исходный запас на начало
        - $h_i$ --- затраты на хран. из $i$ в $i+1$
        - $k_i$ --- затраты на оформление
        - $c_i (z_i)=delta_i k_i + c_i (z_i)$ --- функ. пред. затр.
      ],
    ),
  )
  #enum(
    numbering: i => align(left)[*Шаг #{str(emoji.quest)*i}*],
    [
      $xi_3 = 4$, $z_3+x_3=4$ (запас+заказ=спрос), $k_3=6$
      #figure(
        table(
          columns: 9,
          inset: 0.5em,
          [], [$z_3$], [0], [1], [2], [3], [4], [], [],
          [$x_3$], [], [0], [16], [26], [36], [56], [$f_3 (x_3)$], [$z_3^*$],
          [0], [], [], [], [], [], [56], [56], [4],
          [1], [], [], [], [], [36], [], [36], [3],
          [2], [], [], [], [26], [], [], [26], [2],
          [3], [], [], [16], [], [], [], [16], [1],
          [4], [], [0], [], [], [], [], [0], [0],
        ),
      )
    ],
    [],
    [],
  )
]
