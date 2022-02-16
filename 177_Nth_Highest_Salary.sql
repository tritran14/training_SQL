CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN  
  RETURN (
      select distinct salary 
      from (select salary, dense_rank() over (order by salary desc) my_rank from Employee) salary_rank_table where my_rank=N
  );
END
