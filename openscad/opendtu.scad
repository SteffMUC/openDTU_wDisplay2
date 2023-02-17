

$fn=100;


//#translate([0,0,7])opendtu_pcb(); // rough model for pcb w esp32+nrf+display

//case_body();
//
rotate([0,180,0]) 
    case_top();



module case_body() {

//------------------------stamps for pcb
//bottom right
translate([90.5,4.5,2]) scale([1,1,1]) cylinder(h=19, d=3, center=false);
translate([90.5,4.5,2]) scale([1,1,1]) cylinder(h=15.5, d=8, center=false);
//top right
translate([90.5,25,2]) scale([1,1,1]) cylinder(h=19, d=3, center=false);
translate([90.5,25,2]) scale([1,1,1]) cylinder(h=15.5, d=8, center=false);
//top left
translate([4.5,25,2]) scale([1,1,1]) cylinder(h=19, d=3, center=false);
translate([4.5,25,2]) scale([1,1,1]) cylinder(h=15.5, d=8, center=false);
//bottom left
translate([4.5,4.5,2]) scale([1,1,1]) cylinder(h=19, d=3, center=false);
translate([4.5,4.5,2]) scale([1,1,1]) cylinder(h=15.5, d=8, center=false);


//------------------------case body (+6)
rotate([0,90,0]) translate([-35,-4,50]) cylinder(h=10,d=2,center=false);
rotate([0,90,0]) translate([-35,33,50]) cylinder(h=10,d=2,center=false);
difference() {
    translate([-4,-6,0]) roundedcube(107,41,36,4);
    translate([-2,-4,2]) roundedcube(82,37,36,4);
    translate([-2,-4,10]) roundedcube(103,37,36,4);
    translate([81.5,8.5,-0.5]) roundedcube(50,12,8,4);
    rotate([90,0,90])translate([10,1.5,80]) roundedcube(10,5,3,1);
    //translate([65,-6.5,2]) roundedcube(27.5,3,30,2);// debug
    translate([30,5,-0.5]) roundedcube(3,20,30,2);// cutout esp32
    translate([40,5,-0.5]) roundedcube(3,20,30,2);// cutout esp32
    translate([50,5,-0.5]) roundedcube(3,20,30,2);// cutout esp32
}

}

module case_top() {

//------------------------case top (leave 1mm gap to body)
difference() {
    translate([-1.5,-3.5,2]) roundedcube(102,36,32,4); 
    translate([0.5,-1.5,1.5]) cube([98,32,30.5]); 
    //translate([-2,-4,1.5]) roundedcube(110,60,30.5,4); //debug needs commented
    translate([10,1,8]) roundedcube(16,27.5,30,4);// cutout display
    //translate([15,10,2]) roundedcube(27.5,3,30,2);// cutout esp32 + nrf
    //translate([15,20,2]) roundedcube(27.5,3,30,2);
    //translate([15,30,2]) roundedcube(27.5,3,30,2);
    //translate([15,40,2]) roundedcube(27.5,3,30,2);
    translate([76,-5,1.5])cube([32,60,23.5]); //cutout usb
    //translate([103,-5,1.5])cube([32,60,23.5]); //debug cutout needs to be commented

    //translate([56,26,-5]) scale([1,1,1]) cylinder(h=20, d=17, center=true);
}

//------------------------case top, frame for display
/*difference() {
    translate([59-2.5/2,13.5+9-2,22.7]) roundedcube(30,20,4,4); 
    translate([59,13.5+9,22]) roundedcube(27.5,16,30,4);// cutout display
}*/

//------------------------stamps for case top
//bottom right
difference() {
    translate([90,5,19]) scale([1,1,1]) cylinder(h=14, d=8, center=false);
    translate([90,5,2]) scale([1,1,1]) cylinder(h=20, d=4, center=false);
}
//top right
difference() {
    translate([90,25,19]) scale([1,1,1]) cylinder(h=14, d=8, center=false);
    translate([90,25,2]) scale([1,1,1]) cylinder(h=20, d=4, center=false);
}
//top left
difference() {
    translate([5,25,19]) scale([1,1,1]) cylinder(h=14, d=8, center=false);
    translate([5,25,2]) scale([1,1,1]) cylinder(h=20, d=4, center=false);
}
//bottom left
difference() {
    translate([5,5,19]) scale([1,1,1]) cylinder(h=14, d=8, center=false);
    translate([5,5,2]) scale([1,1,1]) cylinder(h=20, d=4, center=false);
}

}


module opendtu_pcb() {
    translate([-90,100,11]) scale([1000,1000,1000]) import("openDTU_wDisplay.stl"/*, convexity=3*/);
    /*
    //esp32
    translate([10,-4,2])cube([28,55,14]);
    translate([20.5,-5,14])cube([8,6,3]);*/
    //nrf
    translate([57,6,11.5])cube([30,15,14]);
    //display
    translate([8,1,11.5])cube([27.5,27.5,13.5]);
    //translate([59,13.5+9,2])cube([27.5,16,17]);
    /*difference(){*/
        //cube([96,31,2]); //pcb
        /*//bottom left
        translate([2.5+2.25,2.5+2.25,-0.5]) cylinder(h=10,d=4.5,center=false); 
        //bottom right
        translate([2.5+99-2.25,2.5+2.25,-0.5]) cylinder(h=10,d=4.5,center=true);
        //top left
        translate([2.5+2.25,2.5+45-2.25,-0.5]) cylinder(h=10,d=4.5,center=false);
        //top right
        translate([2.5+99-2.25,2.5+45-2.25,-0.5]) cylinder(h=10,d=4.5,center=true);

    }*/
}


module roundedcube(xx, yy, height, radius) {

difference(){

    cube([xx,yy,height]);

    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
    translate([xx,0,0])
    rotate(90)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([xx,yy,0])
    rotate(180)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([0,yy,0])
    rotate(270)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
}
}