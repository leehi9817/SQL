/********************
*그룹함수
*********************/

--오류발생 이유확인할것-->1개의  row에 표현할 수없다
select first_name, avg(salary)
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select  count(*),
        count(commission_pct),
        count(department_id)
from employees;

select count(*)
from employees
where salary > 16000;

--부서번호가 100번인 사람의 갯수
select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select sum(salary), count(*), avg(salary)
from employees;

select sum(salary), count(*), avg(salary)
from employees
where salary > 16000;

--그룹함수 avg()
select  count(*),
        sum(salary),
        avg(salary)
from employees;

select  count(*),
        sum(salary),
        avg(    nvl(salary, 0)    )
from employees;

--그룹함수 - max() / min()
select  count(*), 
        max(salary),
        min(salary)
from employees;

/************************
*group by 절
*************************/
select avg(salary), department_id
from employees
group by department_id;