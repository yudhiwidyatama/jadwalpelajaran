exports.models = function(sequelize,Sequelize)
{
  m = new Object;
  //var Jadwal = sequelize.define('jadwal',{

  //});
  var Aktivitas = sequelize.define('Aktivitas',{
    kategori: Sequelize.INTEGER,
    nama: Sequelize.STRING(45),
    zzz: Sequelize.INTEGER
  });
  var Waktu = sequelize.define('Waktu',{
    mulaijam: Sequelize.INTEGER,
    mulaimenit: Sequelize.INTEGER,
    jenis: Sequelize.STRING(1),
    interval: Sequelize.INTEGER
  });
  var Hari = sequelize.define('Hari',{
    nama: Sequelize.STRING(45),
    kode: Sequelize.STRING(45),
  });
  var Jadwal = sequelize.define('Jadwal',{

  },
  {
    instanceMethods: {
      acceptTime: function (timeStruct) {
         if (this.waktu.jenis == "S") {
           timeStruct.mulaijam = this.waktu.mulaijam;
           timeStruct.mulaimenit = this.waktu.mulaimenit;
           timeStruct.sampaijam = this.waktu.mulaijam;
           timeStruct.sampaimenit = this.waktu.mulaimenit + this.waktu.interval;
           timeStruct.normalize();
         } else if (this.waktu.jenis == "I") {
           timeStruct.mulaijam = timeStruct.sampaijam;
           timeStruct.mulaimenit = timeStruct.sampaimenit;
           timeStruct.sampaijam = timeStruct.mulaijam;
           timeStruct.sampaimenit = timeStruct.mulaimenit + this.waktu.interval;
           timeStruct.normalize();
         }

      }
    },
    getterMethods: {
      f1: function() { return "f1";}
    }
  });
  Jadwal.belongsTo(Hari);
  Jadwal.belongsTo(Aktivitas);
  Jadwal.belongsTo(Waktu);

  m.Aktivitas = Aktivitas;
  m.Jadwal = Jadwal;
  m.Hari = Hari;
  m.Waktu = Waktu;
  return m;
}
