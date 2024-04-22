import <zlib.ash>;

//VARIABLES YOU CAN TOUCH
string makesuper = yes; //makes ooze-o if you can
string makeoil = yes; //makes oil if you can
string makewad = yes; //makes sewer wads if you can 
string makedump = yes; //makes the sewer wad
string makegator = yes; //makes the umbrella
string buyfrommall = yes; //buys the items from mall

//DO NOT TOUCH, non-variable variables
int sewerneed = 10; //variable for minimum of unfortunate dumplings that are needed
int ooil = 30; //variable for minimum of oil of oiliness that are needed (need to have 3x)
string fcolor;


void gear() {

foreach pullitems in $items[unfortunate dumplings,
gatorskin umbrella, 
sewer wad, 
bottle of Ooze-O,
oil of oiliness,
]
{
if( storage_amount( pullitems ) > 0 || item_amount( pullitems ) > 0 || closet_amount( pullitems ) > 0){

  if(closet_amount( pullitems ) > 9){
  string fcolor = "<font color=green>";
  } else {
    string fcolor = "<font color=red>";
  }
  
  if(storage_amount( pullitems ) > 9){
  string fcolor = "<font color=green>";
  } else {
    string fcolor = "<font color=red>";
  }
  
  if( storage_amount( pullitems ) > 0 || closet_amount( pullitems ) > 0){
  print_html("Of "+pullitems+"s: you have <b>"+fcolor+closet_amount( pullitems )+"</font></b> in your closet and <b>"+storage_amount( pullitems )+"</font></b> in Hagnk's!");
  if( closet_amount( pullitems ) > 0) {
  take_closet(closet_amount( pullitems ), pullitems);
  print("Pulled from closet!!!","green");
  }
  if( storage_amount( pullitems ) > 0) {
  take_storage(storage_amount( pullitems ), pullitems);
  print("Pulled from storage!!!","green"); 
  }
  } else {
  
  }
  
  } else {
print("You have no "+pullitems+", make sure you buy at least 10 of each and 30 of Oil!","red");
}
//print("~~~~~~~","blue");
  if(pullitems == $item[oil of oiliness]){
  sewerneed = ooil;
  } 
if(item_amount( pullitems ) < sewerneed){
  int sewerneedmin = sewerneed - item_amount( pullitems );
//print("You don't have enouh of "+pullitems+" in your inventory to do the tests:","red");
print_html("You have <b><font color=red>"+item_amount( pullitems )+"</font></b> in your inventory and you need to get <b><font color=orange>"+sewerneedmin+"</font></b>  more of "+pullitems+"!");
} else {
 print("You have "+item_amount( pullitems )+" "+pullitems+" in your inventory! That should be enough!","green");
} 


  if(pullitems != $item[oil of oiliness]){
print_html("<font color=blue>~~~~~~~~~~~~~~~~~~~~~</font><br>");
} 
}
}

void main() {

        print( "Checking grates" );
        matcher grates = create_matcher("\w <.+>([0-9]+)<.+> sewer grates \w",visit_url("clan_raidlogs.php"));
        int gratesopen;

    if (find(grates)) {
     gratesopen = group(grates,1).to_int();
    }

  gear();
}

