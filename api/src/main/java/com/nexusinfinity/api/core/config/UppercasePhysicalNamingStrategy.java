package com.nexusinfinity.api.core.config;

import java.util.Locale;

import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

public class UppercasePhysicalNamingStrategy extends PhysicalNamingStrategyStandardImpl {

    @Override
    public Identifier toPhysicalCatalogName(Identifier identifier, JdbcEnvironment context) {
        return toUppercase(identifier);
    }

    @Override
    public Identifier toPhysicalSchemaName(Identifier identifier, JdbcEnvironment context) {
        return toUppercase(identifier);
    }

    @Override
    public Identifier toPhysicalTableName(Identifier identifier, JdbcEnvironment context) {
        return toUppercase(identifier);
    }

    @Override
    public Identifier toPhysicalSequenceName(Identifier identifier, JdbcEnvironment context) {
        return toUppercase(identifier);
    }

    @Override
    public Identifier toPhysicalColumnName(Identifier identifier, JdbcEnvironment context) {
        return toUppercase(identifier);
    }

    private static Identifier toUppercase(Identifier identifier) {
        if (identifier == null) {
            return null;
        }
        String name = identifier.getText().toUpperCase(Locale.ROOT);
        return Identifier.toIdentifier(name, true);  // true = quoted
    }
}
