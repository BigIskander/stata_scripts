<h1>Скрипт для тестирования сливаемости данных в панель <br> (т.е. в панельный тип данных)</h1>
<p><a href="#ENG">In English</a></p>
<p>Скрипт написан для статистического пакета Stata.</p>
<p><b>Что делает эта программа:</b></p>
<p> Скрипт (программа) оценивает 3 модели (методом МНК):</p>
<ul>
<li>$$1) {{Y}_{it}}={{X}_{it}}{{\beta }_{i}}+{{\alpha }_{i}}$$</li>
<li>$$2) {{Y}_{it}}={{X}_{it}}\beta +{{a}_{i}}$$</li>
<li>$$3) {{Y}_{it}}={{X}_{i.}}\beta +\alpha $$
$${{X}_{i.}}=\sum \frac{{{X}_{it}}}{{{n}_{i}}}$$</li>
</ul>
<p>Оцениваемые модели: 1) Unrestricted panel Least Squares; 2) LSDV - Least Squares with Dummy Variables; 3) BE - Between panel model.</p>
<p>Затем, по оцененным моделям считаются тестовые статистики для следующих гипотез:</p>
<ul>
<li>1) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> LSDV - Least Squares with Dummy Variables; </li>
<li>2) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> BE - Between panel model; </li>
<li>3) <b>H0:</b> LSDV - Least Squares with Dummy Variables; <b>H1:</b> BE - Between panel model; </li>
</ul>
<p><b>Как использовать программу:</b></p>
<ul>
<li>1) файл с программой (<b>ispanel.ado</b>) поместить в папку для личных дополнений Stata (обычно это папка: <b>C:\ado\personal\</b>)</li>
<li>2) вызвать выполнение программы в Stata набрав команду в формате: <b><i>ispanel переменная_идентификатор_панели зависимая_переменная список_независимых_переменных</i></b></li>
<li>3) по завершении выполнения программы отобразится посчитанная статистика.</li>
</ul>
<p><b>Пример выполнения программы на тестовых данных:</b></p>
<p><img src="example.PNG"></p>
<hr>
<!-- English version -->
<h1 id="ENG">Script for testing the convergence of data to panel <br> (i.e. panel type of data)</h1>
<p>This script is written for Stata statistical software.</p>
<p><b>What this program is doing:</b></p>
<p> Script (programm) estimates 3 models (with Least Squares Method):</p>
<ul>
<li>$$1) {{Y}_{it}}={{X}_{it}}{{\beta }_{i}}+{{\alpha }_{i}}$$</li>
<li>$$2) {{Y}_{it}}={{X}_{it}}\beta +{{a}_{i}}$$</li>
<li>$$3) {{Y}_{it}}={{X}_{i.}}\beta +\alpha $$
$${{X}_{i.}}=\sum \frac{{{X}_{it}}}{{{n}_{i}}}$$</li>
</ul>
<p>Estimating models: 1) Unrestricted panel Least Squares; 2) LSDV - Least Squares with Dummy Variables; 3) BE - Between panel model.</p>
<p>Next, based on data from estimation program calculates statistics for hypothesis:</p>
<ul>
<li>1) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> LSDV - Least Squares with Dummy Variables; </li>
<li>2) <b>H0:</b> Unrestricted panel Least Squares; <b>H1:</b> BE - Between panel model; </li>
<li>3) <b>H0:</b> LSDV - Least Squares with Dummy Variables; <b>H1:</b> BE - Between panel model; </li>
</ul>
<p><b>How to use this programm:</b></p>
<ul>
<li>1) place file with program (<b>ispanel.ado</b>) in the folder for personal Stata plugins (usually this folder: <b>C:\ado\personal\</b>)</li>
<li>2) call programm execution in Stata by command in format: <b><i>ispanel panel_data_identificatar dependent_variable list_of_independent_variables</i></b></li>
<li>3) after program finishing the execution, it will show calculated statistics.</li>
</ul>
<p><b>Example of program execution on test data:</b></p>
<p><img src="example.PNG"></p>
