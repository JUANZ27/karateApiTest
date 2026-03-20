package runners;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features/usuarios-crud-e2e.feature")
                .relativeTo(getClass());
    }
}