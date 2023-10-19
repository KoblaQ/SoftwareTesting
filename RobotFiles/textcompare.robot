*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem
Library    Process
Library    Dialogs

*** Test Cases ***
Read text files into Variables
    ${original}=    Get File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\DeclarationOfIndependence.txt
    ${changed}=    Get File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\DeclarationOfIndependence_changed.txt
    @{originalList}=    Split String    ${original}
    @{changedList}=    Split String    ${changed}

    Log    ${originalList}
    Log    ${changedList}

    Set Global Variable    ${originalList}
    Set Global Variable    ${changedList}


## Run these test cases as a batch else it would fail. 
*** Test Cases ***
Loop lists and compare values
    @{differentWordIndex}=    Create List

    ${length}=    Get length    ${originalList}
    ${length2}=    Get length    ${changedList}

    Should Be Equal    ${length}    ${length2}

    FOR    ${index}    IN RANGE    ${length}
        Log    ${index}
        ${word}=    Set Variable    ${originalList}[${index}]
        ${word2}=    Set Variable    ${changedList}[${index}]
        
    END

    Log    ${differentWordIndex}
    Set Global Variable    ${differentWordIndex}

*** Test Cases ***
Display user info
    ${length}=    Get Length    ${differentWordIndex}

    FOR    ${index}    IN RANGE    ${length}
        Log    ${index}
        ${indexValue}=    Set Variable    ${differentWordIndex}[${index}]

        Pause Execution    
        ...    Word ${originalList}[${indexValue}] in index ${indexValue} is different in the second text file, where it was ${changedList}[${indexValue}]
        
    END

