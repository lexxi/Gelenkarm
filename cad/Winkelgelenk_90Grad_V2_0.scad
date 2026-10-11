/* Gelenkarm V2.0 -- 90 Grad versetzte Gabelachsen.
   Konstruktiver Fix: durchgehend 6 mm starker Rueckensteg der 3er-Gabel.
   Alle drei Zinken sind eine Einheit mit dem Steg. Keine verdeckte Rueckwand
   in den beiden Gabelschlitzen.
*/
$fn=72;
lang_bis_zinken=30;
kurz_bis_zinken=10;
zinken_laenge=16;
arm_breite=12;
gelenk_paket=20;
zusatz_breite_2er=4; // 2 mm je Seite
loch_d=5.3;
zinken_dicke=3.6;
// Finger der 3er-Gabel, entlang der Z-Achse aufgeteilt:
z3=[0,8.2,16.4];
// Finger der 2er-Gabel, entlang X aufgeteilt:
z2=[4.1,12.3];
// Durchgehender massiver Verbindungssteg (X=0..6 mm):
steg_laenge=6;
// Spitze und Bohrungsmittelpunkt (X=20 mm):
loch_mitte_x=kurz_bis_zinken+zinken_laenge-arm_breite/2;
loch_mitte_y=arm_breite/2;

module zinken_3() {
    for (z=z3) translate([0,0,z])
        linear_extrude(height=zinken_dicke)
            hull() {
                // 6 mm tiefe Materialanbindung an den massiven Steg
                translate([steg_laenge-0.3,0]) square([0.3,arm_breite]);
                translate([loch_mitte_x,loch_mitte_y]) circle(d=arm_breite);
            }
}

module zinken_2() {
    for (x=z2) translate([x,0,0])
        rotate([0,90,0])
            linear_extrude(height=zinken_dicke)
                hull() {
                    translate([-16,lang_bis_zinken-0.2]) square([12,0.3]);
                    translate([-10,lang_bis_zinken+zinken_laenge-6]) circle(d=12);
                }
}

module gelenk() {
    difference() {
        union() {
            // 90 Grad Winkel-Grundkoerper, lange Seite fuer 2er Gabel
            translate([-zusatz_breite_2er/2,0,4])
                cube([gelenk_paket+zusatz_breite_2er,lang_bis_zinken,arm_breite]);
            // 3er Gabel hat ein VOLLSTAENDIGES massives 6-mm Rueckgrat
            cube([steg_laenge,arm_breite,gelenk_paket]);
            zinken_3();
            zinken_2();
        }
        // Zwei offene Schlitze: auch durch den sich kreuzenden Grundkoerper
        // schneiden, sonst bleibt innen eine zu hohe Wand stehen.
        for (i=[0:1]) {
            translate([steg_laenge, -0.25, z3[i]+zinken_dicke])
                cube([loch_mitte_x+arm_breite/2-steg_laenge+1,
                      arm_breite+0.5,
                      z3[i+1]-z3[i]-zinken_dicke]);
        }
        translate([loch_mitte_x,loch_mitte_y,-1])
            cylinder(d=loch_d,h=gelenk_paket+2);
        translate([-1,lang_bis_zinken+zinken_laenge-arm_breite/2,10])
            rotate([0,90,0]) cylinder(d=loch_d,h=gelenk_paket+2);
    }
}
gelenk();
