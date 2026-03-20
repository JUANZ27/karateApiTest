# ServeRest - Usuarios API | Karate DSL

## Objetivo
Suite de pruebas automatizadas (Karate DSL) para CRUD de Usuarios:
- GET /usuarios
- POST /usuarios
- GET /usuarios/{_id}
- PUT /usuarios/{_id}
- DELETE /usuarios/{_id}

Base URL: https://serverest.dev

## Requisitos
- Java 11+
- Maven 3.8+

## Ejecutar todos los tests
mvn test

## Ejecutar solo smoke (E2E)
mvn test -Dkarate.options="--tags @smoke"

> Alternativa: usar el runner SmokeRunner.

## Reportes
Karate genera reportes HTML en:
target/karate-reports/karate-summary.html

## Estructura
- features/: feature files por endpoint y E2E
- schemas/: validación de respuestas con match
- helpers/: generador de data aleatoria para evitar colisiones (email único)