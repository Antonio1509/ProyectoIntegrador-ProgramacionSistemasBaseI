package lexicografico;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;

public class ProgramaPrincipal {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\josea\\eclipse-workspace\\ProyectoAnalizadorLexico\\src\\lexicografico\\Palabras"; 
        String outputFilePath = "C:\\Users\\josea\\eclipse-workspace\\ProyectoAnalizadorLexico\\src\\lexicografico\\Corregido"; 

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath));
             BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePath))) {

            String line;
            while ((line = reader.readLine()) != null) {
                // Crear el analizador léxico con cada línea leída del archivo
                AcentoLexico lexico = new AcentoLexico(new StringReader(line));

                // Procesar y escribir las palabras con acento al archivo de salida
                String resultado;
                while ((resultado = lexico.yylex()) != null) {
                    // Ignorar espacios en blanco y solo escribir palabras procesadas
                    if (!resultado.trim().isEmpty()) {
                        writer.write(resultado + " "); // Escribir palabras con acentos al archivo
                    }
                }
                writer.newLine(); // Nueva línea al terminar de procesar la entrada
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}



