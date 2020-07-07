-- ROLES QUERY
SELECT roles.role FROM (
    SELECT emp_roles.roleID FROM employee JOIN emp_roles ON emp_roles.empID=employee.empID WHERE employee.empID=1

)as rl JOIN roles ON rl.roleID = roles.roleID;