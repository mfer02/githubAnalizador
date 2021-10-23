
package codigo;

import java.io.File;

/**
 *
 * @author Fernanda
 */
public class Principal {
    public static void main(String[] args) {
       String ruta= "C:/Users/Fernanda/Documents/UNIVERSIDAD/AUTOMATAS/Proyecto Final/AnalizadorLexico/AnalizadorSintactico/src/codigo/Lexer.flex ";
        generarLexer(ruta);
        System.out.println("Correcto");
    }
    
    public static void generarLexer(String ruta){
        File archivo= new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
