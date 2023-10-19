
## NAME == EDEM QUASHIGAH

*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem


*** Test Cases ***
Read text files into Variables
#Get the file from the path and save it into Variable (originalFile)
    ${originalFile}=    Get File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\Ping\\webpages.txt
# Split the contents into separate strings in another LIST variable 
    @{webpages}=    Split String    ${originalFile}

    Log    ${originalFile}
# Set it as a global variable to make it visible to outside test cases
    Set Global Variable    ${webpages}

*** Test Cases ***
Check values from list
    Log    ${webpages}[0]
    Log    ${webpages}[1]
    Log    ${webpages}[2]

*** Test Cases ***
Loop through each webpage in list

     # Create an empty file (IPAddress.txt)
    Create File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\Ping\\IPAddress.txt

    
    # Loop through each url in the file
    FOR    ${url}    IN    @{webpages}
        Log    ${url}
        ${newWebpage}=    Set Variable    ${url}

        #Ping selected webpage
        ${output}=    Run And Return Rc And Output    ping ${newWebpage}
        Log    ${output}
        # Split output and place it into a variable
        @{stringOutput}=    Split String    ${output}[1]
        Log    ${stringOutput}

        # Search for IP Address of pinged website
        ${ipAddress}=    Set Variable    ${stringOutput}[2] 
        # Index 2 gives this value with square brackets "[192.0.66.168]". Maybe later take them out.

        # Search for Average ping time value (Average = 'xxx')
        ${index}=    Get Index From List    ${stringOutput}    Average
        ${pingTime}=    Set Variable    ${stringOutput}[${index + 2}]
        Log    ${pingTime}

        
        # Append the items into the file 
        Append To File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\Ping\\IPAddress.txt    ${url} has an IPAddress of ${ipAddress} and took an average of ${pingTime} to ping \n 
        

        # Test that the ping time is less than 50ms 
        Should Not Be Empty    ${ipAddress}
        Should Not Be Empty    ${pingTime}
        
        # Remove the 'ms' from the string and convert it into an int.
        ${intPing}=    Remove String    ${pingTime}    ms
        ${intPing}=    Convert To Integer    ${intPing}
        
        #Runs even if the ping time is more than 50ms
        Run Keyword And Continue On Failure    Should Be True    ${intPing} < 50
        
    END