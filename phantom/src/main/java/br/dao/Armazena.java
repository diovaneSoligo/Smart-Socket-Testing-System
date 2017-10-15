/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.dao;

import br.conectaBD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

/**
 *
 * @author DioS
 */
public class Armazena {

    public static void aramzenaDado(String id, String dado, String data, String tabela,Connection c) {
        PreparedStatement stmt = null;
        try {
            String sql = "insert into "+tabela+" (id_disp,dado,data) values (?,?,?);";
            stmt = c.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, dado);
            stmt.setString(3, data);
            stmt.execute();
            stmt.close();
            System.out.println("Dados "+tabela+" cadastrados...");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERRO ao cadastrar dados");
        }
    }
}
/*
create table temperatura(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);
create table umidade(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);
create table voltagem(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);
create table corrente(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);
create table potencia(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);
create table status(
	id_dado serial,
    id_disp varchar(10),
    dado varchar(10),
    data varchar(50),
    primary key (id_dado)
);


select v.data, v.dado voltagem, c.dado corrente, p.dado potencia, u.dado umidade, t.dado temperatura
from voltagem v inner join corrente c on v.data = c.data
inner join potencia p on p.data = c.data
inner join umidade u on u.data = c.data
inner join temperatura t on t.data = c.data
order by c.data;


*/
