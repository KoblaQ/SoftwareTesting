*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    Process
Library    Telnet

*** Variables ***
${dbname}    robodb
${dbuser}    root
${dbpass}    password
${dbhost}    localhost
${dbport}    6033
${path}    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\

*** Keywords ***
Make Connection
    [Arguments]    ${dbtoconnect}
    Connect To Database    pymysql    ${dbtoconnect}    ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}


*** Test Cases ***
Create test Database 
    Make Connection    mysql
    Execute Sql String    drop database if exists ${dbname};
    Execute Sql String    create database ${dbname};
    Execute Sql String    use ${dbname};

    ${GetCommands}=    Get File    ${path}create_clauses.txt
    @{CreateCommands}=    Split String    ${GetCommands}    ;
    Log    ${CreateCommands}
    
    ${TableCount}=    Get Length    ${CreateCommands}
    ${IndexToBeRemoved}=    Evaluate    ${TableCount}-1
    Remove From List    ${CreateCommands}    ${IndexToBeRemoved}
    ${TableCount}=    Get Length    ${CreateCommands}

    FOR    ${index}    IN RANGE    ${TableCount}
        Log    ${index}
        Execute Sql String    ${CreateCommands}[${index}]
        
    END

    Set Global Variable    ${TableCount}


*** Test Cases ***
Insert Data into databsase
    Make Connection    ${dbname}


    ${GetCommands}=    Get File    ${path}insert_data_clauses.txt
    @{InsertCommands}=    Split String    ${GetCommands}    ;
    Log    ${InsertCommands}
    
    ${InsertCount}=    Get Length    ${InsertCommands}
    ${IndexToBeRemoved}=    Evaluate    ${InsertCount}-1
    Remove From List    ${InsertCommands}    ${IndexToBeRemoved}
    ${InsertCount}=    Get Length    ${InsertCommands}

    FOR    ${index}    IN RANGE    ${InsertCount}
        Log    ${index}
        Execute Sql String    ${InsertCommands}[${index}]
        
    END


*** Test Cases ***
Check tables
    Make Connection    ${dbname}
    ${databaseTables}=    Query    show tables;
    ${countOfTables}=    Get Length    ${databaseTables}

    Should Be Equal    ${countOfTables}    ${TableCount}

    FOR    ${index}    IN RANGE    ${countOfTables}
        Log    ${index}
        ${table}=    Set Variable    ${databaseTables}[${index}]
        ${table}=    Convert To String    ${table}
        ${table}=    Remove String    ${table}    ,    '    (    )
        Log    ${table}

        Table Must Exist    ${table}
        
    END



*** Test Cases ***
Add new column
    Make Connection    ${dbname}

    # Add a new column to the "module" table
    Query    Alter table module Add Robot varchar(60);
    
    # Check to see that the column is there.
    ${RobotColumn}=    Query    SHOW COLUMNS FROM module LIKE 'Robot';
    Should Be True    ${RobotColumn}


*** Test Cases ***
Remove new column
    Make Connection    ${dbname}

    # Remove the new column from1 the "module" table
    Query    ALTER TABLE module DROP COLUMN Robot;
    
    # Check to see that the column has been removed.
    ${RobotColumn}=    Query    SHOW COLUMNS FROM module LIKE 'Robot';
    Should Not Be True    ${RobotColumn}


