@api
Feature: Book Management API Tests

  Background:
    Given url baseUrl

  @getRequest @1
  Scenario: Verify GET request to fetch all books
    Given path apiEndpoints.books
    When method GET
    Then status 200
    And match response == '#[]'

  @getRequest @2
  Scenario: Verify GET request to fetch a specific book
    Given path apiEndpoints.specificBook
    When method GET
    Then status 200
    And match response.id == 1

  @postRequest @3
  Scenario: Verify POST request to add a new book
    Given path apiEndpoints.books
    And request { title: 'New Book', author: 'John Doe', year: 2023 }
    When method POST
    Then status 201
    And match response.title == 'New Book'

  @putRequest @4
  Scenario: Verify PUT request to update an existing book
    Given path apiEndpoints.specificBook
    And request { title: 'Updated Book', author: 'John Doe', year: 2024 }
    When method PUT
    Then status 200
    And match response.title == 'Updated Book'

  @deleteRequest @5
  Scenario: Verify DELETE request to remove a book
    Given path apiEndpoints.specificBook
    When method DELETE
    Then status 200

  @getRequest @6
  Scenario: Verify GET request to fetch books by a specific author
    Given path apiEndpoints.books
    When method GET
    Then status 200
    And assert response.length > 0

  @getRequest @7
  Scenario: Verify GET request to check for an unavailable book
    Given path apiEndpoints.unavailableBook
    When method GET
    Then status 404

  @postRequest @8
  Scenario: Verify POST request to add a duplicate book
    Given path apiEndpoints.books
    And request { title: 'New Book', author: 'John Doe', year: 2023 }
    When method POST
    Then status 201

  @putRequest @9
  Scenario: Verify PUT request to update a non-existent book
    Given path apiEndpoints.unavailableBook
    * def MyUtils = Java.type('com.gemini.utils.MyUtils')
    * def unavailableBook = MyUtils.generateRandomString(10)
    And request { title: unavailableBook }
    When method PUT
    Then status 500

  @getRequest @10
  Scenario: Verify GET request to fetch book count
    Given path apiEndpoints.books
    When method GET
    Then status 200
    And assert response.length > 0

  @javaFunctionCall
  Scenario: Call Java function
    * def MyUtils = Java.type('com.gemini.utils.MyUtils')
    * def message = MyUtils.getCustomMessage('John Doe')
    * assert message == 'Hello, John Doe! This is a custom message.'
    * def sum = MyUtils.addNumbers(5, 10)
    * assert sum == 15
