#import "notes.typ": notes

#show: notes.with(author: "Andrey", title: "Теория игр и исследование операций")

#align(
  horizon + center,
  {
    set page(numbering: none)
    text(size: 26pt, weight: "bold")[Теория игр и исследование операций]
    v(1cm)
    text(size: 24pt)[Киселёв Виктор Вадимович]
  },
)
#pagebreak()
Зачет, 2 дз, 2 рк, каждое четвертое занятие контрольная работа. Выход к доске $->$ плюс, два плюса = зачет на контрольной.
#v(5mm)
#outline()
#pagebreak()


#include "lection1.typ"
#include "lection2.typ"
#include "lection3.typ"
#include "lection4.typ"
