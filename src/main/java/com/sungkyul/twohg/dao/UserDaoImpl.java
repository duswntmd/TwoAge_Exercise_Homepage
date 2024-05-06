package com.sungkyul.twohg.dao;

import com.sungkyul.twohg.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.Date;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    DataSource ds;

    @Override
    public int deleteUser(String id, String name, String pwd) throws Exception {
        int rowCnt = 0;
        String sql = "DELETE FROM user_info WHERE id= ? AND name = ? AND pwd = ?";

        try (  // try-with-resources - since jdk7
               Connection conn = ds.getConnection();
               PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, pwd);
            return pstmt.executeUpdate(); //  insert, delete, update
//      } catch (Exception e) {
//          e.printStackTrace();
//          throw e;
        }
    }

    @Override
    public User selectUser(String id) throws Exception {
        User user = null;
        String sql = "SELECT * FROM user_info WHERE id= ? ";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);

        ){
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery(); //  select

            if (rs.next()) {
                user = new User();
                user.setId(rs.getString(1));
                user.setPwd(rs.getString(2));
                user.setName(rs.getString(3));
                user.setEmail(rs.getString(4));
//                user.setBirth(new Date(rs.getDate(5).getTime()));
                user.setSns(rs.getString(5));
//                user.setReg_date(new Date(rs.getTimestamp(7).getTime()));
            }
        }

        return user;
    }


    // 사용자 정보를 user_info테이블에 저장하는 메서드
    @Override
    public int insertUser(User user) throws Exception {
        int rowCnt = 0;
        String sql = "INSERT INTO user_info VALUES (?,?,?,?,?,?, now()) ";

        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
        ){
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPwd());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getEmail());
//            pstmt.setDate(5, new java.sql.Date(user.getBirth().getTime()));  //text사용할떄
            pstmt.setTimestamp(5, new java.sql.Timestamp(user.getBirth().getTime()));
            pstmt.setString(6, user.getSns());

            return pstmt.executeUpdate();
        }
    }

    @Override
    public int updateUser(User user) throws Exception {
        int rowCnt = 0;

        String sql = "UPDATE user_info " +
                "SET pwd = ?, name=?, email=?, birth =?, sns=?, reg_date=? " +
                "WHERE id = ?";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, user.getPwd());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            if (user.getBirth() != null) {
                pstmt.setDate(4, new java.sql.Date(user.getBirth().getTime()));
            } else {
                pstmt.setNull(4, Types.DATE); // 생년월일이 null이면 데이터베이스에 null로 저장
            }
            pstmt.setString(5, user.getSns());
            if (user.getReg_date() != null) {
                pstmt.setTimestamp(6, new java.sql.Timestamp(user.getReg_date().getTime())); // Use setTimestamp for reg_date
            } else {
                pstmt.setNull(6, Types.TIMESTAMP); // 등록일이 null이면 데이터베이스에 null로 저장
            }
            pstmt.setString(7, user.getId());

            rowCnt = pstmt.executeUpdate();
        }

        return rowCnt;
    }


    @Override
    public User getUserById(String id, String name, String pwd) throws Exception {
        User user = null;
        String sql = "SELECT * FROM user_info WHERE id= ? AND name = ? AND pwd = ?";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, pwd);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {

                    user = new User();
                    user.setId(rs.getString("id"));
                    user.setPwd(rs.getString("pwd"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setBirth(rs.getDate("birth"));
                    user.setReg_date(rs.getTimestamp("reg_date"));
                }
            }
        }
        return user;
    }

    @Override
    public int count() throws Exception {
        String sql = "SELECT count(*) FROM user_info ";

        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
        ){
            rs.next();
            int result = rs.getInt(1);

            return result;
        }
    }

    @Override
    public void deleteAll() throws Exception {
        try (Connection conn = ds.getConnection();)
        {
            String sql = "DELETE FROM user_info ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        }
    }
    // 중복체크
    @Override
    public boolean isIdDuplicate(String id) throws Exception {
        String sql = "SELECT COUNT(*) FROM user_info WHERE id = ?";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            return count > 0;
        }
    }

    // 아이디찾기
    @Override
    public String findIdByEmailAndName(String email, String name) throws Exception {
        String sql = "SELECT id FROM user_info WHERE email = ? AND name = ?";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, email);
            pstmt.setString(2, name);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("id"); // 해당 이메일과 이름에 대한 아이디 반환
            } else {
                return null; // 해당하는 사용자가 없을 경우 null 반환
            }
        }
    }

    // 비밀번호찾기
    @Override
    public String findPasswordByEmailAndId(String email, String id) throws Exception {
        String sql = "SELECT pwd FROM user_info WHERE email = ? AND id = ?";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, email);
            pstmt.setString(2, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("pwd"); // 해당 이메일과 아이디에 대한 비밀번호 반환
            } else {
                return null; // 해당하는 사용자가 없을 경우 null 반환
            }
        }
    }

}