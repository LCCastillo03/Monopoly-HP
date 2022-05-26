import java.util.Random;
import java.util.Scanner;
Scanner input = new Scanner(System.in);
ArrayList<int[]> fields = new ArrayList<int[]>();

ArrayList<String[]> arrFortuna = new ArrayList<String[]>();

int[] intArray = new int[5];

PGraphics board;
PFont dadosTXT;
PShape square;
boolean verificarPasar1 = true;
boolean verificarPasar2 = true;
boolean verificarPasar3 = true;
boolean verificarPasar4 = true;
String fototemp, dueñotemp, line, suertetemp, k;
boolean tienesalidagratis1, tienesalidagratis2, tienesalidagratis3, tienesalidagratis4;

//-----------------Imagenes----------------//
PImage monopolyHP;
PImage menu, carta, decision, cartafortuna, cartacomunal;
PImage jugador_1;
PImage jugador_2;
PImage jugador_3;
PImage jugador_4;
//-----------------------------------------//

int i=0, repetirj1, repetirj2, a;
boolean check;
boolean  comprarttt, tomado;
int diosmio;
String name = "Tire los dados";
int cont_1 = 0;
int cont_2 = 0;

//--------Turnos-------//
int nojoñe = 0;
boolean nojoñe_2 = true;
boolean nojoñe_3 = true;
boolean nojoñe_4 = true;
int empieza_2 = 1;
int empieza_3 = 1;
int empieza_4 = 1;
int dados_1 = 0;
int dados_2 = 0;
int dados_3 = 0;
int dados_4 = 0;
int dados;
int dado1;
int dado2;
int dado3;
int dado4;
int p_1 = 0;
int p_2 = 0;
int p_3 = 0;
int p_4 = 0;
boolean dados_global = false;
boolean dados_global1 = true;
boolean dados_global2 = true;
boolean dados_global3 = true;
boolean dados_global4 = true;
boolean t_1 = false;
boolean t_2 = false;
boolean t_3 = false;
boolean t_4 = false;
int decidir = 0;
boolean jugar_3 = true;
boolean jugar_4 = true;
boolean turno_2_players = false;
boolean turno_3_players = false;
boolean turno_4_players = false;
//---------------------//

//----Variables jugador----//
int pos_l = 0;
int money1 = 1500;

int pos_a = 0;
int money2 = 1500;

int pos_j = 0;
int money3 = 1500;


int pos_k = 0;
int money4 = 1500;
//-------------------------//

int menujugar, menup;

public class CreateList {
  //Represents the node of list.
  public class Node {
    String propiedad;
    int renta;
    int rentaSet;
    int comprar;
    String dueño;
    String foto;



    Node next;
    public Node(String propiedad, int renta, int rentaSet, int comprar, String dueño, String foto) {
      this.propiedad=propiedad;
      this.renta = renta;
      this.rentaSet = rentaSet;
      this.comprar = comprar;
      this.dueño = dueño;
      this.foto=foto;
    }
  }

  //Declaring head and tail pointer as null.
  public Node head = null;
  public Node tail = null;
  public Node pos_j1 = null;
  public Node pos_j2 = null;
  public Node pos_j3 = null;
  public Node pos_j4 = null;

  //This function will add the new node at the end of the list.
  public void add(String propiedad, int renta, int rentaSet, int comprar, String dueño, String foto) {
    //Create new node
    Node newNode = new Node(propiedad, renta, rentaSet, comprar, dueño, foto);
    //Checks if the list is empty.
    if (head == null) {
      //If list is empty, both head and tail would point to new node.
      head = newNode;
      pos_j1= head;
      pos_j2= head;
      pos_j3= head;
      pos_j4= head;
      tail = newNode;
      newNode.next = head;
    } else {
      //tail will point to new node.
      tail.next = newNode;
      //New node will become new tail.
      tail = newNode;
      //Since, it is circular linked list tail will point to head.
      tail.next = head;
    }
  }

  //Displays all the nodes in the list
  public void display() {
    Node current = head;
    if (head == null) {
      System.out.println("List is empty");
    } else {
      System.out.println("Nodes of the circular linked list: ");
      do {
        //Prints each node by incrementing pointer.
        System.out.print(" --> "+ current.propiedad + " " +current.renta + " " +current.rentaSet + " " +current.comprar + " " +current.dueño + " "+ current.foto + " ");
        current = current.next;
      } while (current != head);
      System.out.println();
    }
  }

  //METODO PARA MOVERSE EN LA LISTA



  public void mover1(int dados) {
    //NOS UBICAMOS EN LA POSICION DE LA CASILLA
    while (i<dados && verificarPasar1 == true) {
      pos_j1= pos_j1.next;
      i++;
      if (pos_j1.propiedad=="GO") {
        money1= money1+200;
      } 
    }
    i=0;
    print(pos_j1.propiedad);
    suertetemp = pos_j1.propiedad;
    dueñotemp= pos_j1.dueño;
    fototemp= pos_j1.foto;

    if (pos_j1.dueño=="Jugador 2") {
      money1= money1-pos_j1.renta;
      money2= money2+pos_j1.renta;
    }
    if (pos_j1.dueño=="Jugador 3") {
      money1= money1-pos_j1.renta;
      money3= money3+pos_j1.renta;
    }
    if (pos_j1.dueño=="Jugador 4") {
      money1= money1-pos_j1.renta;
      money4= money4+pos_j1.renta;
    }
    if (pos_j1.propiedad=="Impuestos") {
      money1=money1-200;
    }
    if (pos_j1.propiedad=="Impuestos sobre varitas") {
      money1=money1-100;
    }
    
    if(money1<=0){
      for(i=0;i<=40;i++){
        pos_j1= pos_j1.next;
        if(pos_j1.dueño=="Jugador 1"){
          pos_j1.dueño="Nulo";
        }
      }
      t_1=false;
    }
    
    
  }



  public void mover2(int dados) {
    while (i<dados) {
      pos_j2= pos_j2.next;
      i++;
      if (pos_j2.propiedad=="GO") {
        money2= money2+200;
      }
    }
    i=0;
    print(pos_j2.propiedad);
    suertetemp = pos_j2.propiedad;
    dueñotemp= pos_j2.dueño;
    fototemp= pos_j2.foto;

    if (pos_j2.dueño=="Jugador 1") {
      money2= money2-pos_j2.renta;
      money1= money1+pos_j2.renta;
    }
    if (pos_j2.dueño=="Jugador 3") {
      money2= money2-pos_j2.renta;
      money3= money3+pos_j2.renta;
    }
    if (pos_j2.dueño=="Jugador 4") {
      money2= money2-pos_j2.renta;
      money4= money4+pos_j2.renta;
    }

    if (pos_j2.propiedad=="Impuestos") {
      money2=money2-200;
    }
    if (pos_j2.propiedad=="Impuestos sobre varitas") {
      money2=money2-100;
    }
    
    if(money2<=0){
      for(i=0;i<=40;i++){
        pos_j2= pos_j2.next;
        if(pos_j2.dueño=="Jugador 2"){
          pos_j2.dueño="Nulo";
        }
      }
      t_2=false;
    }
    
  }

  public void mover3(int dados) {

    while (i<dados && verificarPasar3 == true) {
      pos_j3= pos_j3.next;
      i++;
      if (pos_j3.propiedad=="GO") {
        money3= money3+200;
      }
    }
    i=0;
    print(pos_j3.propiedad);
    suertetemp = pos_j3.propiedad;
    dueñotemp= pos_j3.dueño;
    fototemp= pos_j3.foto;

    if (pos_j3.dueño=="Jugador 1") {
      money3= money3-pos_j3.renta;
      money1= money1+pos_j3.renta;
    }
    if (pos_j3.dueño=="Jugador 2") {
      money3= money3-pos_j3.renta;
      money2= money2+pos_j3.renta;
    }
    if (pos_j3.dueño=="Jugador 4") {
      money3= money3-pos_j3.renta;
      money4= money4+pos_j3.renta;
    }
    if (pos_j3.propiedad=="Impuestos") {
      money3=money3-200;
    }
    if (pos_j3.propiedad=="Impuestos sobre varitas") {
      money3=money3-100;
    }
    
    if(money3<=0){
      for(i=0;i<=40;i++){
        pos_j3= pos_j3.next;
        if(pos_j3.dueño=="Jugador 3"){
          pos_j3.dueño="Nulo";
        }
      }
      t_3=false;
    }
    
    
  }
  public void mover4(int dados) {

    while (i<dados && verificarPasar4 == true) {
      pos_j4= pos_j4.next;
      i++;
      if (pos_j4.propiedad=="GO") {
        money4 = money4+200;
      }
    }
    i=0;
    print(pos_j4.propiedad);
    suertetemp = pos_j4.propiedad;
    dueñotemp= pos_j4.dueño;
    fototemp= pos_j4.foto;

    if (pos_j4.dueño=="Jugador 1") {
      money4= money4-pos_j4.renta;
      money1= money1+pos_j4.renta;
    }
    if (pos_j4.dueño=="Jugador 2") {
      money4= money4-pos_j4.renta;
      money2= money2+pos_j4.renta;
    }
    if (pos_j4.dueño=="Jugador 3") {
      money4= money4-pos_j4.renta;
      money3= money3+pos_j4.renta;
    }
    if (pos_j4.propiedad=="Impuestos") {
      money4=money4-200;
    }
    if (pos_j4.propiedad=="Impuestos sobre varitas") {
      money4=money4-100;
    }
    
    if(money4<=0){
      for(i=0;i<=40;i++){
        pos_j4= pos_j4.next;
        if(pos_j4.dueño=="Jugador 4"){
          pos_j4.dueño="Nulo";
        }
      }
      t_4=false;
    }
  }
  
  public void comprarfunc() {
    if (t_1) {
      if (pos_j1.dueño=="Nulo" && comprarttt==true) {
        print("test1");
        pos_j1.dueño= "Jugador 1";
        money1= money1-pos_j1.comprar;
      }
      if (pos_j1.dueño=="Nulo" && comprarttt==false) {
        pos_j1.dueño= "Nulo";
      }
      if (pos_j1.dueño!="Nulo" && comprarttt==true) {
        print("Estra propiedad ya tiene dueño");
      }
    }
    if (t_2) {

      if (pos_j2.dueño=="Nulo" && comprarttt==true) {
        print("test2");
        pos_j2.dueño= "Jugador 2";
        money2= money2-pos_j2.comprar;
      }
      if (pos_j2.dueño=="Nulo" && comprarttt==false) {
        pos_j2.dueño= "Nulo";
      }
      if (pos_j2.dueño!="Nulo" && comprarttt==true) {
        print("Estra propiedad ya tiene dueño");
      }
    }

    if (t_3) {

      if (pos_j3.dueño=="Nulo" && comprarttt==true) {
        print("test3");
        pos_j3.dueño= "Jugador 3";
        money3= money3-pos_j3.comprar;
      }
      if (pos_j3.dueño=="Nulo" && comprarttt==false) {
        pos_j3.dueño= "Nulo";
      }
      if (pos_j3.dueño!="Nulo" && comprarttt==true) {
        print("Estra propiedad ya tiene dueño");
      }
    }

    if (t_4) {

      if (pos_j4.dueño=="Nulo" && comprarttt==true) {
        print("test2");
        pos_j4.dueño= "Jugador 4";
        money4= money4-pos_j4.comprar;
      }
      if (pos_j4.dueño=="Nulo" && comprarttt==false) {
        pos_j4.dueño= "Nulo";
      }
      if (pos_j4.dueño!="Nulo" && comprarttt==true) {
        print("Estra propiedad ya tiene dueño");
      }
    }

    comprarttt=false;
  }
  
   public void carcel() {
        if (pos_j1.propiedad=="Vaya a la carcel") {
              pos_l = (pos_l + 20) % fields.size();
              tablero.mover1(20);
              money1 = money1 -200;
              
              money1 = money1 - 50;
              
              
              print("AAAAAAAAAAAAAAAAA");             
         
        } else if (pos_j2.propiedad=="Vaya a la carcel"){
              pos_a = (pos_a + 20) % fields.size();
              tablero.mover2(20);
              money2 = money2 -200;
              
              money2 = money2 - 50;
              
              
              print("BBBBBBBBBBBBBBBBB");
              
       } else if (pos_j3.propiedad=="Vaya a la carcel"){
              pos_j = (pos_j + 20) % fields.size();
              tablero.mover3(20);
              money3 = money3 -200;
              
                
              
              money3 = money3 - 50;
              
              
              print("CCCCCCCCCCCCCCCCC");
              
       } else if (pos_j4.propiedad=="Vaya a la carcel"){
              pos_k = (pos_k + 20) % fields.size();
              tablero.mover4(20);
              money4 = money4 -200;
              
              money4 = money4 - 50;
              
              
              print("ddddddddddddddddd");
       } 
       
    }
}
CreateList tablero = new CreateList();

void setup() {
  size(1280, 720);
  PFont font;
  font = loadFont("HarryP-48.vlw");
  textFont(font);

  //Creacion de nodos
  tablero.add("GO", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Racedo", 60, 70, 60, "Nulo", "avenidaracedo.png");
  tablero.add("Arca Comunal", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Retiro", 60, 70, 60, "Nulo", "avenidaretiro.png");
  tablero.add("Impuestos", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Estacion 9 3/4", 25, 200, 200, "Nulo", "estacion934.png");
  tablero.add("Avenida Vasco", 100, 110, 100, "Nulo", "avenidavasco.png");
  tablero.add("Fortuna", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Lizarazo", 100, 110, 100, "Nulo", "avenidalizarazo.png");
  tablero.add("Avenida Palomino", 120, 130, 120, "Nulo", "avenidapalomino.png");
  tablero.add("De visita", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Garcia", 140, 160, 140, "Nulo", "avenidagarcia.png");
  tablero.add("Compañia de hechizos", 200, 250, 150, "Nulo", "comhechizos.png");
  tablero.add("Avenida Ruiz", 140, 150, 140, "Nulo", "avenidaruiz.png");
  tablero.add("Avenida Herran", 160, 170, 160, "Nulo", "avenidaherran.png");
  tablero.add("Estacion Hogsmeade", 50, 200, 200, "Nulo", "estacionHogsmeade.png");
  tablero.add("Avenida Gil", 180, 190, 180, "Nulo", "avenidagil.png");
  tablero.add("Arca Comunal", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Perez", 190, 200, 190, "Nulo", "avenidaperez.png");
  tablero.add("Avenida Bula", 200, 210, 200, "Nulo", "avenidabula.png");
  tablero.add("Parada libre", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Black", 220, 230, 220, "Nulo", "avenidablack.png");
  tablero.add("Fortuna", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Weasley", 240, 250, 240, "Nulo", "avenidaWeasley.png");
  tablero.add("Avenida Granger", 240, 250, 240, "Nulo", "avenidaGranger.png");
  tablero.add("Estacion Londres", 100, 200, 200, "Nulo", "estacionlondres.png");
  tablero.add("Avenida Lovegood", 260, 270, 260, "Nulo", "avenidalovegood.png");
  tablero.add("Avenida Hagrid", 280, 290, 280, "Nulo", "avenidahagrid.png");
  tablero.add("Compañia de pociones", 200, 0, 150, "Nulo", "compociones.png");
  tablero.add("Avenida Snape", 290, 300, 290, "Nulo", "avenidasnape.png");
  tablero.add("Vaya a la carcel", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Dobby", 300, 310, 300, "Nulo", "avenidadobby.png");
  tablero.add("Avenida Scamander", 300, 310, 300, "Nulo", "avenidaScamander.png");
  tablero.add("Arca comunal", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Potter", 320, 330, 320, "Nulo", "avenidapotter.png");
  tablero.add("Estacion Godric", 200, 200, 200, "Nulo", "estaciongodric.png");
  tablero.add("Fortuna", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Dumbledore", 350, 360, 350, "Nulo", "avenidaDumbledore.png");
  tablero.add("Impuestos sobre varitas", 0, 0, 0, "Nulo", "Nulo");
  tablero.add("Avenida Castillo", 400, 410, 400, "Nulo", "avenidacastillo.png");

  //tablero.display();


  // bottom right
  fields.add(new int[]{725, 604, 105, 88});

  // squares bottom side
  for (int i=8; i>=0; i--) {
    fields.add(new int[]{140+(i*65), (i==1 || i==2) ? 610 : 610, 64, (i==1 || i==2) ? 80 : 80});
  }

  // bottom left
  fields.add(new int[]{37, 604, 105, 88});

  // squares left side
  for (int i=8; i>=0; i--) {
    fields.add(new int[]{37, 115+(54*i), (i==1 || i==2) ? 90 : 90, 54});
  }

  // top left
  fields.add(new int[]{37, 27, 105, 88});

  // squares top side
  for (int i=0; i<9; i++) {
    fields.add(new int[]{140+(i*65), 27, 64, (i==2 || i==3) ? 80 : 80});
  }

  // top right
  fields.add(new int[]{725, 27, 105, 88});

  // squares right side
  for (int i=0; i<9; i++) {
    fields.add(new int[]{(i==2 || i ==3) ? 740 : 740, 115+(54*i), (i==2 || i ==3) ? 90 : 90, 54});
  }
}

void mousePressed () {
  if (menup==0) {
    if  (mouseX > 541 && mouseY < 419 && mouseX < 745 && mouseY > 367) {
      menup=1;
      menujugar=1;
      nojoñe_2 = true;
    }
    if  (mouseX > 541 && mouseY < 498 && mouseX < 745 && mouseY > 446) {
      menup=1;
      menujugar=2;
      nojoñe_3 = true;
    }
    if  (mouseX > 541 && mouseY < 573 && mouseX < 745 && mouseY > 527) {
      menup=1;
      menujugar=3;
      nojoñe_4 = true;
    }
    if  (mouseX > 541 && mouseY < 652 && mouseX < 745 && mouseY > 600) {
      System.exit(0);
    }
  }
  if (menup==1) {
    if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {

      
      dado1 = 0;
      dado2 = 0;
      dado1 = int(random(1, 7));
      dado2 = int(random(1, 7));
      dados = dado1 + dado2;
      
      if(menujugar == 1){
        nojoñe_2 = true;
      } else if (menujugar == 2){
        nojoñe_3 = true;
      } else if (menujugar == 3){
        nojoñe_4 = true;
      }
      
      
      
      // <---------------------------------------------- 2 players ----------------------------------------------------->
      if (nojoñe_2){
        print("NOJOÑEEEEEEE ");
        switch (empieza_2) {

        case 1:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_1 = p_1 + p_2;
            println("El jugador uno sac贸 " + dados_1);

            empieza_2 = 2;
          }

        case 2:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_2 = p_1 + p_2;
            println("El jugador dos sac贸 " + dados_2);

            
            empieza_2 = 3;
            }
          

        case 3:
         
          if (dados_1 == dados_2) {
            empieza_2 = 1;
          }

          if (dados_1 > dados_2) {
            println("Empieza el jugador 1");
            t_1 = true;
            nojoñe_2 = false;
          }

          if (dados_2 > dados_1) {
            println("Empieza el jugador 2");
            t_2 = true;
            nojoñe_2 = false;
          }
        }
      }
      // <-------------------------------------------------------------------------------------------------------------->
      
      
      
      
      
      // <------------------------------------------------ 3 players --------------------------------------------------->
      if(nojoñe_3){
        switch (empieza_3) {

        case 1:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_1 = p_1 + p_2;
            println("El jugador uno sac贸 " + dados_1);

            empieza_3  = 2;
          }

        case 2:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_2 = p_1 + p_2;
            println("El jugador dos sac贸 " + dados_2);

            
            empieza_3 = 3;
            }
          
        case 3:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_3 = p_1 + p_2;
            println("El jugador tres sac贸 " + dados_3);

            
            empieza_3 = 4;
            }
          

        case 4:
         
          if (dados_1 == dados_2) {
              empieza_3  = 1;
          }

          if (dados_1 > dados_2 && dados_1 > dados_3) {
              println("Empieza el jugador 1");  
              t_1 = true;
              nojoñe_3 = false;
          }

          if (dados_2 > dados_1 && dados_2 > dados_3) {
              println("Empieza el jugador 2");
              t_2 = true;
              nojoñe_3 = false;
          }
          
          if (dados_3 > dados_1 && dados_3 > dados_2) {
              println("Empieza el jugador 3");
              t_3 = true;
              nojoñe_3 = false;
            }
        }
      }
      // <--------------------------------------------------------------------------------------------->
      
      
      
      
      
      // <--------------------------------------- 4 players ------------------------------------------->
      
       if (nojoñe_4){
        switch (empieza_4) {

        case 1:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_1 = p_1 + p_2;
            println("El jugador uno sac贸 " + dados_1);

            empieza_4  = 2;
          }

        case 2:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_2 = p_1 + p_2;
            println("El jugador dos sac贸 " + dados_2);
            
             empieza_4 = 3;
            }
          
        
        case 3:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_3 = p_1 + p_2;
            println("El jugador tres sac贸 " + dados_3);
            
            empieza_4 = 4;
            }
          

        case 4:
          if (mouseX > 907 && mouseY < 693 && mouseX < 1100 && mouseY > 528) {
            p_1 = int(random(1, 7));
            p_2 = int(random(1, 7));
            dados_4 = p_1 + p_2;
            println("El jugador cuatro sac贸 " + dados_4);

            empieza_4  = 5;
          }
          
        case 5:
         
          if (dados_1 == dados_2 || dados_1 == dados_3 || dados_1 == dados_4 || dados_2 == dados_3 || dados_2 == dados_4 || dados_3 == dados_4) {
            empieza_4  = 1;
          }

          if (dados_1 > dados_2 && dados_1 > dados_3 && dados_1 > dados_4) {
            println("Empieza el jugador 1");
            t_1 = true;
            nojoñe_4 = false;
          }

          if  (dados_2 > dados_1 && dados_2 > dados_3 && dados_2 > dados_4) {
            println("Empieza el jugador 2");
            t_2 = true;
            nojoñe_4 = false;
          }
          
          if (dados_3 > dados_2 && dados_3 > dados_1 && dados_3 > dados_4) {
            println("Empieza el jugador 1");
            t_3 = true;
            nojoñe_4 = false;
          }

          if (dados_4 > dados_1 && dados_4 > dados_3 && dados_4 > dados_2) {
            println("Empieza el jugador 2");
            t_4 = true;
            nojoñe_4 = false;
          }
        }
      }
    }
    
    
    
    

    if (t_1==true) {
      if (mouseX > 210 && mouseY < 573 && mouseX < 417 && mouseY > 530) {
        print("comprado");
        comprarttt=true;
        tablero.comprarfunc();
      }
      if (mouseX > 480 && mouseY < 574 && mouseX < 688 && mouseY > 530) {
        comprarttt=false;
        print("pasar");
        tablero.comprarfunc();
      }
    }
    if (t_2==true) {
      if (mouseX > 210 && mouseY < 573 && mouseX < 417 && mouseY > 530) {
        comprarttt=true;
        print("comprado");
        tablero.comprarfunc();
      }
      if (mouseX > 480 && mouseY < 574 && mouseX < 688 && mouseY > 531) {
        comprarttt=false;
        print("pasar");
        tablero.comprarfunc();
      }
    }
    if (t_3) {
      if (mouseX > 210 && mouseY < 573 && mouseX < 417 && mouseY > 530) {
        comprarttt=true;
        print("comprado");
        tablero.comprarfunc();
      }
      if (mouseX > 480 && mouseY < 574 && mouseX < 688 && mouseY > 531) {
        comprarttt=false;
        print("pasar");
        tablero.comprarfunc();
      }
    }
    if (t_4) {
      if (mouseX > 210 && mouseY < 573 && mouseX < 417 && mouseY > 530) {
        comprarttt=true;
        print("comprado");
        tablero.comprarfunc();
      }
      if (mouseX > 480 && mouseY < 574 && mouseX < 688 && mouseY > 531) {
        comprarttt=false;
        print("pasar");
        tablero.comprarfunc();
      }
    }
    
    
    // <------------------------------- Mover jugadores ------------------------------------->
    
    if (menujugar == 1 || nojoñe == 2) {
      if (t_1) { //Jugador 1
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Griffindor";       
          
          if (dados_global1){   
            
          pos_l = (pos_l + dados) % fields.size();
          dados_global1 = false;
          
          }
       
          dados_global1 = false;
                
          tablero.mover1(dados);
          tablero.carcel();
          
          verificarPasar1 = false;
          
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          
          t_2 = true;
          t_1 = false;
          
          verificarPasar2 = true;
          dados_global2 = true;
          
          
          name = "Ravenclaw";
        }
      } else if (t_2) { //Jugador 2
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Ravenclaw";   
          
          if (dados_global2){
            
          pos_a = (pos_a + dados) % fields.size();
          dados_global2 = false;
          
          }
          dados_global2 = false;

          tablero.mover2(dados);
          tablero.carcel();
          verificarPasar2 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_1 = true;
          t_2 = false;
          dados_global1 = true;
          verificarPasar1 = true;
          name = "Griffindor";
        }
      }
    }
    
    
    if (menujugar == 2 || nojoñe == 3) {
      if (t_1) {
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Griffindor";
          
          while (dados_global1){
            
          pos_l = (pos_l + dados) % fields.size();
          dados_global1 = false;
          
          }
          
          dados_global1 = false;

          tablero.mover1(dados);
          tablero.carcel();
          verificarPasar1 = false;
        }

        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_2 = true;
          t_1 = false;
          dados_global2 = true;
          verificarPasar2 = true;
          name = "Ravenclaw";
        }
      } else if (t_2) {
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Ravenclaw";
          
          while (dados_global2){
            
          pos_a = (pos_a + dados) % fields.size();
          dados_global2 = false;
          
          }
          
          dados_global2 = false;

          tablero.mover2(dados);
          tablero.carcel();
          verificarPasar2 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_3 = true;
          t_2 = false;
          dados_global3 = true;
          verificarPasar3 = true;
          name = "Slytherin";
        }
      } else if (t_3) {

        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Slytherin";
          
          while (dados_global3){
            
          pos_j = (pos_j + dados) % fields.size();
          dados_global3 = false;
          
          }
          
          dados_global3 = false;

          tablero.mover3(dados);
          tablero.carcel();
          verificarPasar3 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          
          t_1 = true;
          t_3 = false;
          
          dados_global1 = true;
          verificarPasar1 = true;
          name = "Griffindor";
          
        }
      }
    }
    
    
    if (menujugar==3 || nojoñe == 4) {

      if (t_1) {
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Griffindor";
          while (dados_global1){
          pos_l = (pos_l + dados) % fields.size();
          dados_global1 = false;
          }
          dados_global1 = false;

          tablero.mover1(dados);
          tablero.carcel();
          verificarPasar1 = false;
        }

        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_2 = true;
          t_1 = false;
          dados_global2 = true;
          verificarPasar2 = true;
          name = "Ravenclaw";
        }
      } else if (t_2) {
        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Ravenclaw";
          while (dados_global2){
          pos_a = (pos_a + dados) % fields.size();
          dados_global2 = false;
          }
          dados_global2 = false;

          tablero.mover2(dados);
          tablero.carcel();
          verificarPasar2 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_3 = true;
          t_2 = false;
          dados_global3 = true;
          verificarPasar3 = true;
          name = "Slytherin";
        }
      } else if (t_3) {

        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Slytherin";
          while (dados_global3){
          pos_j = (pos_j + dados) % fields.size();
          dados_global3 = false;
          }
          dados_global3 = false;

          tablero.mover3(dados);
          tablero.carcel();
          verificarPasar3 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_4 = true;
          t_3 = false;
          dados_global4 = true;
          name = "Hufflepuff";
          verificarPasar4 = true;
        }
      } else if (t_4) {

        if (mouseX > 903 && mouseY < 682 && mouseX < 1152 && mouseY > 585) {
          name = "Hufflepuff";
          while (dados_global4){
          pos_k = (pos_k + dados) % fields.size();
          dados_global4 = false;
          }
          dados_global4 = false;

          tablero.mover4(dados);
          tablero.carcel();
          verificarPasar4 = false;
        }
        if ((mouseX > 1167 && mouseY < 673 && mouseX < 1260 && mouseY > 591)) {
          print("qweqwewewe");
          t_1 = true;
          t_4= false;
          dados_global1 = true;
          name = "Griffindor";
          verificarPasar1 = true;
        }
      }
    }
  }
}



void draw() {


  if (menup==0) {
    menu= loadImage("inicio.png");
    image(menu, 0, 0);
  }

  if (menujugar==1) {
    monopolyHP= loadImage("Monopoly11_1.png");

    fill(0);
    image(monopolyHP, 0, 0);
    text(dado1 + "  y  " + dado2, 1035, 642);
    text("M" + money1, 947, 215);
    text("M" + money2, 947, 338);
    text(name, 1082, 557);
    text(dados_1, 1230, 186);
    text(dados_2, 1230, 315);
    textSize(30);
    if (t_1) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money1= money1-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money1-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money1+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2= money2-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        if (a==1) {
          money1= money1-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money1-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money1+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2=money2-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis1=true;
        }
      }

      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }
    if (t_2) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money2= money2-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money2= money2+10;
          money1= money1-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        if (a==1) {
          money2= money2-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money2= money2+10;
          money1=money1-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis2=true;
        }
      }


      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }

    // Jugadores

    int xl = fields.get(pos_l)[0] + fields.get(pos_l)[2] / 3;
    int yl = fields.get(pos_l)[1] + fields.get(pos_l)[3] / 3;
    fill(251, 230, 79);
    ellipse(xl, yl, 30, 30);

    int xa = fields.get(pos_a)[0] + fields.get(pos_a)[2] * 2 / 3;
    int ya = fields.get(pos_a)[1] + fields.get(pos_a)[3] * 2 / 3;
    fill(128, 146, 201);
    ellipse(xa, ya, 30, 30);

    if (money1<=0) {
      t_1=false;
      carta= loadImage("ganaravenclaw.png");
      image(carta, 0, 0);
    }
    if (money2<=0) {
      t_2=false;
      carta= loadImage("ganagriffindor.png");
      image(carta, 0, 0);
    }
  }

  if (menujugar==2) {
    monopolyHP= loadImage("monopolyHD3_1.png");
    fill(0);
    image(monopolyHP, 0, 0);
    text(dado1 + "  y  " + dado2, 1035, 642);
    text("M" + money1, 975, 205);
    text("M" + money2, 975, 330);
    text("M" + money3, 975, 450);
    text(name, 1080, 555);
    text(dados_1, 1230, 184);
    text(dados_2, 1230, 314);
    text(dados_3, 1230, 440);
    textSize(30);

    if (t_1) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        if (a==1) {
          money1= money1-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money1-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money1+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2= money2-10;
          money3=money3-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        if (a==1) {
          money1= money1-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money2-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money2+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2=money2-10;
          money3=money3-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis1=true;
        }
      }


      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }

    if (t_2) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money2= money2-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money2= money2+10;
          money1= money1-10;
          money3=money3-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        
        if (a==1) {
          money2= money2-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money2= money2+10;
          money1=money1-10;
          money3=money3-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis2=true;
        }
      }

      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }
    if (t_3) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money3= money3-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money3= money3-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money3= money3+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money3= money3+10;
          money2= money2-10;
          money1=money1-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        
        if (a==1) {
          money3= money3-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money3= money3-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money3= money3+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money3= money3+10;
          money2= money2-10;
          money1=money1-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis3=true;
        }
      }


      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }

    // Jugadores

    //Amarillo
    int xl = fields.get(pos_l)[0] + fields.get(pos_l)[2] * 2 / 3;
    int yl = fields.get(pos_l)[1] + fields.get(pos_l)[3] / 3;
    fill(251, 230, 79);
    ellipse(xl, yl, 30, 30);

    //Azul
    int xa = fields.get(pos_a)[0] + fields.get(pos_a)[2] * 2 / 3;
    int ya = fields.get(pos_a)[1] + fields.get(pos_a)[3] / 3;
    fill(128, 146, 201);
    ellipse(xa, ya, 30, 30);

    //Verde
    int xj = fields.get(pos_j)[0] + fields.get(pos_j)[2] * 2 / 3;
    int yj = fields.get(pos_j)[1] + fields.get(pos_j)[3] / 3;
    fill(113, 183, 60);
    ellipse(xj, yj, 30, 30);

    if (money1<=0) {
      t_1=false;
    }
    if (money2<=0) {
      t_2=false;
    }
    if (money3<=0) {
      t_3=false;
    }

    if (money2<=0 && money3<=0) {
      carta= loadImage("ganagriffindor.png");
      image(carta, 0, 0);
    }

    if (money1<=0 && money3<=0) {
      carta= loadImage("ganaravenclaw.png");
      image(carta, 0, 0);
    }

    if (money1<=0 && money2<=0) {
      carta= loadImage("ganaslytherin.png");
      image(carta, 0, 0);
    }
  }
  if (menujugar==3) {
     monopolyHP= loadImage("monopolyHP4_1.png");
    ;
    fill(0);
    image(monopolyHP, 0, 0);
    text(dado1 + "  y  " + dado2, 1035, 642);
    text("M" + money1, 950, 160);
    text("M" + money2, 950, 260);
    text("M" + money3, 950, 360);
    text("M" + money4, 950, 460);
    text(name, 1080, 555);
    text(dados_1, 1230, 140);
    text(dados_2, 1230, 240);
    text(dados_3, 1230, 340);
    text(dados_4, 1230, 440);
    textSize(30);

    if (t_1) {


      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money1= money1-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money1-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money1+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2= money2-10;
          money3=money3-10;
          money4=money4-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
       
        if (a==1) {
          money1= money1-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money1= money1-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money1= money1+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1+10;
          money2=money2-10;
          money3=money3-10;
          money4=money4-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis1=true;
        }
      }


      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }
    if (t_2) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money2= money2-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2= money2+10;
          money3=money3-10;
          money4=money4-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        
        if (a==1) {
          money2= money2-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money2= money2-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money2= money2+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2=money2+10;
          money3=money3-10;
          money4=money4-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis2=true;
        }
      }


      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }
    if (t_3) {


      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));

        if (a==1) {
          money3= money3-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money3= money3-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money3= money3+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2= money2-10;
          money3=money3+10;
          money4=money4-10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        
        if (a==1) {
          money3= money3-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money3= money3-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money3= money3+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2=money2-10;
          money3=money3+10;
          money4=money4-10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (a==6) {//igual que el anterior
          tienesalidagratis3=true;
        }
      }



      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }
    if (t_4) {

      if (suertetemp == "Arca Comunal") {
        a = int(random(1, 5));
        
        if (a==1) {
          money4= money4-50;
          carta=loadImage("arcacomunal4.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money4= money4-20;
          carta=loadImage("Arcacomunal3.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money4= money4+100;
          carta=loadImage("arcacomunal1.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2= money2-10;
          money3=money3-10;
          money4=money4+10;
          carta=loadImage("arcacomunal2.png");
          image(carta, 320, 120);
        }
      }

      if (suertetemp == "Fortuna") {
        a = int(random(1, 7));
        
        if (a==1) {
          money4= money4-50;
          carta=loadImage("fortuna1.png");
          image(carta, 320, 120);
        } else if (a==2) {
          money4= money4-20;
          carta=loadImage("fortuna2.png");
          image(carta, 320, 120);
        } else if (a==3) {
          money4= money4+100;
          carta=loadImage("fortuna3.png");
          image(carta, 320, 120);
        } else if (a==4) {
          money1= money1-10;
          money2=money2-10;
          money3=money3-10;
          money4=money4+10;
          carta=loadImage("fortuna6.png");
          image(carta, 320, 120);
        } else if (a==5) {//igual que al caer en la carcel, pero aca sin importar posicion(caer en la casilla) enviarlo
        } else if (k=="Salida gratis") {//igual que el anterior
          tienesalidagratis4=true;
        }
      }



      if (dueñotemp== "Nulo") {

        if (fototemp != "Nulo") {
          carta= loadImage(fototemp);
          decision= loadImage("boton.png");
          image(carta, 320, 120);
          image(decision, 210, 530);
        }
      }
    }


    // Jugadores

    //Amarillo
    int xl = fields.get(pos_l)[0] + fields.get(pos_l)[2] / 5;
    int yl = fields.get(pos_l)[1] + fields.get(pos_l)[3] / 3;
    fill(251, 230, 79);
    ellipse(xl, yl, 30, 30);

    //Azul
    int xa = fields.get(pos_a)[0] + fields.get(pos_a)[2] * 1 / 4;
    int ya = fields.get(pos_a)[1] + fields.get(pos_a)[3] * 2 / 3;
    fill(128, 146, 201);
    ellipse(xa, ya, 30, 30);

    //Verde
    int xj = fields.get(pos_j)[0] + fields.get(pos_j)[2] / 2;
    int yj = fields.get(pos_j)[1] + fields.get(pos_j)[3] / 3;
    fill(113, 183, 60);
    ellipse(xj, yj, 30, 30);

    //Naranja
    int xk = fields.get(pos_k)[0] + fields.get(pos_k)[2] * 1 / 2;
    int yk = fields.get(pos_k)[1] + fields.get(pos_k)[3] * 2 / 3;
    fill(250, 186, 79);
    ellipse(xk, yk, 30, 30);


    if (money1<=0) {
      t_1=false;
    }
    if (money2<=0) {
      t_2=false;
    }
    if (money3<=0) {
      t_3=false;
    }
    if (money4<=0) {
      t_4=false;
    }

    if (money2<=0 && money3<=0 && money4<=0) {
      carta= loadImage("ganagriffindor.png");
      image(carta, 0, 0);
    }

    if (money1<=0 && money3<=0 && money4<=0) {
      carta= loadImage("ganaravenclaw.png");
      image(carta, 0, 0);
    }

    if (money1<=0 && money2<=0 && money4<=0) {
      carta= loadImage("ganaslytherin.png");
      image(carta, 0, 0);
    }

    if (money1<=0 && money2<=0 && money3<=0) {
      carta= loadImage("ganahufflepuff.png");
      image(carta, 0, 0);
    }
  }
}
