# Assembly-Cheat-Sheet:
	
## Register:


<table style="background-color: #f8f9fa;color: #202122;margin: 1em 0;border: 1px solid #a2a9b1;border-collapse: collapse;"><tbody><tr><th>Register</th><th style="width: 12%;" colspan="8">Accumulator</th><th style="width: 12%;" colspan="8">Counter</th><th style="width: 12%;" colspan="8">Data</th><th style="width: 12%;" colspan="8">Base</th><th style="width: 12%;" colspan="8">Stack Pointer</th><th style="width: 12%;" colspan="8">Stack Base Pointer</th><th style="width: 12%;" colspan="8">Source</th><th style="width: 12%;" colspan="8">Destination</th></tr><tr style="text-align: center;"><th scope="row">64-bit</th><td colspan="8">RAX</td><td colspan="8">RCX</td><td colspan="8">RDX</td><td colspan="8">RBX</td><td colspan="8">RSP</td><td colspan="8">RBP</td><td colspan="8">RSI</td><td colspan="8">RDI</td></tr><tr style="text-align: center;"><th scope="row">32-bit</th><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">EAX</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ECX</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">EDX</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">EBX</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ESP</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">EBP</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ESI</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">EDI</td></tr><tr style="text-align: center;"><th scope="row">16-bit</th><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">AX</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">CX</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">DX</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">BX</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">SP</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">BP</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">SI</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">DI</td></tr><tr style="text-align: center;"><th scope="row">8-bit</th><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">AH</td><td style="width: 1.5%;" colspan="1">AL</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">CH</td><td style="width: 1.5%;" colspan="1">CL</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">DH</td><td style="width: 1.5%;" colspan="1">DL</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">BH</td><td style="width: 1.5%;" colspan="1">BL</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">SPL</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">BPL</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">SIL</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">DIL</td></tr></tbody><caption></caption></table>

### Eingabe-Register
Funktionsparameter werden in folgenden Registern übermittelt:

| <span> | <span> | <span> | <span> | <span> | <span> | <span> | <span> |
|------------------|-----|-----|-----|-----|----|----|-------|
| Parameter Nummer | 1   | 2   | 3   | 4   | 5  | 6  | 7+    |
| Register         | rdi | rsi | rdx | rcx | r8 | r9 | Stack |

### Rückgabe-Register
Der Rückgabewert einer Funktion steht im **rax** Register. Achtet dabei darauf, dass ihr euer Ergebnis immer ins rax Register schreibt.

### Volatile- vs Non-Volatile-Registers:
Nach Calling-Convention werden die Register in 2 Kategorien eingeteilt: Volatile und Non-Volatile. Non-Volatile-Register behalten, nach Calling-Convention, nach einem Funktionsaufruf ihren Wert. D.h. wir müssen uns nicht um die Sicherung dieser Register kümmern, wenn wir eine weitere Funktion aufrufen. Dies bedeutet aber auch automatisch, dass wir diese Register auf dem Stack sichern müssen (PUSH), wenn wir sie verwenden wollen, und sie wiederherstellen (POP) bevor unsere Funktion beendet.
Volatile-Register auf der anderen Seite verhalten sich genau andersherum: Wir dürfen die Wert die dort gespeichert sind verändern, ohne uns um eine Sicherung Gedanken machen zu müssen. Wollen wir jedoch ihren Wert über einen weiteren Funktionsaufruf behalten, müssen wir sie manuell vor dem Aufruf sichern.

| Register | Volatile | Non-Volatile |
|----------|----------|--------------|
| rax      | X        |              |
| rbx      |          | X            |
| rcx      | X        |              |
| rdx      | X        |              |
| rsp      |          | X            |
| rbp      |          | X            |
| rsi      | X        |              |
| rdi      | X        |              |
| r8-r11   | X        |              |
| r12-r15  |          | X            |


## Befehle

### Bewegung von Daten:

#### MOV reg (to), value / MOV reg (to), reg (from):
Definition: Verschiebe ein Wert bzw. den Wert eines Registers in ein weiteres Register.

Beispiel:
 
	MOV rax, rdx ; Verschiebe Wert von rdx in rax (ergo rax = rdx)
	MOV rsi, 2   ; Verschiebe die Zahl 2 in das Register rsi (ergo rsi = 2)

#### SHL reg (value 1), value / SHL reg (value 1), reg (value 2)
Definition: Shifte den Wert des Registers um n Stellen nach Links. Bits die nach Links "rausgeschoben" werden gehen verloren

Beispiel:

	SHL rax, rdx ; Verschiebe alle Bits von rax um n-Stellen (Entsprechend des Wertes aus rdx)
	SHL rax, 1   ; Verschiebe alle Bits 

Beispiel under the hood:

	rax = 1100 0011
	
	SHL rax, 1
	
	=> rax = 1000 0110

#### SHR reg (value 1), value / SHR reg (value 1), reg (value 2)
Definition: Shifte den Wert des Registers um n Stellen nach Rechts. Also analog zu SHL

Beispiel:
	
	SHR rax, rdx
	SHR rax, 1

#### ROL reg (value 1), value / ROL reg (value 1), reg (value 2)
Definition: Rotiere die Werte um n Stelle. Dies ist Analog zu SHL jedoch gehen hier die Bits die nach links raus geschoben werden nicht verloren, sondern werden rechts hinzugefügt.

Beispiel:

	ROL rax, rdx
	ROL rax, 1

Beispiel under the hood:

	rax = 1100 0100
	
	ROL rax, 1
	=> rax = 1000 1001
	

#### ROR reg (value 1), value / ROR reg (value 1), reg (value 2)
Definition: Rotiere die Werte um n Stellen nach Rechts. Also analog zu ROL

Beispiel:

	ROR rax, rdx
	ROR rax, 1

### Bit-Operationen:

#### AND reg (value 1), value / AND reg (value 1), reg (value 2)
Definition: Wendet das logische UND mit dem Wert des zweiten Parameters auf den Wert des ersten Registers an und speichert das Ergebnis im ersten Register.

Beispiel:

	AND rax, rsi ; Verunde den Wert aus rax mit dem Wert aus rsi
	AND rax, 0x1 ; Verunde den Wert aus rax mit dem Wert 0x1 (Hexadezimal-Zahl)

Beispiel under the hood:

	rax = 0101 1101
	rsi = 1101 1011
	
	AND rax, rsi = 0101 1101 AND 1101 1011
	
	0101 1101
	1001 1011
	---------
	0001 1001 = rax

#### OR reg (value 1), value / OR reg (value 1), reg (value 2)
Definition: Wende das logische ODER mit dem Wert des zweiten Parameters auf das erste Register an und speichert das Ergebnis im ersten Register.

Beispiel:

	OR rax, rsi ; Veroder den Wert aus rax mit dem Wert aus rsi
	OR rdx, 0xF ; Veroder den Wert aus rdx mit dem Wert 0xF (Binär = 1111)

Beispiel under the hood:

	rdx = 0011 1101
	0xF = 0000 1101
	
	OR rdx, 0xF = 0011 1101 OR 0000 1101
	
	0011 1101
	0000 1101
	---------
	0011 1101 = rdx

#### XOR reg (value 1), value / XOR reg (value 1), reg (value 2):
Definition: Wendet das logische XOR mit dem Wert des zweiten Parameters auf den Wert des ersten Registers an.

Beispiel:

	XOR rax, rsi  ; Wendet XOR auf den Wert von rax mit dem Wert von rsi an
	XOR rdx, 0x8F ; Wendet XOR auf den Wert von rdx mit 0x8F (Binär = 1000 1111) an

Beispiel under the hood:
	
	rdx  = 0011 1011
	0xFF = 1000 1111
	
	XOR rdx, 0x8F
	
	0011 1011
	1000 1111
	---------
	0000 1011 = rdx

### Arithmetische-Operationen:

#### NEG reg (value 1):
Definition: Negiere den Wert aus dem gegebenen Register (in 2k)

Beispiel:
	
	NEG rsi ; Negiere den Wert in rsi

#### ADD reg (value 1), value / ADD reg (value 1), reg (value 2):
Definition: Addiere einen Wert bzw. den Wert eines Registers auf den Wert eines anderen Registers.

Beispiel:
	
	ADD rax, rdx ; Addiere Wert von rdx auf rax und Speicher Ergebnis in rax (rax = rax + rdx)
	ADD rsi, 2   ; Addiere die Zahl 2 auf rsi und Speicher Ergebnis in rsi (rsi = rsi + 2)

#### SUB reg (value 1), value / SUB reg (value 1), reg (value 2):
Definition: Analog zu Add jedoch als Subtraktion

Beispiele:

	SUB rax, rdx ; Subtrahiere von rax den Wert von rdx und speichere das Ergebnis in rax (rax = rax - rdx)
	SUB rsi, 2   ; Subtrahiere von rsi den Wert 2 (rsi = rsi - 2)

#### MUL reg (value 1):
Definition: Multipliziere den Wert in Register rax mit dem Wert des angegebenen Registers. Das Ergebnis wird in die *beiden (!!!)* Register rax und rdx gespeichert (rdx, falls ein Überlauf der Zahl in rax passiert)

Beispiel:

	MUL rsi ; Multipliziere den Wert in rax mit dem Wert aus rsi und speichere das Ergebnis in (rdx) rax

ACHTUNG: Dieser Befehl kann nicht mit einem Wert genutzt werden. Falls man das Register rax mit einem bestimmten Wert multiplizieren möchte muss man diesen vorher in ein Register verschieben:

	MOV rsi, 3
	MUL rsi    ; Multipliziere rax mit 3

#### DIV reg (value 1):
Definition: Dividiere den Wert aus rdx:rax (rdx konkateniert mit rax) durch den Wert aus dem angegebenen Register. Ergebnis wird in rax (ganzzahlige Division) und rdx (Rest) gespeichert

Beispiel:
	
	DIV rsi ; Dividiert rdx:rax durch den Wert in rsi. Rest wird in rdx gespeichert und Wert der ganzzahligen Division in rax

ACHTUNG: Prüfe vor der Division, ob der Wert, der sich in rdx befindet, korrekt ist. Dort könnte sich 1. ein Wert befinden, der nichts mit der gewollten Rechnung zu tun hat und 2. ein Wert drin befinden der nach der Division erhalten bleiben sollte.

#### IMUL reg (value 1) und IDIV reg (value 1):
Definition: Analog zu MUL/DIV, aber mit signed Zahlen (d.h. Zahlen mit Vorzeichen)

### Vergleiche/Sprünge und Bedinge Sprünge:

#### CMP reg (value 1), value / CMP reg (value 1), reg (value 2):
Definition: Vergleiche ein Register mit einem Wert bzw. mit dem Wert eines weiteren Registers. Diese Operation setzt Bits im Flag-Register die später für Bedingte-Sprünge verwendet werden könnten

Beispiel:
	
	CMP rax, rsi ; Vergleiche rax mit dem Wert aus rsi
	CMP rax, 2   ; Vergleiche rax mit dem Wert 2

#### JMP some-lable:
Definition: Setze den Programm Counter (PC) auf die Adresse des angegebenen Lable (some_lable)

Beispiel:

	[...]
	JMP .some_lable
	[...]
	
	.some_lable:
	[Do something]
	

#### JL some-lable / JB some-lable / JG some-lable / JA some-lable / JE some-lable / JNE some-lable ...
Definition: Springe, wenn ein bestimmtes Bit im Flag-Register gesetzt ist. Vor dieser Operation sollte ein *CMP reg1, reg2* oder *CMP reg1, value* stattgefunden haben!

| Sprung Bezeichnung | Bedeutung |
|------------------- |---------- |
| JE                 | "Jump equal" - Springe, wenn die Werte des CMP die selben sind |
| JNE                | "Jump not equal" - Springe wenn die Werte des CMP nicht die selben sind |
| JL                 | "Jump less" - Springe wenn reg1 < reg2 oder reg1 < value (signed number) |
| JG                 | "Jump greater" - Springe wenn reg 1 > reg 2 oder reg 1 > value (signed number) |
| JB                 | "Jump above" - Springe wenn reg 1 < reg 2 oder reg 1 < value (unsigned number) |
| JA                 | "Jump below" - Springe wenn reg 1 > reg 2 oder reg 1 > value (unsigned number) |
| JLE / JGE / ...    | "Jump less equal" / "Jump greater equal" - Analog zu den Sprüngen oben nur mit equal |

Beispiele:

	[...]
	CMP rax, 2
	JL .some_lable
	; execute here if rax >= 2
	[...]
	
	.some_lable:
	; execute here if rax < 2

#### TEST reg (value 1), value / TEST reg (value 1), reg (value 2):
Definition: Führt ein logisches und auf das erste Register mit dem Wert des zweiten Registers bzw. dem angegebenen Wert aus. Das Ergebnis wird verworfen, doch die Flags: SF (signed flag gibt an ob es sich um eine negative Zahl handelt), ZF (zero flag gibt an ob das Ergebnis die Zahl 0 repräsentiert), PF (parity flag gibt an ob das Ergebnis gerade/ungerade ist <=> ob das letzte Bit gesetzt ist).
  
Anmerkungen:

- JE/JZ testet, ob das ZF-Bit gesetzt ist. Also wenn hier die Verundung das Ergebnis 0 ergab

### Sichern von Daten:

#### Grundlagen Stack:
Ein Stack ist eine Datenstruktur die einer Last-In-First-Out-Warteschlange entspringt. D.h. das letzte Element welches hinzugefügt wurde wird das erste Element sein, welches entnommen wird.
Diese Datenstruktur ist in Assembly Hardwaremäßig implementiert. Dafür werden zwei Werte benötigt: der Stack-Base-Pointer und der Stack-Pointer. Der Stack-Base-Pointer zeigt immer auf den Beginn des Stacks währenddessen der Stack-Pointer auf die nächste freie Adresse zeigt. WICHTIGT: nach dem Funktionsaufruf (also vor dem RET Befehl) muss der Stack-Pointer wieder auf der selben Stelle sein wie zu beginn des Funktionsaufrufs!

#### PUSH reg:
Um Daten auf den Stack zu legen nutzt man den PUSH-Befehl. Dieser legt dann den Wert des angegebenen Registers auf den Stack ab und aktualisiert den Stack-Pointer.

Beispiel:
	
	PUSH rax
	PUSH esi
	PUSH cl

#### POP reg:
Um Daten vom Stack wieder zu nehmen nutzt man den POP-Befehl. Dieser lädt das Datum welches zuletzt auf den Stack gelegt wurde und speichert es in das jeweilige Register.

Beispiel:
	
	POP cl
	POP esi
	POP rax

WICHTIG: Es muss in umgekehrter Reigenfolge gepopt werden wie die Elemente gepusht wurde. Dies ist der Fall wegen der LIFO-Struktur des Stacks!

### Aufrufen einer weiteren Funktion:

#### CALL some-lable:
Die CALL-Funktion wird genutzt um eine Subroutine aufzurufen. Anders als beim JMP-Befehl wird nach der jeweiligen Subroutine wieder an die Stelle des CALL zurückgesprungen. D.h. das beim Aufruf eines CALL-Befehls der PC und das PSW auf den Stack gepusht werden bevor der Sprung zur jeweiligen Adresse durchgeführt wird.

WICHTIG: Achtet beim Aufruf der CALL-Funktion darauf, dass ihr die Calling-Convention beachtet (bsp. Eingaberegister füllen oder jeweilige Register sichern)

Beispiel:
	
	some_function:
		...
		CALL some-other-function
		; RET der Subroutine macht hier weiter
		...
		
	some_other_function:
		...
		RET

## Assembly-Tricks:

#### Ein Register bereinigen / auf 0 setzen
Um den Wert eines Registers auf 0 zu setzen könnt ihr einfach die Zahl 0 in das jeweilige Register setzen:

	MOV rax, 0 ; Setze rax = 0

Optional hierzu könnt ihr die XOR-Bit-Operation nutzen. Da XOR ein gegebenen Bit auf 0 setze <=> beide Register-Einträge sind 0 ODER beide Registereinträge sind 1 folgt daraus, dass ein XOR mit dem selben Wert das jeweilige Register auf 0 setzen wird. Dies hat also den selben Effekt wie ein MOV Befehl ist jedoch aus Implementierungsgründen effizienter.

	XOR rax, rax ; Setze rax = 0
	
	e.g rax = 1101 1111
	
	XOR rax, rax
	=>
	1101 1111
	1101 1111
	---------
	0000 0000 

#### Ganzzahlige Multiplikation/Division um eine zweier Potenz
....

## How-To-Compile:
Wir stellen euch zu jeder Assembly-Aufgabe einen C-Wrapper zur Verfügung. Keine Sorge, den müsst ihr noch nicht verstehen.
  
Da Assembly eine menschenlesbare Version von Maschinen-Code ist muss diese zunächst Compiled/Übersetzt werden. Dazu erstellt ihr zunächst mit Hilfe von NASM eine .o Datei aus eurem Assembly-Code:

	>> nasm -f elf64 -o PROGRAMM_NAME.o PROGRAMM_NAME.asm

Die Flag "-f elf64" teilt NASM mit, dass die Ausgabe für x64 Linux Übersetzt werden soll.

Nun müsst ihr auch den C-Wrapper compilieren und eine weitere ".o" Datei erzeugen:

	>> cc -O2 -c -o PROGRAMM_NAME_wrapper.o PROGRAMM_NAME_wrapper.c

Die Flag -O2 teilt unserem Compiler mit, dass wir die Optimierungsstufe 2 nutzen wollen (automatische Optimierung unseres C-Codes).

Anschließend müssen wir noch beide ".o" Datein verlinken:

	>> cc -o PROGRAMM_NAME PROGRAMM_NAME_wrapper.o PROGRAMM_NAME.o

Abschließend solltet ihr eine Datei "PROGRAMM_NAME" besitzen. Diese könnt ihr wie folgt ausführen:

	>> ./PRGRAMM_NAMME [parameter 1] [parameter 2] [parameter 3] ...+


Alternativ könnt ihr auch einfach die gegebene MAKEFILE nutzen

	>> make

## Quellen:
https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture

https://en.wikipedia.org/wiki/X86_calling_conventions

https://stackoverflow.com/questions/18024672/what-registers-are-preserved-through-a-linux-x86-64-function-call