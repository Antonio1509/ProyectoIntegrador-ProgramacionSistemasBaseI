%%
// Configuración de JFlex
%class AcentoLexico
%unicode
%line
%column
%type String

%{
    // Método para agregar acentos a palabras
    private String agregarAcentos(String palabra) {
        // Diccionario de palabras sin acento a palabras con acento
        switch (palabra.toLowerCase()) {
            case "como": return "cómo";
            case "que": return "qué";
            case "cual": return "cuál";
            case "cuando": return "cuándo";
            case "donde": return "dónde";
            case "quien": return "quién";
            case "cuantos": return "cuántos";
            case "cuantas": return "cuántas";
            case "si": return "sí";
            case "tu": return "tú";
            case "mas": return "más";
            case "se": return "sé";
            case "solo": return "sólo";
            case "porque": return "porqué";
            case "esta": return "está";
            case "estas": return "estás";
            case "este": return "éste";
            case "estos": return "éstos";
            case "esa": return "ésa";
            case "esas": return "ésas";
            case "ese": return "ése";
            case "esos": return "ésos";
            case "aquella": return "aquélla";
            case "aquellas": return "aquéllas";
            case "aquello": return "aquéllo";
            case "aquellos": return "aquéllos";
            case "te": return "té";
            case "mi": return "mí";
            case "aun": return "aún";
            case "dia": return "día";
            case "via": return "vía";
            case "rio": return "río";
            case "adios": return "adiós";
            case "camion": return "camión";
            case "corazon": return "corazón";
            case "nacion": return "nación";
            case "accion": return "acción";
            case "sangria": return "sangría";
            case "arbol": return "árbol";
            case "tambien": return "también";
		    case "perdon": return "perdón";
		    case "lapiz": return "lápiz";
		    case "examen": return "exámen";
		    case "ultima": return "última";
		    case "ultimo": return "último";
		    case "facil": return "fácil";
		    case "dificil": return "difícil";
		    case "util": return "útil";
		    case "publico": return "público";
		    case "pagina": return "página";
		    case "leccion": return "lección";
		    case "medico": return "médico";
		    case "logico": return "lógico";
		    case "critico": return "crítico";
		    case "angel": return "ángel";
		    case "proximo": return "próximo";
		    case "hacia": return "hacía";
		    case "feliz": return "felíz";
		    case "utiles": return "útiles";
		    case "lampares": return "lámparas";
		    case "carcel": return "cárcel";
		    case "crimen": return "crímen";
		    case "musica": return "música";
            default: return palabra;
        }
    }
%}

%%
// Reglas de análisis léxico
[a-zA-ZáéíóúÁÉÍÓÚñÑ]+ { 
    // Procesar cada palabra encontrada
    return agregarAcentos(yytext());
}

[^a-zA-ZáéíóúÁÉÍÓÚñÑ]+ { 
    // Ignorar caracteres que no son letras
    return yytext();
}

. { /* Ignorar cualquier otro carácter */ }
