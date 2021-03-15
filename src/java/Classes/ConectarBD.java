package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Carlos
 */
public class ConectarBD {
    private Connection connection;
    
    public void conectar() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dados?autoReconnect=true&useSSL=false&" +
            "useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "");
            System.out.println("Conectado com Sucesso!");

        } catch (SQLException ex) {
            System.out.println("Erro ao conectar ao banco de dados! Detalhes do erro: "+ex);
        }
    }

    public void desconectar() {
        try {
            connection.close();
            System.out.println("Desconectado com Sucesso!");
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar conexão com o banco de dados!");
        }
    }

    //Cria os statments para os sql's serem executados
    public Statement criarStatement() {
        try {
            return this.connection.createStatement();
        } catch (SQLException e) {
            return null;
        }
    }

    public PreparedStatement criarPreparedStatement(String sql) {
        try {
            return this.connection.prepareStatement(sql);
        } catch (SQLException e) {
            return null;
        }
    }

    public Connection getConexao() {
        return connection;
    }
}
