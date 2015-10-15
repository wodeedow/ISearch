package shu.mike.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilDAO extends BaseDAO {

	public boolean IsTempUserChecked(String temp_user_id, String validateCode)
			throws SQLException// Registered users determine whether illegal
			, ParseException {
		initConnection();
		if (connection != null) {
			String sqlString = "select * from temp_user_info where id=" + "'"
					+ temp_user_id + "'";
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sqlString);
			if (rs.next() != false) {
				String validateCodeByDB = rs.getString(8);// get the salt which
															// is stored in db
				String deadLineByDB = rs.getString(9);
				if (validateCodeByDB.equals(validateCode))// test validate
				{
					SimpleDateFormat dateFormat = new SimpleDateFormat(
							"yyyy-MM-dd hh:mm:ss");
					Date deadLine = dateFormat.parse(deadLineByDB);
					if (!deadLine.after(new Date()))// test if the deadLine from
													// db is after now?
					{
						return false;
					} else {
						String IDByDB = rs.getString(1);
						String ContactIDByDB = rs.getString(2);
						String ContactInfoByDB = rs.getString(3);
						boolean SexByDB = rs.getBoolean(4);
						String SchoolByDB = rs.getString(5);
						String SaltByDB = rs.getString(6);
						String PasswordByDB = rs.getString(7);
//						UserDAO.addStandardUser(IDByDB, ContactIDByDB,
//								ContactInfoByDB, SexByDB, SchoolByDB,
//								DateUtil.getDateNowInFormatString(),
//								DateUtil.getDateNowInFormatString(), SaltByDB,
//								PasswordByDB);
//						TempUserDAO.deleteTempUser(IDByDB);
						closeConnection();
						return true;
					}
				}
			} else {
				closeConnection();
				return false;
			}

		}
		closeConnection();
		return false;
	}

}
