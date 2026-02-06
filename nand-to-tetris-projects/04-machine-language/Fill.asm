// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LOOP)
    // 1. Controlla lo stato della tastiera (KBD = 24576)
    @KBD
    D=M          // D = contenuto della locazione KBD (D=0 se nessun tasto premuto, D!=0 se premuto)

    @WHITE_FILL
    D;JEQ        // Se D è zero (nessun tasto), salta a WHITE_FILL

    // --- BLACK_FILL (Tasto premuto: D != 0) ---
    @color
    M=-1         // M[color] = -1 (Binary 1111111111111111 = BLACK)
    @INIT_SCREEN 
    0;JMP        // Salta all'inizio del riempimento

    // --- WHITE_FILL (Nessun tasto premuto: D = 0) ---
(WHITE_FILL)
    @color
    M=0          // M[color] = 0 (Binary 0000000000000000 = WHITE)

    // 2. Inizializzazione del puntatore e del loop di riempimento.
(INIT_SCREEN)
    @SCREEN
    D=A          // D = 16384 (indirizzo base dello schermo)
    @addr
    M=D          // M[addr] = 16384 (imposta il puntatore iniziale)

    @KBD
    D=A          // D = 24576 (indirizzo di KBD, che è l'indirizzo DOPO la memoria schermo)
    @END_SCREEN 
    M=D          // M[END_SCREEN] = 24576 (limite del ciclo)

    // 3. Ciclo per scorrere tutti i pixel
(FILL_SCREEN)
    // Condizione di uscita: if addr == END_SCREEN goto LOOP
    @addr
    D=M          // D = indirizzo corrente
    @END_SCREEN
    D=D-M        // D = addr - END_SCREEN (24576)
    @LOOP_CONT
    D;JEQ        // Se D=0 (addr == 24576), abbiamo finito lo schermo, torna a controllare il tasto

    // 4. Scrivi il colore nel pixel corrente (M[addr] = M[color])
    @color
    D=M          // D = M[color] (colore da scrivere: -1 o 0)

    @addr
    A=M          // A = M[addr] (imposta il registro A all'indirizzo del pixel)
    M=D          // M[A] = D (scrivi il colore nella memoria dello schermo)

    // 5. Incrementa il puntatore: addr = addr + 1
    @addr
    M=M+1        

    @FILL_SCREEN
    0;JMP        // Continua il riempimento

// --- Ritorna al controllo della tastiera ---
(LOOP_CONT)
    @LOOP
    0;JMP        // Ricomincia il ciclo principale per rileggere KBD