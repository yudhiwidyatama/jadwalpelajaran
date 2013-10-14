function TimeStruct() {
  this.mulaimenit = 0;
  this.mulaijam = 0;
  this.sampaimenit = 0;
  this.sampaijam = 0;
}
TimeStruct.prototype.normalize = function() {
  if (this.mulaimenit > 60)
  {
    this.mulaijam = this.mulaijam + 1;
    this.mulaimenit = this.mulaimenit - 60;
  }
  if (this.sampaimenit > 60)
  {
    this.sampaijam = this.sampaijam + 1;
    this.sampaimenit = this.sampaimenit - 60;
  }

}

function twodigits(n)
{
  if (n>9) return "" + n;
  return "0" + n;
}
TimeStruct.prototype.asString = function ()
{
  return twodigits(this.mulaijam) + ":" +
    twodigits(this.mulaimenit) + " .. " +
    twodigits(this.sampaijam) + ":" +
    twodigits(this.sampaimenit);
}
module.exports = TimeStruct;
