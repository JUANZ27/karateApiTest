Feature: DELETE /usuarios/{_id} - Eliminar usuario

  Background:
    * url baseUrl
    * def deletedSchema = read('classpath:schemas/user-deleted.schema.json')

  Scenario: Eliminar usuario existente
  # Arrange
    * def user = dataGen.newUser(false)
    Given path usersPath
    And request user
    When method POST
    Then status 201
    * def userId = response._id

  # Act
    Given path usersPath, userId
    When method DELETE
    Then status 200
    And match response == deletedSchema
    And match response.message contains 'Registro excluído com sucesso'

  Scenario: Eliminar usuario inexistente
    Given path usersPath, 'ID_INEXISTENTE_123'
    When method DELETE
    Then status 400
    And match response.message contains 'Usuário não encontrado'