# README
Admin email: 'admin@admin.admin', password: "admin1111". It's working if db setup for dev.


задача: зрабіць на гітхабе(http://github.com) праект на рэйлс. 

усе кантроллеры і маделі пакрыць тэстамі. можна выкарыстоўваць скаффолд

Rails 5.2.3 Ruby 2.6.0

Git: кожны каміт завершаны, каміт павінен мець кароткае апісанне на ангельскай мове, таксама імя і эл. адрас павінна быць прапісана ў канфігах гіта.

пажадана рабіць змены невялікімі камітамі раз на дзень, каб быў бачны прагрэс

Праект гэта сістэма уліку праектаў. 


усе даступна толькі пасля ўваходу - выкарыстоўвай devise

для ралей Admin і User - выкарыстоўвай cancancan

база данных PostgreSQL

на важных калонках па выбаркам павінны быць прастаўлены індэксы.

Выкарыстоўвай bootstrap для вёрсткі. 


seeds.rb - павінны быць напісаны з дапамогай factory_girl/faker. - задача забіць кожную табліцу базы данных запісамі - не менш каб было 300-400 запісаў на кожную табліцу.


Маделі:

Project(name, summary, start_date, end_date)

Team(name)

User(email, password, first_name, last_name, admin)

Task(title, content, comments, status, start_date, due_date, estimation)

Post(content, comments) - пасты паказваюцца для кожнага праекта лістом на dashboard юзера.

* усе палі павінны мець валідацыі, калі неабходна і на унікальнасць.


Апісанне сувязяў маделей у праекце, выкарыстоўвай табліцы сувязей:

project has many tasks

project has team

Project has many posts

team has many users

user has many tasks

user has many posts

user can be without project, team, posts

post can be without user

post has many comments

Comment belongs to user

Team has many projects

Project has many teams

*сувязі могуль быць не аптымальнымі, калі неабхона аптымізуй структуру сувязяў у праекце сам


репорты:

колькасць таскаў на юзеры, колькасць выкананых тасках, колькасць таскаў у праекта, колькасць закрытых і адкрытых і г.д.

Выкарыстоўвай nested resources


вывад репорта на адной старонцы  - для адміна


SQL заданне


Напішы селект:

1. Два запыта на выбарку юзера:

колькасць праектаў у каторых юзеры без таскаў 

Колькасуь праектаў з таскамі, адсарціраваць па колькасць таскаў і даце старта праекта.

2. DISTINCT пачытай для чаго гэтая інструкцыя і паспрабуй напісаць з ёй запыт.  напішы 2 розных селекта. з паўторамі і без. калі трэба забіць паўтараючыхся данных у базу. 

3. Неабходна выбраць колькасць пастоў(або каментаў) для кожнага праекта.
