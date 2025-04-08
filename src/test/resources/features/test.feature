Feature: test

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Get tek bir post
    Given path 'posts/1'
    When method GET
    Then status 200
    And match response.id == 1
    And match response.userId == 1

  Scenario: Tüm postları getir
    Given path 'posts'
    When method GET
    Then status 200
    And match response.length > 0

  Scenario: Yeni post oluştur
    Given path 'posts'
    And request { title: 'foo', body: 'bar', userId: 1 }
    When method POST
    Then status 201
    And match response.title == 'foo'
    And match response.userId == 1

  Scenario: Post güncelle
    Given path 'posts/1'
    And request { id: 1, title: 'updated title', body: 'updated body', userId: 1 }
    When method PUT
    Then status 200
    And match response.title == 'updated title'

  Scenario: Post sil
    Given path 'posts/1'
    When method DELETE
    Then status 200
