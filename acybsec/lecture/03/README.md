# Lecture 3: SQL Injection Lab

2018.09.20

Good afternoon all,
Today during class we will work on the following lab

https://free.codebashing.com/free-content/java/sql_injection

You will need to be able to log on the workstation in the classroom, please have your necessary login credential and password. 
If you have any questions please let me know. Thanks. 

# SQL Injection via Codebashing.com

Of course Alice is the legitmate trader (good guy) and Bob is the bad guy.

3. Logging In

Alice tries to login to the application with the following credentials:

Username: alice@bank.com

Password: alice123 

4. Bad Input

So the password alice123 doesn't seem to work for Alice's account. Before contacting the administrator to reset her password, Alice tries entering the same password followed by a single quote ' character. Something like:

Username: alice@bank.com

Password: alice123' 

Adding the single quote to the password caused the TradePORTAL application to crash with a HTTP 500 Internal Server Error 

Error: SQL syntax error 

SELECT `users`.* FROM `users` WHERE (email = 'alice@bank.com' AND password_hash = 'alice123') ORDER BY id ASC LIMIT 1
SELECT `users`.* FROM `users` WHERE (email = 'alice@bank.com' AND password_hash = 'alice123'') ORDER BY id ASC LIMIT 1
You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''alice123'') ORDER BY id ASC LIMIT 1' at line 1:SELECT `users`.* FROM `users` WHERE (email = 'alice@bank.com' AND password_hash = 'alice123'') ORDER BY id ASC LIMIT 1

6. Authentication Logic

To understand why the error occurred, let's first analyze TradePORTAL's authentication method, specifically the code responsible for checking Alice's authentication credentials. 

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String sql = "select * from users where (email ='" + email +"' and password ='" + password + "')";

    Connection connection = pool.getConnection();
    Statement statement = connection.createStatement();
    ResultSet result = statement.executeQuery(sql);
    ​
    if (result.next()) {
        loggedIn = true;
        // Successfully logged in and redirect to user profile page
    } else {
    ​
        // Auth failure - Redirect to Login Page
    }

7. Building the SQL Query

Boils down to 1 line:

   String sql = "select * from users where (email ='" + email +"' and password ='" password + "')";

8. Understanding Injection

Step 1: Enter the password alice123' and watch the code window. 
Notice how the single quote ' you appended is interpreted by the SQL server as a string delimiter. 
However, when the query is processed, the last quote does not have a closing/matching ' character, which causes a SQL syntax error , resulting in the HTTP 500 Internal Server Error 

Step 2: Now try logging with a password followed by two single quotes. e.g. alice123'' 
Interestingly, the application does not error in this case. 

9. Bypassing Authentication

At this point we know that injecting characters interpreted by the database server is known as SQL Injection 

However, its not just ' characters that can be injected, entire strings can be injected. What if this could be used to alter the purpose of the SQL statement entirely?

Try entering the following credentials: 

Username: alice@bank.com

Password: ' or 1=1)# 

Note in MySQL the # character is used for code comments. Keep an eye on the code window, everything to the right of the # character is commented out, including the extra ' and ) character.

NB: The provided SQL payload is the one you must use 

    String sql = "select * from users where (email ='" + email +"' and password ='" + password + "')";

    // Bellow is the raw query sent to the DB:
    "SELECT * FROM users WHERE (email = 'alice@bank.com' AND password = '' or 1=1)#')"

10. SQL Injection Explained
Authentication was bypassed, but why? Recall the following inputs were submitted: 

Username: alice@bank.com

Password: ' or 1=1)# 

The above resulted in the following SQL statement: 
SELECT UserID FROM User 
WHERE (email = 'alice@bank.com' 
AND password = '' OR 1=1)# 

Because the statement is both syntactically valid and OR 1=1 always returns true, the authentication mechanism was bypassed. Let's now analyse the vulnerability from a code perspective. 

The above attack happened because there was no input validation, including coercion and/or remova of malicious characters.

11. Remediation

Prepared statements (aka parameterized queries) are the best mechanism for preventing SQL injection attacks. 

Prepared statements are used to abstract SQL statement syntax from input parameters. Statement templates are first defined at the application layer, and the parameters are then passed to them. 

Aside from a better security posture against SQL injection attacks, prepared statements offer improved code quality from a legibility and maintainability perspective due to separation of the SQL logic from its inputs. 

In our modified code example, we first declare the authentication query string and assign it to the sql string variable. Notice that the email and password variable have now been replaced with ? symbol which act as a place holder for Java's PreparedStatement class.

The sql string variable is then passed as an argument to the prepareStatement() method, which precompiles the SQL query and creates a PreparedStatement object for sending parameterized SQL statements to the back end SQL server.

The setString() method is then called to pass the email parameter value to our prepared statement. This function takes two arguments, the position index of our placeholder denoted by ? and the parameter value stored in the email variable.

Similarly, the setString() method is then called to pass the password parameter value to our prepared statement.

Finally, we execute our authentication query by invoking the preparedStatement.executeQuery() method. The SQL used by PreparedStatement is precompiled ensuring that all parameters sent to the underlying database are treated as literal values and not SQL statement/query language, ensuring that no SQL code can be injected using an untrusted parameter.

Ultimately, the security payoff with using prepared statements is that the database will ensure the parameters are automatically escaped.

    String email = request.getParameter("email");
    String password = request.getParameter("password");
    ​
    //String sql = "select * from users where (email ='" + email +"' and password ='" + password + "')";
    String sql = "select * from users where email = ? and password = ? ";
    ​
    ​
    Connection connection = pool.getConnection();
    //Statement statement = connection.createStatement();
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    ​
    //ResultSet result = statement.executeQuery(sql);
    ​
    preparedStatement.setString(1, email);
    preparedStatement.setString(2, password);
    ​
    ResultSet result = preparedStatement.executeQuery();
    ​
    if (result.next()) {
        loggedIn = true;
        // Successfully logged in and redirect to user profile page
    } else {
    ​
        // Auth failure - Redirect to Login Page
    }

## Summary

In this module we learned how and why basic SQL Injection attacks work. 

We also learned that when a SQL Injection attack is successful it can be used to seriously compromise an application, with a wide range of possible negative outcomes depending on the specific instance of the vulnerability. A successful attack commonly results in unauthorised read access to data records within the database, however it can also include: authentication bypass, unauthorised deletion of user data, and unauthorised updating of user data. 

In certain very specific instances, a negative outcome that may be possible (depending on the underlying version of the DBMS and its configuration settings) is even command injection - this was more common with legacy DBMS versions than it is today. 

We also learned that using Prepared Statements in your code are a good defense against this type of attack. 
