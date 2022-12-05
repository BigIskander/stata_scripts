# Программа для тестирования сливаемости данных в панель <br> (т.е. в панельный тип данных)
<p><a href="#ENG">In English</a></p>
<p><b>Что делать эта программа:</b></p>
<p> Скрипт (программа) оценивает 3 модели (методом МНК):</p>
<ul>
<li>$$1) {{Y}_{it}}={{X}_{it}}{{\beta }_{i}}+{{\alpha }_{i}}$$</li>
<li>$$2) {{Y}_{it}}={{X}_{it}}\beta +{{a}_{i}}$$</li>
<li>$$3) {{Y}_{it}}={{X}_{i.}}\beta +\alpha $$
$${{X}_{i.}}=\sum \frac{{{X}_{it}}}{{{n}_{i}}}$$</li>
</ul>
<p>Оцениваемые модели: 1) Unrestricted panel Least Squares; 2) LSDV - Least Squares with Dummy Variables; 3) BE - Between panel model.</p>
<p>Затем по оцененным моделям считаются тестовые статистики для следующих гипотез:</p>
<ul>
<li>1) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> LSDV - Least Squares with Dummy Variables; </li>
<li>2) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> BE - Between panel model; </li>
<li>3) <b>H0:</b> LSDV - Least Squares with Dummy Variables; <b>H1:</b> BE - Between panel model; </li>
</ul>
<p id="ENG"><b>Как использовать программу:</b></p>
<ul>
<li>1) файл с программой (ispanel.ado) поместить в папку для личных дополнений Stata (обычно это папка: C:\ado\personal\)</li>
<li>2) вызвать выполнение программы в Stata набрав команду в формате: <b><i>ispanel переменная_идентификатор_панели зависимая_переменная список_независимых_переменных</i></b></li>
<li>3) по завершению выполнения программы отобразиться посчитанная статистика</li>
</ul>
