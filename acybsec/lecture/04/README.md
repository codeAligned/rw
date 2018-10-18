# Lecture 4: XXE Injection, Persistent XSS

2018.09.27

Good morning all
Today class will be remote, meaning we will not be in class today collectively but you will work on the assignment and start working on your semester projects from your home. 

https://free.codebashing.com/courses/java/lessons/xxe_injection

Your assignment is to work on the remaining two activities from within the Java module (XXE Injection, Persistent XSS), also please start outlining your semester project. Please provide me a rough draft of your project by Monday October 1 at noon. The draft should be an outline of the tools that you will be using as part of your project, if you do not have any written content about the tool set that's OK but you really should start putting time in to work on it. This is not the type of project that can be done at the last minute, on average the project has at least 30 pages. , If you have any questions or concerns please feel free to contact me. 
Thanks 
Prof. Davie
856 723 0598

## Note

2018.09.29

Good afternoon everyone. If you're a Windows user who wants to work in a Windows virtual environment, Microsoft has a tool that can make an .iso of your OS:
https://www.microsoft.com/en-us/software-download/windows10

The .iso it creates can be used with VirtualBox and other virtual environments.

## XXE Injection: XML External Entity Injection

Equivalant terms: XML Parser =  SAX Parser = XML Processor

1. Exercise Background

The vulnerable application pane loads the BatchTrader application, an online brokerage platform. Registered users of the system can login and then perform 'bulk uploads' of trades to multiple third party brokers. The batch trades are defined in an XML file, which traders must upload using the Trade Order Submission System. Alice is a trader and registered (legitimate) user of the application. 

2. XML Input File

Before we demonstrate how XXE attacks work, let's start by understanding the structure and contents of the net_trade.xml file that will be processed by the BatchTRADER application.

3. XML File Structure

The XML trade file defines five tags to describe a single trade order. These are name stock trader units and price which are processed by the BatchTRADER's server side SAX parser. Let’s try and submit the file to understand how the application processes our trade file. 

    <trades>
        <metadata>
            <name>Apple Inc</name>
            <stock>APPL</stock>
            <trader>
                <name>C.K Frode</name>
            </trader>
            <units>1500</units>
            <price>106</price>
            <name>Microsoft Corp</name>
            <stock>MSFT</stock>
            <trader>
                <name>C.K Frode</name>
            </trader>
            <units>5000</units>
            <price>45</price>
            <name>Amazon Inc</name>
            <stock>AMZN</stock>
            <trader>
                <name>C.K Frode</name>
            </trader>
            <units>4500</units>
            <price>195</price>
        </metadata>
    </trades>

4. XML File Upload
You should now have a copy of the sample trade data file saved locally as net_trade.xml in your downloads directory. 

As Alice, locate the net_trade.xml file and upload it using the "Upload Trades" feature.
Click the Upload button to continue

5. Application Output

As expected, the XML file net_trade.xml is processed by the server side's SAX parser logic. The business logic further presents the user with the list of trades that will be submitted for trade execution. 

6. Malicious XXE Input

An XXE attack works by taking advantage of a feature in XML, namely XML eXternal Entities (XXE) that allows external XML resources to be loaded within an XML document.

By submitting an XML file that defines an external entity with a file:// URI, an attacker can effectively trick the application's SAX parser into reading the contents of arbitrary file(s) that reside on the server-side filesystem. 

- As Alice click Play to modify the existing net_trade.xml file with our malicious input.
- Then Click Save to continue.

7. Malicious XML File

    <!DOCTYPE foo [<!ELEMENT foo ANY >
    <!ENTITY bar SYSTEM "file:///etc/passwd" >]>
    <trades>
        <metadata>
            <name>Apple Inc</name>
            <stock>APPL</stock>
            <trader>
                <foo>&bar;</foo>
                <name>C.K Frode</name>
            </trader>
            <units>1500</units>
            <price>106</price>
            <name>Microsoft Corp</name>
            <stock>MSFT</stock>
            <trader>
                <name>C.K Frode</name>
            </trader>
            <units>5000</units>
            <price>45</price>
            <name>Amazon Inc</name>
            <stock>AMZN</stock>
            <trader>
                <name>C.K Frode</name>
            </trader>
            <units>4500</units>
            <price>195</price>
        </metadata>
    </trades>

- As Bob locate the file net_trade_malicious.xml and upload it using the "Upload Trades" feature.
- Click Upload button to continue.


9. Vulnerable Code

Web applications using XML libraries are particularly vulnerable to external entity (XXE) injection attacks because the default settings for most XML SAX parsers is to have XXE enabled by default. 

To use these parsers safely, you have to explicitly disable referencing of external entities in the SAX parser implementation you use. We'll revisit this in the remediation section later. 

Let's now take a look at how BatchTRADE's server side SAX parser is configured to process incoming XML files. 

    public class TradeDocumentBuilderFactory {
    ​
        public static DocumentBuilderFactory newDocumentBuilderFactory() {
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            try {
                documentBuilderFactory.setFeature("http://xml.org/sax/features/external-general-entities", true);
                documentBuilderFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", true);
            } catch(ParserConfigurationException e) {
                throw new RuntimeException(e);
            }
            return documentBuilderFactory;
        }
    ​
    }

10. Remediation

Because user supplied XML input comes from an "untrusted source" it is very difficult to properly validate the XML document in a manner to prevent against this type of attack. 

Instead the XML processor should be configured to use only a locally defined Document Type Definition (DTD) and disallow any inline DTD that is specified within user supplied XML document(s). 

Due to the fact that there are numerous XML parsing engines available, each has its own mechanism for disabling inline DTD to prevent XXE. You may need to search your XML parser's documentation for how to "disable inline DTD" specifically.
Let's see how the above fix can be applied to our vulnerable example to remediate the XXE vulnerability.

    public class TradeDocumentBuilderFactory {
    ​
        public static DocumentBuilderFactory newDocumentBuilderFactory() {
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            try {
                // documentBuilderFactory.setFeature("http://xml.org/sax/features/external-general-entities", true);
                // documentBuilderFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", true);
                // Remediation:
                // if DOCTYPE declarations are not required by app:
                documentBuilderFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);    
                // elseif DOCTYPE declarations are required by app:           
                documentBuilderFactory.setFeature("http://xml.org/sax/features/external-general-entities", false);
                documentBuilderFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);

            } catch(ParserConfigurationException e) {
                throw new RuntimeException(e);
            }
            return documentBuilderFactory;
        }
    ​
    }

### Summary

In this module we learned why securely parsing user supplied XML can be tricky, and how XML eXternal Entity (XXE) Injection attacks work.

We also learned that when an XXE Injection attack is successful it can be used to seriously compromise an application itself, and even the underlying server. 

We also learned that using disallowing inline DTD is a good defense against this type of attack, but implementing this is specific to the XML parsing engine being used.

## Persistent (Stored) Xss

In this interactive tutorial you will understand how Persistent Cross Site Scripting (XSS) attacks are used to compromise the security of a web application, and how to write code more securely to protect against this type of attack. 

Note that Persistent XSS is also known as Stored XSS, we will use the terms interchangeably. 

### 1. Exercise Background

The TradeDIRECTORY application is a web based contact management application that accessible via the public Internet. 

Bob is an authorized user of the TradeDIRECTORY application, and has loaded it in his browser. 

As Bob click the Login button to access the Login Page. 

### 2. Login as Evil Bob

Although Bob is a legitimate user of the application, he plans to attack other users. 

Proceed to login as Bob with the following credentials:

    Username: bob@bank.com
    Password: bob123 

As Bob use the above credentials to authenticate to the TradeDIRECTORY platform

### 3. Add a Contact

As Bob Click the highlighted button to access the application's functionality that allows for the adding of new contact records by users. 

click the highlighted button to add New Contact

### 4. Malicious Contact
Enter the following as Bob in the Name field. 

Then save the comment into the contact database by clicking on the Save button.

    <script>alert(document.cookie)</script>

Create the malicious contact record using the above script code.

### 5. Logout Bob

Bob successfully saved the unusual contact record to the application's database. 

To understand the impact to other users of the application, we will need to first logout of Bob's application session. 


### 6. Login Alice

Alice needs to use the application to look up the most recent list of contacts. 

Go ahead and log in as Alice using her authentication credentials: 

    Username: alice@bank.com
    Password: alice123 

### 7. Script Execution

Interesting! When Alice logs in to the application to view the updated contact records, something strange happens. 

It seems that the malicious script code that Bob saved in the contact record was executed in Alice's browser. Recall that the script code saved by Bob was:

    <script>alert(document.cookie)</script>

  
### 8. Vulnerable Code

Let's take a look at the vulnerable code to understand how the persistent cross site scripting attack works at a code level.

    //
    // The following is a code snippet illustrating the use of insecure encoding/decoding in Java
    //
    <table>
        <c:forEach var="contact" items="${contacts}">
            <tr>
                <td>${contact.name}</td>
                <td>${contact.title}</td>
                <td>${contact.number}</td>
            </tr>
        </c:forEach>
    </table>

### 9. Remediation

To help defend against Stored Cross Site Scripting (XSS) attacks it is important to ensure that user-supplied data is output encoded before being served by the application to other users.

In essence output encoding effectively works by escaping user-supplied data immediately before it is served to users of the application.

By correctly escaping the data, when it is served to the user for display in their browser, the browser does not interpret it as code and instead interprets it as data, thus ensuring it does not get executed. 

For example the string: <script> is converted to: &lt;script&gt; when properly escaped and is simply rendered as text in the user's browser window, rather than being interpreted as code.
Let's see how recommendation techniques can be applied to our vulnerable example to remediate the stored XSS vulnerability.

//
// The following is a code snippet illustrating the use of insecure encoding/decoding in Java
//
​
    <table>
        <c:forEach var="contact" items="${contacts}">
            <tr>
    //              <td>${contact.name}</td>
    //              <td>${contact.title}</td>
    //              <td>${contact.number}</td>
                    <td><c:out value="${contact.name}"/></td>
                    <td><c:out value="${contact.title}"/></td>
                    <td><c:out value="${contact.number}"/></td>
        </tr>
        </c:forEach>
    </table>

###Summary

In this module we learned how Persistent Cross Site Scripting (XSS) attacks work. 
We also learned that Persistent XSS and Stored XSS are two different terms for the same thing. 
Furthermore, we understood that to protect against XSS, Output Encoding needs to take place whenever user-supplied data is used by the application when building responses to other users. 
Finally, we learned that the <c:out> function escapes HTML characters to help prevent against XSS. 