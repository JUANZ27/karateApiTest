package runners;
import com.intuit.karate.junit5.Karate;

class SmokeRunner {
    @Karate.Test
    Karate smoke() {
        return Karate.run("classpath:features/usuarios-crud-e2e.feature");
    }
}