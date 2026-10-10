/* Gelenkarm V1.1: universelles Winkelgelenk, mm.
30 mm langer / 10 mm kurzer Schenkel BIS ZUM ZINKENANSATZ.
Beide Enden desselben Teils passen ineinander (2er/3er Gabel).
*/
$fn=64;
lang_bis_zinken=30;
kurz_bis_zinken=10;
breite_schenkel=12;
gelenk_breite=20;
zinken_laenge=16;
loch_d=5.3;
spiel=0.45;
zinken_3_dicke=3.6;
zinken_2_dicke=3.7;
module zinken_rechts(h) {
  linear_extrude(height=h) hull() {
    translate([kurz_bis_zinken-0.1,0]) square([0.2,breite_schenkel]);
    translate([kurz_bis_zinken+zinken_laenge-breite_schenkel/2,breite_schenkel/2])
      circle(d=breite_schenkel);
  }
}
module zinken_oben(h) {
  linear_extrude(height=h) hull() {
    translate([0,lang_bis_zinken-0.1]) square([breite_schenkel,0.2]);
    translate([breite_schenkel/2,lang_bis_zinken+zinken_laenge-breite_schenkel/2])
      circle(d=breite_schenkel);
  }
}
difference() {
  union() {
    linear_extrude(height=gelenk_breite)
      union(){square([breite_schenkel,lang_bis_zinken]);
              square([kurz_bis_zinken,breite_schenkel]);}
    for(z=[0,8.2,16.4]) translate([0,0,z]) zinken_rechts(zinken_3_dicke);
    for(z=[3.6+spiel,12.0+spiel]) translate([0,0,z]) zinken_oben(zinken_2_dicke);
  }
  translate([kurz_bis_zinken+zinken_laenge-breite_schenkel/2,breite_schenkel/2,-1])
    cylinder(d=loch_d,h=gelenk_breite+2);
  translate([breite_schenkel/2,lang_bis_zinken+zinken_laenge-breite_schenkel/2,-1])
    cylinder(d=loch_d,h=gelenk_breite+2);
}
