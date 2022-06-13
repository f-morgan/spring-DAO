package ru.fadeeva.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class MyRepository {
    private final String SCRIPTFILENAME = "script.sql";
    private final String SCRIPTSTRING = read(SCRIPTFILENAME);

    @Autowired
    private NamedParameterJdbcTemplate JDBC;

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String getProductName(String name) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        return JDBC.queryForObject(SCRIPTSTRING, map, Product.class).toString();
    }

    private static class Product {
        private String productName;

        public Product(String productName) {
            this.productName = productName;
        }

        @Override
        public String toString() {
            return productName;
        }
    }

}
