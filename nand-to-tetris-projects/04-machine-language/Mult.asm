// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// 1. Inizializzazione: R2 (risultato) = 0
    @R2
    M=0          // M[R2] = 0. R2 viene utilizzato come accumulatore.

    // 2. Controllo iniziale: Se R1 è zero, il risultato è già 0, termina.
    @R1
    D=M          // D = M[R1] (il contatore del ciclo)
    @END_PROGRAM
    D;JEQ        // Se D == 0, salta alla fine del programma.

    // 3. Inizializzazione dei registri per l'addizione (R0 è il valore da sommare)
    // R0 contiene il valore da sommare ripetutamente
    // R1 agisce come contatore (numero di iterazioni)

(LOOP)
    // Controlla se il contatore R1 ha raggiunto zero
    @R1
    D=M          // D = M[R1] (valore del contatore)
    @END_PROGRAM
    D;JEQ        // Se M[R1] == 0, esci dal ciclo.

    // Esegui la somma: R2 = R2 + R0
    @R0
    D=M          // D = M[R0] (il moltiplicando)
    @R2
    M=D+M        // M[R2] = M[R2] + D (Aggiunge R0 al risultato in R2)

    // Decrementa il contatore: R1 = R1 - 1
    @R1
    M=M-1        // M[R1] = M[R1] - 1

    // Salta all'inizio del ciclo
    @LOOP
    0;JMP        // Salto incondizionato all'etichetta LOOP.

    // 4. Terminazione del programma
(END_PROGRAM)
    @END_PROGRAM
    0;JMP        // Ciclo infinito per fermare l'esecuzione del programma [6].