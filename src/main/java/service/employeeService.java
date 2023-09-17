package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entity.Employee;

public class employeeService {
private static List<Employee> employeeList= new ArrayList<Employee>();

public void initiaizeEmployee() {
	Employee e1=new Employee();
	e1.setAdmin(true);
	e1.setEmpId(101);
	e1.setFirstName("harsh");
	e1.setLastName("thakur");
	e1.setPassword("123");
	e1.setUserName("harsh");
	e1.setSalary(100000);
	employeeList.add(e1);
	
	Employee e2 = new Employee();
	e2.setAdmin(false);
	e2.setEmpId(102);
	e2.setFirstName("Ram");
	e2.setLastName("Verma");
	e2.setPassword("111");
	e2.setUserName("ram");
	e2.setSalary(100000);
	employeeList.add(e2);
}
public Employee login(String userName, String passWord) {
	Optional<Employee> emp = employeeList.stream().filter(employeeList -> employeeList.getUserName().equals(userName) && employeeList.
			getPassword().equals(passWord)).findFirst();
	if(emp.isPresent())return emp.get();
	return null;
}
public List<Employee> getEmployee(){
	return employeeList;
}

public Employee add(int empId, String firstName, String lastName, String userName, String password, boolean admin, double Salary) {
    Employee e=new Employee();
    e.setAdmin(admin);
    e.setEmpId(empId);
    e.setFirstName(firstName);
    e.setLastName(lastName);
    e.setPassword(password);
    e.setSalary(Salary);
    e.setUserName(userName);
    employeeList.add(e);
    return e;
}
public Employee getEmployeeById(int empId) {
Employee emp = employeeList.stream()
.filter(e -> e.getEmpId() == empId)
.findFirst()
.orElse(null);
return emp;
}

public boolean deleteDetails(int empId) {
boolean check = employeeList.removeIf(emp -> emp.getEmpId() == empId && !emp.isAdmin());
return check;
}

public static List<Employee> employees = new ArrayList<>();

public boolean updateEmployee(Employee updatedEmployee) {
    for (Employee emp : employeeList) {
        if (emp.getEmpId() == updatedEmployee.getEmpId()) {
            emp.setUserName(updatedEmployee.getUserName());
            emp.setFirstName(updatedEmployee.getFirstName());
            emp.setLastName(updatedEmployee.getLastName());
            emp.setSalary(updatedEmployee.getSalary());
            emp.setAdmin(updatedEmployee.isAdmin());
            emp.setPassword(updatedEmployee.getPassword());
            return true; // Successfully updated
        }
    }
    return false; // Employee with the specified empId not found
}

public boolean updateUserData(int empId, String newUsername, String newFirstName, String newLastName) {
    for (Employee emp : employeeList) {
        if (emp.getEmpId() == empId) {
            emp.setUserName(newUsername);
            emp.setFirstName(newFirstName);
            emp.setLastName(newLastName);
            return true; // Successfully updated
        }
    }
    return false; // User with the specified empId not found
}
}
