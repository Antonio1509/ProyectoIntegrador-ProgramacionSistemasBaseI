package lexicografico;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;

public class ProgramaPrincipal {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\josea\\eclipse-workspace\\ProyectoAnalizadorLexico\\src\\lexicografico\\Palabras"; // Ruta del archivo de texto
        
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Crear el analizador léxico con cada línea leída del archivo
                AcentoLexico lexico = new AcentoLexico(new StringReader(line));

                // Procesar y mostrar el resultado de las palabras con acento
                String resultado;
                while ((resultado = lexico.yylex()) != null) {
                    // Ignorar espacios en blanco y solo mostrar palabras procesadas
                    if (!resultado.trim().isEmpty()) {
                        System.out.print(resultado + " "); // Imprimir palabras con acentos
                    }
                }
                System.out.println(); // Nueva línea al terminar de procesar la entrada
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


