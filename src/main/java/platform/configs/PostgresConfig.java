package platform.configs;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class PostgresConfig {

    @Value("${database.postgres.host}")
    private String host;

    @Value("${database.postgres.port}")
    private int port;

    @Value("${database.postgres.name}")
    private String dbName;

    @Value("${database.postgres.username}")
    private String username;

    @Value("${database.postgres.password}")
    private String password;

    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(String.format("jdbc:postgresql://%s:%d/%s", host, port, dbName));
        config.setUsername(username);
        config.setPassword(password);
        return new HikariDataSource(config);
    }
}