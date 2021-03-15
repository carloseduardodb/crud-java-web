package Classes;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Carlos
 */


public class Funcoes {

    ConectarBD cdb = new ConectarBD();
    private int id;
    private String nome;
    private String email;
    private String telefone;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public boolean adicionar(){
        try {
            cdb.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Funcoes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String insertData = "INSERT INTO usuario(nome, email, telefone) VALUES (?,?,?);";
        
        PreparedStatement preparedStatement = cdb.criarPreparedStatement(insertData);
        
        try {
            preparedStatement.setString(1, this.getNome());
            preparedStatement.setString(2, this.getEmail());
            preparedStatement.setString(3, this.getTelefone());
            
            int result = preparedStatement.executeUpdate();
            
            if(result == 1){
                System.out.println("Usuário Cadastrado com Sucesso!");
                return true;
            }else{
                System.out.println("Erro ao adicionar o Usuário");
                return false;
            }
            
        } catch (SQLException e) {
            System.out.println("Ocorreu um erro ao adicionar o cliente! Detalhes: "+e);
            return false;
        }finally{
            if(preparedStatement != null){
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Funcoes.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            cdb.desconectar();
        }
    }
    
    public List<Funcoes> ver(){
        List<Funcoes> listUser = new ArrayList<>();
        
        ResultSet resultSet;
        Statement statement;
        
        try {
            cdb.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Funcoes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String query = "SELECT * FROM usuario";
        
        statement = cdb.criarStatement();
        
        try{
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                Funcoes fc = new Funcoes();
                fc.setId(resultSet.getInt("id"));
                fc.setNome(resultSet.getString("nome"));
                fc.setEmail(resultSet.getString("email"));
                fc.setTelefone(resultSet.getString("telefone"));
                listUser.add(fc);
            }
        }catch(SQLException ex){
            System.out.println("Erro ao visualizar usuario!");
        }finally{
            cdb.desconectar();
        }
        return listUser;
    }
    
    public boolean apagar(Integer id){
        try {
            cdb.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Funcoes.class.getName()).log(Level.SEVERE, null, ex);
        }

        PreparedStatement preparedStatement = null;

        String sqlDelete = "DELETE FROM usuario"
                + " WHERE id = ?;";

        try {
            preparedStatement = cdb.criarPreparedStatement(sqlDelete);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();

            System.out.println("Apagado com Sucesso!");
            return true;

        } catch (SQLException e) {
            System.out.println("Ocorreu um erro ao apagar o usuario. Detalhes do erro: " + e);
            return false;
        } finally {
            try {
                preparedStatement.close();
                cdb.desconectar();
            } catch (SQLException ex) {
                System.out.println("Ocorreu um erro ao apagar o usuario. Detalhes do erro: " + ex);
                return false;
            }
        }
    }
    
    public boolean atualizar(String id){
        try {
            cdb.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Funcoes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        PreparedStatement attpreparedStatement = null;
        
        String MDsql = "UPDATE usuario"
                + " SET "
                + " nome = ?,"
                + " email = ?,"
                + " telefone = ?"
                + " WHERE id = ?";
        
        try {
            attpreparedStatement = cdb.criarPreparedStatement(MDsql);
            attpreparedStatement.setString(1, this.getNome());
            attpreparedStatement.setString(2, this.getEmail());
            attpreparedStatement.setString(3, this.getTelefone());
            attpreparedStatement.setString(4, ""+id);
            attpreparedStatement.executeUpdate();
            
            return true;
            
        } catch (SQLException e) {
            System.err.println("Erro ao Alterar o Banco de Dados!" + e);
            return false;
        }finally{
            try {
                attpreparedStatement.close();
                cdb.desconectar();
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
    }
}
