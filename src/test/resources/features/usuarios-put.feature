Feature: PUT /usuarios/{_id} - Actualizar usuario

  Background:
    * url baseUrl
    * def updatedSchema = read('classpath:schemas/user-updated.schema.json')

  Scenario: Actualizar usuario existente
  # Arrange
    * def user = dataGen.newUser(true)
    Given path usersPath
    And request user
    When method POST
    Then status 201
    * def userId = response._id

  # Update
    * def updated = user
    * set updated.nome = updated.nome + ' Updated'

    Given path usersPath, userId
    And request updated
    When method PUT
    Then status 200
    And match response == updatedSchema
    And match response.message contains 'Registro alterado com sucesso'

  Scenario: Actualizar usuario inexistente
    * def user = dataGen.newUser(false)
    Given path usersPath, 'ID_INEXISTENTE_123'
    And request user
    When method PUT
    Then status 400
    And match response.message contains 'Usuário não encontrado'