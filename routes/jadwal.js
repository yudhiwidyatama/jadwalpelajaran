var TimeStruct = require('../timestruct');
exports.list = function(req, res){
  var timeStruct = new TimeStruct();
  var m = req.app.get('models');
  m.Jadwal.findAll({include: [m.Hari, m.Waktu, m.Aktivitas]}).success(function (listJadwal){
      console.log("count jadwal = "+ listJadwal.length + "\n");
    res.render('jadwal', { title: 'Jadwal pelajaran', 'listJadwal' : listJadwal, 'timeStruct' : timeStruct });

  });
};

exports.aktivitas = function(req,res){
  req.app.get('models').Aktivitas.findAll().success(function (listAktivitas){
    console.log("count aktivitas = " + listAktivitas.length + "\n");
    res.render('aktivitas', { title: 'Express', 'listAktivitas': listAktivitas});
  });

}


