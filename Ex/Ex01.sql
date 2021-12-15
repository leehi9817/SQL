
--직원테이블 전체 조회
select * 
from employees;

--부서테이블 전체 조회
select *
from departments;

--원하는 컬럼만 조회
select employee_id, 
       first_name, 
       last_name
from employees;

--예)
select first_name,
       phone_number, 
       hire_date, 
       salary
from employees;

select first_name,
       last_name, 
       salary, 
       phone_number, 
       email, 
       hire_date
from employees;

--출력할 컬럼명 별명 적용하기
select employee_id as empNo, 
       first_name as "f-name", 
       salary as "연 봉"
from employees;

--예)
select first_name as 이름, 
       phone_number as 전화번호, 
       hire_date as 입사일,
       salary as 급여
from employees;

select employee_id as 사원번호, 
       first_name as 이름,
       last_name as 성,
       salary as 급여,
       phone_number as 전화번호,
       email as 이메일,
       hire_date as 입사일
from employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' 입사일은 ' || hire_date
from employees;

select first_name || ' ' || last_name name
from employees;

--산술 연산자 사용하기
select first_name, 
       salary as 월급,
       salary*12 as 연봉,
       (salary+300)*12
from employees;

--예) 숫자만 연산할 수 있다
select job_id*12
from employees;

--예)
select first_name || '-' || last_name as 성명, 
       salary 급여, 
       salary*12 연봉, 
       (salary*12)+5000 연봉2,
       phone_number 전화번호
from employees;

/*where 절*/
--비교 연산자
--부서번호가 10인 사원 이름을 구하시오
select first_name
from employees
where department_id = 10;

--급여가 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name, 
       salary
from employees
where salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name, 
       hire_date
from employees
where hire_date > '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where first_name = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name, 
       salary
from employees
where salary >= 14000
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where salary <= 14000
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, 
       hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--BETWEEN 연산자로 특정구간 값 출력하기
select first_name, 
       salary
from employees
where salary between 14000 and 17000;

--IN 연산자로 여러 조건을 검사하기
select first_name, 
       last_name, 
       salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select first_name, 
       last_name, 
       salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--예제)
select first_name, 
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

--Like 연산자로 비슷한것들 모두 찾기
select first_name, 
       last_name, 
       salary
from employees
where first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '_a__';

--NULL
select first_name, 
       salary, 
       commission_pct, 
       commission_pct*salary
from employees
where salary between 13000 and 15000;

--IS NULL / IS NOT NULL
select first_name, 
       salary,
       commission_pct
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, 
       salary, 
       commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null 
and commission_pct is null;

/*ORDER BY 절*/
select first_name, 
       salary
from employees
order by first_name asc, salary desc;

select first_name, 
       salary
from employees
where salary >= 9000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, 
       salary, 
       first_name
from employees
order by department_id asc; 

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, 
       salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc, salary desc;
