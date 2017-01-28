
Pre-requisites:
1. Eclipse should be installed.
2. MySQL should be installed.
	
Instructions:

1. Clone the project using the following command:
	git clone https://github.com/farzas/phonebook.git
2. Import the project as a maven project into eclipse.
3. Open the file src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml and search for the bean "dataSource".
4. Update the dataSource with the correct database configuration.
5. Right click the project and select "Run As" -> "Maven build".
6. In the configuration, under Main->Goals, provide the string "tomcat7:run".
7. Go to http://localhost:8080/home

Note:
1. Tables are created automatically since it is specified so in servlet-context.xml. 