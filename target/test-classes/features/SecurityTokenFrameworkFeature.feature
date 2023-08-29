@Regression
Feature: Security Token Test

  # Given: To prepare request. 
  # And: To Continue request. 
  # When: To Send request. 
  # Then: To validate request. 
  
  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  #Do Scenario # 1
  Scenario: Generate valid token with valid username and password
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  #Do Scenario # 2
  Scenario: Validate token with invalid username
  And request {"username": "WrongUserName", "password": "supervisor"}
  When method post
  Then status 400
  And print response
  
  #Do Scenario # 3
  Scenario: Validate token with invalid password
    And request {"username": "supervisor", "password": "wrong password"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"
