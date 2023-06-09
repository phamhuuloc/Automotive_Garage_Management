const {
  addRepair,
  getInfoById,
  removeProduct,
  updateQuantity,
} = require("../services/repairFormServices");
const createRepair = async (req, res) => {
  try {
    const data = await addRepair(req);
    if (data && +data.EC == 1) {
      return res.status(201).json({
        Em: data.EM,
        EC: 1,
        DT: "",
      });
    } else if (data && +data.EC != 1) {
      return res.status(201).json({
        EM: data.EM,
        EC: data.EC,
      });
    }
  } catch (error) {
    console.log("Error:" + error);
    return res.status(500).json({
      EM: "Server Error: Thêm  phiếu sửa chữa thất bại!",
    });
  }
};
const getInfoFormRepair = async (req, res) => {
  try {
    const MaTN = req.body.MaTN;
    console.log(MaTN);
    const data = await getInfoById(MaTN);
    if (data && +data.EC === 1) {
      return res.status(200).json({
        EM: data.EM,
        EC: data.EC,
        DT: data.DT,
      });
    }
    if (data && +data.EC != 1) {
      return res.status(500).json({
        EM: data.EM,
        EC: data.EC,
        DT: data.DT,
      });
    }
  } catch (eror) {
    console.log(error);
    return res.status(500).json({
      EM: "Server Error : Lấy thông tin chi tiết phiếu tiếp nhận thất bại!",
      EC: -1,
      DT: "",
    });
  }
};
const deleteProduct = async (req, res) => {
  try {
    await removeProduct(req.params.id);
    return res.status(203).json({
      EM: "Xóa Thành Công!",
      EC: 1,
      DT: "",
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      EM: "Error from server",
      EC: -1,
      DT: "",
    });
  }
};
const updateProduct = async (req, res) => {
  const id = req.params.id;
  try {
    const data = await updateQuantity(id, req.body.MaVTPT, req.body.quantity);
    console.log(data);
    if (data.EC != -1) {
      return res.status(200).json({
        EM: "Cập Nhật Thành Công",
        EC: 1,
        DT: "",
      });
    } else {
      return res.status(200).json({
        EM: data.EM,
        EC: data.EC,
        DT: "",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      EM: "Error from server",
      EC: -1,
      DT: "",
    });
  }
};

module.exports = {
  createRepair,
  getInfoFormRepair,
  deleteProduct,
  updateProduct,
};
