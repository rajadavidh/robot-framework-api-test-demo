# Author: Raja David Hasugian
# Run command: robot -d results tests/github_api_test.robot

*** Settings ***
Documentation  Robot Framework Demo for API Test from github
Resource  ../Resources/github.robot


*** Test Cases ***
Verify github username
    [Tags]  call
    Check github username

Verify displayed emoji
    [Tags]  display
    Check emoji