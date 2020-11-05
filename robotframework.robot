*** Variables ***
${URL_GET}    https://jsonplaceholder.typicode.com/users
${URL_POST}    https://jsonplaceholder.typicode.com/posts


*** Keywords ***
Get API TEST
    Create Session    TESTAPI    ${URL_GET}
    ${resp}= Get Request    TESTAPI    /users
    Log ${resp.text}
    Should Contain ${resp.text}  200
    Should Contain ${resp.text}  ok
POST API NANT TEST
    Create Session    TESTAPI    ${URL_POST}
    &{data}= Create Dictionary    name=nantRobot     text= TEST API
    &{headers}= Create Dictionary    Content-Type=from-data
    ${resp}= POST Request    TESTAPI    /posts    data=${data} headers=${headers}
    Log ${resp.text}
    Should Contain ${resp.text} 201
    Should Contain ${resp.text} ok

*** Test Cases ***
Test Get TEST API
   Get TEST API
POST API TEST TEST
    POST TEST API
