*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary  # only used to display result from API test


*** Variables ***



*** Keywords ***
Get response
    [Arguments]  ${parameters}
    # create the session
    create session  my_github_session  https://api.github.com

    # make the call (and capture the response in a variable)
    ${response} =  get request  my_github_session  ${parameters}

    # check the response status
    should be equal as strings  ${response.status_code}  200
    [Return]   ${response}


Check github username
    # call get response keyword
    ${response} =  Get response  users/rajadavidh

    # check the response body
    ${json} =  set variable  ${response.json()}
    should be equal as strings  ${json['login']}  rajadavidh
    log  ${json}


Check emoji
    # call get response keyword
    ${response} =  Get response  emojis

    # check the response body
    ${json} =  set variable  ${response.json()}
    ${emoji_url} =  set variable  ${json['aerial_tramway']}
    open browser  ${emoji_url}  chrome