/* Gelenkarm V1.2: Winkelgelenk mit rechtwinkligen Achsen, mm */
$fn=72;
lang_bis_zinken=30;
kurz_bis_zinken=10;
zinken_laenge=16;
arm_breite=12;
gelenk_paket=20;
loch_d=5.3;
zinken_dicke_3=3.6;
zinken_dicke_2=3.6;
spalt_toleranz=0.5;
z3=[0,8.2,16.4];
z2=[4.1,12.3];

// Drei Finger mit Lochachse Z
module gabel_finger_rechts() {
    for (z=z3) translate([0,0,z])
        linear_extrude(height=zinken_dicke_3)
            hull() {
                translate([kurz_bis_zinken-0.2,0]) square([0.3,arm_breite]);
                translate([kurz_bis_zinken+zinken_laenge-arm_breite/2,arm_breite/2])
                    circle(d=arm_breite);
            }
}
// Zwei Finger mit Lochachse X, genau 90 Grad zur ersten
module gabel_finger_oben() {
    for (x=z2) translate([x,0,0])
        rotate([0,90,0])
            linear_extrude(height=zinken_dicke_2)
                hull() {
                    translate([-16,lang_bis_zinken-0.2]) square([12,0.3]);
                    translate([-10,lang_bis_zinken+zinken_laenge-6]) circle(d=12);
                }
}
module gelenk() {
    difference() {
        union() {
            translate([0,0,4]) cube([gelenk_paket,lang_bis_zinken,arm_breite]);
            cube([kurz_bis_zinken,arm_breite,gelenk_paket]);
            gabel_finger_rechts();
            gabel_finger_oben();
        }
        translate([kurz_bis_zinken+zinken_laenge-arm_breite/2,arm_breite/2,-1])
            cylinder(d=loch_d,h=gelenk_paket+2);
        translate([-1,lang_bis_zinken+zinken_laenge-arm_breite/2,10])
            rotate([0,90,0]) cylinder(d=loch_d,h=gelenk_paket+2);
    }
}
gelenk();
