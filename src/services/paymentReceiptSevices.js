// const sqlimport ("mssql/msnodesqlv8");
const sql = require("mssql");
const config = require("../configs/configDataBase");
const insertPaymentForm = async (MaPhieuTN, SDT, Email, SoTienThu) => {
  try {
    // let hashPassStaff = hashPassword(MatKhau);
    const poolConnection = await sql.connect(config);
    let data = await poolConnection.query(
      `exec sp_insert_receipt '${MaPhieuTN}','${SDT}','${Email}','${SoTienThu}' `
    );
    poolConnection.close();
    if (data) {
      return {
        EM: "Lập phiếu  thu tiền  thành công!",
        EC: 1,
      };
    } else {
      return {
        EM: "Lập  phiếu thu tiền không thành công!",
        EC: 0,
      };
    }
  } catch (error) {
    console.log("Tạo mới phiếu thu tiền  lỗi : " + error);
    return {
      EM: "Tạo mới phiếu thu tiền không thành công!",
      EC: -1,
      DT: "",
    };
  }
};
const getInfoById = async (MaCX) => {
  try {
    const poolConnection = await sql.connect(config);
    const data = await poolConnection
      .request()
      .query(`exec sp_getInfo_receipt '${MaCX}'`);
    poolConnection.close();
    console.log(data);
    if (data) {
      return {
        EM: "Lấy Thông Tin thành công!",
        EC: 1,
        DT: data.recordset,
      };
    } else {
      return {
        EM: "Lấy thông tin không thành công!",
        EC: 0,
        DT: [],
      };
    }
  } catch (error) {
    console.log("Lấy thông tin bị lỗi: " + error);
    return {
      EM: "Lấy thông tin không thành công ",
      EC: -1,
      DT: "",
    };
  }
};
const updateMoney = async (id, SoTienThu) => {
  try {
    const poolConnection = await sql.connect(config);
    let data = await poolConnection.query(
      `exec sp_update_money_receipt ${id}, '${SoTienThu}'`
    );
    poolConnection.close();

    console.log(data);
    if (data) {
      return {
        EM: "Cập Nhật Thành Công!",
        EC: 1,
        DT: "",
      };
    }
  } catch (error) {
    console.log("Update product error", error.originalError.info.message);
    return {
      EM: error,
      EC: -1,
      DT: "",
    };
  }
};
module.exports = {
  insertPaymentForm,
  getInfoById,
  updateMoney,
};
