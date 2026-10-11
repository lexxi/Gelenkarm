/* Gelenkarm V1.6 -- 90 Grad versetzte Gabelachsen.
   Zwei 45-Grad-Fasen (2 x 2 mm) an der Kontaktkante
   der langen Koerperseite direkt neben der 3er-Gabel.
*/
$fn=72;
lang_bis_zinken=30;
kurz_bis_zinken=10;
zinken_laenge=16;
arm_breite=12;
gelenk_paket=20;
loch_d=5.3;
zinken_dicke=3.6;
z3=[0,8.2,16.4];
z2=[4.1,12.3];
steg_laenge=6;
fase=2;
loch_mitte_x=kurz_bis_zinken+zinken_laenge-arm_breite/2;
loch_mitte_y=arm_breite/2;
module zinken_3() {
    for (z=z3) translate([0,0,z])
        linear_extrude(height=zinken_dicke)
            hull() {
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
// Dreieckiger Schneidkeil entlang der X-Achse.
// y-z Punkte bilden einen 45-Grad-Querschnitt.
module dreieck_prisma(yz) {
    x0=steg_laenge; x1=gelenk_paket+0.2;
    polyhedron(
        points=[for (x=[x0,x1], p=yz) [x,p[0],p[1]]],
        faces=[[0,2,1],[3,4,5],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
    );
}
module fasen_kontakt() {
    dreieck_prisma([[arm_breite,4-0.02],
                     [arm_breite+fase,4-0.02],
                     [arm_breite,4+fase]]);
    dreieck_prisma([[arm_breite,4+arm_breite+0.02],
                     [arm_breite+fase,4+arm_breite+0.02],
                     [arm_breite,4+arm_breite-fase]]);
}
module gelenk() {
    difference() {
        union() {
            translate([0,0,4]) cube([gelenk_paket,lang_bis_zinken,arm_breite]);
            cube([steg_laenge,arm_breite,gelenk_paket]);
            zinken_3();
            zinken_2();
        }
        fasen_kontakt();
        for (i=[0:1]) {
            translate([steg_laenge,-0.25,z3[i]+zinken_dicke])
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
