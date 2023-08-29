@Regression
Feature: Verify Account

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token
    
    #Scenario # 7
  Scenario: Verify an account that is exist    
        Given path "/api/accounts/get-account"
        #with def step create variable and assign value for reusability
        * def existingId = 8562
        And param primaryPersonId = existingId
        #Header have to add to request. 
        And header Authorization = "Bearer " + validToken
        When method get
        Then status 200
        And print response
        And assert response.primaryPerson.id == existingId
        
    #Scenario # 8
    Scenario: Verify get-account with Id not exist
        Given path "/api/accounts/get-account"
        And header Authorization = "Bearer " + validToken
        And param primaryPersonId = 9999999
        When method get
        Then status 404
        And print response
        And assert response.errorMessage == "Account with id 9999999 not found"
        
        
        
        
        
        
        
        
        
        
        
        