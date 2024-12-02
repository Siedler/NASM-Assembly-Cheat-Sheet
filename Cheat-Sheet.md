---
title: 'Linux x86 Assembly Cheat Sheet (FU Berlin, TI 2 und 3)'
---

# Register

<table style="background-color: #f8f9fa;color: #202122;margin: 1em 0;border: 1px solid #a2a9b1;border-collapse: collapse;">
<tbody>
  <tr><th>Register</th><th style="width: 12%;" colspan="8">Accumulator</th><th style="width: 12%;" colspan="8">Counter</th><th style="width: 12%;" colspan="8">Data</th><th style="width: 12%;" colspan="8">Base</th><th style="width: 12%;" colspan="8">Stack Pointer</th><th style="width: 12%;" colspan="8">Stack Base Pointer</th><th style="width: 12%;" colspan="8">Source</th><th style="width: 12%;" colspan="8">Destination</th></tr>
  <tr style="text-align: center;"><th scope="row">64-bit</th><td colspan="8">rax</td><td colspan="8">rcx</td><td colspan="8">rdx</td><td colspan="8">rbx</td><td colspan="8">rsp</td><td colspan="8">rbp</td><td colspan="8">rsi</td><td colspan="8">rdi</td></tr>
  <tr style="text-align: center;"><th scope="row">32-bit</th><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">eax</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ecx</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">edx</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ebx</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">esp</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">ebp</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">esi</td><td style="width: 6%;" colspan="4"></td><td style="width: 6%;" colspan="4">edi</td></tr>
  <tr style="text-align: center;"><th scope="row">16-bit</th><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">ax</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">cx</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">dx</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">bx</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">sp</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">bp</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">si</td><td style="width: 9%;" colspan="6"></td><td style="width: 3%;" colspan="2">di</td></tr>
  <tr style="text-align: center;"><th scope="row">8-bit</th><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">ah</td><td style="width: 1.5%;" colspan="1">al</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">ch</td><td style="width: 1.5%;" colspan="1">cl</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">dh</td><td style="width: 1.5%;" colspan="1">dl</td><td style="width: 9%;" colspan="6"></td><td style="width: 1.5%;" colspan="1">bh</td><td style="width: 1.5%;" colspan="1">bl</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">spl</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">bpl</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">sil</td><td style="width: 9%;" colspan="7"></td><td style="width: 1.5%;" colspan="1">dil</td></tr>
</tbody>
<caption></caption>
</table>

## Verbotene Register


Folgende Register sollten nicht benutzt werden. Das schließt die kleineren Register mit ein.

<table style="background-color: #f8f9fa;color: #202122;margin: 1em 0;border: 1px solid #a2a9b1;border-collapse: collapse;">
<tbody>
<tr><th>Register</th><th>Zugehörig</th><th>Grund</th></tr>
<tr><td>rbp</td><td>ebp, bp, bpl</td><td>Pointer zur vorherigen Stackframe.</td></tr>
<tr><td>rsp</td><td>esp, sp, sple</td><td>Markiert die Position des obersten Eintrags im Stack.</td></tr>
<tr><td>rbx</td><td>ebx, bx, bh, bl</td><td>Vorgabe, wird direkt für die Steuerung des Programmablaufs genutzt.</td></tr>
<tr><td>r12</td><td>r12d, r12w, r12b</td><td>Reserviert für interne Abläufe. Kann genutzt werden, falls der Wert manuell gespeichert wurde.</td></tr>
<tr><td>r13</td><td>r13d, r13w, r13b</td><td>Reserviert laut Standard.</td></tr>
<tr><td>r14</td><td>r14d, r14w, r14b</td><td>Reserviert laut Standard.</td></tr>
<tr><td>r15</td><td>r15d, r15w, r15b</td><td>Reserviert laut Standard.</td></tr>
<tr><td>rip</td><td>ip</td><td>Program counter.</td></tr>
<tr><td>rflags</td><td>eflags, flags</td><td>Regelt zero flag, carry flag, etc.</td></tr>
</tbody>
<caption></caption>
</table>

## Eingabe-Register

Funktionsparameter werden in folgenden Registern übermittelt:

<table>
<tbody>
  <tr style="text-align: center;"><th scope="row">Parameter Nummer</th>
  <td colspan="8">1</td>
  <td colspan="8">2</td>
  <td colspan="8">3</td>
  <td colspan="8">4</td>
  <td colspan="8">5</td>
  <td colspan="8">6</td>
  <td colspan="8">7+</td>
  </tr>
  <tr style="text-align: center;"><th scope="row">Register</th>
  <td colspan="8">rdi</td>
  <td colspan="8">rsi</td>
  <td colspan="8">rdx</td>
  <td colspan="8">rcx</td>
  <td colspan="8">r8</td>
  <td colspan="8">r9</td>
  <td colspan="8">Stack</td>
  </tr>
</tbody>
</table>

## Rückgabe-Register
Der Rückgabewert einer Funktion steht im `rax` Register. Achtet dabei darauf,
dass ihr euer Ergebnis immer ins rax Register schreibt.

Für Floating-Point-Zahlen steht das Ergebnis einer Funktion im ``xmm0`` Register.

## Volatile- vs. Non-Volatile-Register
Nach Calling-Convention werden die Register in 2 Kategorien eingeteilt:
Volatile und Non-Volatile.
Non-Volatile-Register behalten, nach Calling-Convention, nach einem
Funktionsaufruf ihren Wert. D.h. wir müssen uns nicht um die Sicherung dieser
Register kümmern, wenn wir eine weitere Funktion aufrufen.
Dies bedeutet aber auch automatisch, dass wir diese Register auf dem Stack
sichern müssen (`push`), wenn wir sie verwenden wollen, und sie wiederherstellen
(`pop`) bevor unsere Funktion beendet.

Volatile-Register auf der anderen Seite verhalten sich genau andersherum:
Wir dürfen die Wert die dort gespeichert sind verändern, ohne uns um eine
Sicherung Gedanken machen zu müssen. Wollen wir jedoch ihren Wert über einen
weiteren Funktionsaufruf behalten, müssen wir sie manuell vor dem Aufruf sichern.

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


# Befehle

## Bewegen von Daten:

### mov reg (to), value / mov reg (to), reg (from):
Definition:
Verschiebe ein Wert bzw. den Wert eines Registers in ein weiteres Register.

Beispiel:

	mov rax, rdx ; Verschiebe Wert von rdx in rax (ergo rax = rdx)
	mov rsi, 2   ; Verschiebe die Zahl 2 in das Register rsi (ergo rsi = 2)

### shl reg (value 1), value / shl reg (value 1), cl
Definition:
Shifte den Wert des Registers um $n$ Stellen nach Links.
Bits die nach Links "rausgeschoben" werden gehen verloren

Beispiel:

	shl rax, cl ; Verschiebe alle Bits von rax um n-Stellen (Entsprechend des Wertes aus cl)
	shl rax, 1   ; Verschiebe alle Bits

Beispiel under the hood:

	rax = 1100 0011

	shl rax, 1

	=> rax = 1000 0110

ACHTUNG: Sowohl shr, als auch shl nutzen können nur das Register `cl` als
Registerverschiebungswert nehmen!
Dies ist dadurch begründet, dass bei der Entwicklung eines x86-Chips nur eine
Verbindung des Count-Registers (`cl`) angelegt wurde für Verschiebungen.

### shr reg (value 1), value / shr reg (value 1), cl
Definition:
Shifte den Wert des Registers um n Stellen nach Rechts. Also analog zu `shl`.

Beispiel:

	shr rax, cl
	shr rax, 1

ACHTUNG: Sowohl `shr`, als auch `shl` können nur das Register `cl` als
Registerverschiebungswert nutzen!
Bei der Entwicklung der x86-Chips wurde nur eine Verbindung des Count-Registers
(`cl`) für Verschiebungen angelegt.

### rol reg (value 1), value / rol reg (value 1), reg (value 2)
Definition: Rotiere die Werte um $n$ Stellen.
Dies ist Analog zu shl jedoch gehen hier die Bits die nach links raus
geschoben werden nicht verloren, sondern werden rechts hinzugefügt.

Beispiel:

	rol rax, rdx
	rol rax, 1

Beispiel under the hood:

	rax = 1100 0100

	rol rax, 1
	=> rax = 1000 1001


### ror reg (value 1), value / ror reg (value 1), reg (value 2)
Definition: Rotiere die Werte um $n$ Stellen nach Rechts. Also analog zu `rol`

Beispiel:

	ror rax, rdx
	ror rax, 1

## Bit-Operationen:

### and reg (value 1), value / and reg (value 1), reg (value 2)
Definition:
Wendet das logische UND ($\land$) mit dem Wert des zweiten Parameters auf den
Wert des ersten Registers an und speichert das Ergebnis im ersten Register.

Beispiel:

	and rax, rsi ; Verunde den Wert aus rax mit dem Wert aus rsi
	and rax, 0x1 ; Verunde den Wert aus rax mit dem Wert 0x1 (Hexadezimal-Zahl)

Beispiel under the hood:

	rax = 0101 1101
	rsi = 1101 1011

	and rax, rsi = 0101 1101 and 1101 1011

	0101 1101
	1001 1011
	---------
	0001 1001 = rax

### or reg (value 1), value / or reg (value 1), reg (value 2)
Definition:
Wende das logische ODER ($\lor$) mit dem Wert des zweiten Parameters auf das
erste Register an und speichert das Ergebnis im ersten Register.

Beispiel:

	or rax, rsi ; Veroder den Wert aus rax mit dem Wert aus rsi
	or rdx, 0xf ; Veroder den Wert aus rdx mit dem Wert 0xf (Binär = 1111)

Beispiel under the hood:

	rdx = 0011 1101
	0xf = 0000 1101

	or rdx, 0xf = 0011 1101 or 0000 1101

	0011 1101
	0000 1101
	---------
	0011 1101 = rdx

### xor reg (value 1), value / xor reg (value 1), reg (value 2):
Definition:
Wendet das logische XOR ($\oplus$) mit dem Wert des zweiten Parameters auf den
Wert des ersten Registers an.

Beispiel:

	xor rax, rsi  ; Wendet XOR auf den Wert von rax mit dem Wert von rsi an
	xor rdx, 0x8f ; Wendet XOR auf den Wert von rdx mit 0x8f (Binär = 1000 1111) an

Beispiel under the hood:

	rdx  = 0011 1011
	0xff = 1000 1111

	xor rdx, 0x8f

	0011 1011
	1000 1111
	---------
	0000 1011 = rdx

## Arithmetische-Operationen:

### neg reg (value 1):
Definition:
Negiere den Wert aus dem gegebenen Register (in 2er Komplement).

Beispiel:

	neg rsi ; Negiere den Wert in rsi

### add reg (value 1), value / add reg (value 1), reg (value 2):
Definition:
Addiere einen Wert bzw. den Wert eines Registers auf den Wert eines anderen
Registers.

Beispiel:

	add rax, rdx ; Addiere Wert von rdx auf rax und Speicher Ergebnis in rax (rax = rax + rdx)
	add rsi, 2   ; Addiere die Zahl 2 auf rsi und Speicher Ergebnis in rsi (rsi = rsi + 2)

### sub reg (value 1), value / sub reg (value 1), reg (value 2):
Definition:
Analog zu `add` jedoch als Subtraktion

Beispiele:

	sub rax, rdx ; Subtrahiere von rax den Wert von rdx und speichere das Ergebnis in rax (rax = rax - rdx)
	sub rsi, 2   ; Subtrahiere von rsi den Wert 2 (rsi = rsi - 2)

### mul reg (value 1):
Definition:
Multipliziere den Wert in Register rax mit dem Wert des angegebenen Registers. Das Ergebnis wird in die *beiden (!!!)* Register rax und rdx gespeichert (rdx, falls ein Überlauf der Zahl in rax passiert)

Beispiel:

	mul rsi ; Multipliziere den Wert in rax mit dem Wert aus rsi und speichere das Ergebnis in (rdx) rax

ACHTUNG: Dieser Befehl kann nicht mit einem Wert genutzt werden. Falls man das Register rax mit einem bestimmten Wert multiplizieren möchte muss man diesen vorher in ein Register verschieben:

	mov rsi, 3
	mul rsi    ; Multipliziere rax mit 3

### div reg (value 1):
Definition:
Dividiere den Wert aus rdx:rax (rdx konkateniert mit rax) durch den Wert aus dem angegebenen Register. Ergebnis wird in rax (ganzzahlige Division) und rdx (Rest) gespeichert

Beispiel:

	div rsi ; Dividiert rdx:rax durch den Wert in rsi. Rest wird in rdx gespeichert und Wert der ganzzahligen Division in rax

ACHTUNG: Prüfe vor der Division, ob der Wert, der sich in rdx befindet,
korrekt ist.
Dort könnte sich 1. ein Wert befinden, der nichts mit der gewollten Rechnung zu
tun hat und 2. ein Wert drin befinden der nach der Division erhalten bleiben
sollte.

### imul reg (value 1) und idiv reg (value 1):
Definition:
Analog zu mul/div, aber mit signed Zahlen (d.h. Zahlen mit Vorzeichen)

## Vergleiche/Sprünge und Bedinge Sprünge:

### cmp reg (value 1), value / cmp reg (value 1), reg (value 2):
Definition:
Vergleiche ein Register mit einem Wert bzw. mit dem Wert eines weiteren Registers. Diese Operation setzt Bits im Flag-Register die später für Bedingte-Sprünge verwendet werden könnten

Beispiel:

	cmp rax, rsi ; Vergleiche rax mit dem Wert aus rsi
	cmp rax, 2   ; Vergleiche rax mit dem Wert 2

### jmp some_label:
Definition: Setze den Programm Counter (PC, bzw. `rip`) auf die Adresse des
angegebenen Labels (`some_label`).
An Stelle eines Labels kann auch direkt eine Zahl als Adresse genutzt werden
(`jmp 100`).

Beispiel:

	; [...]
	jmp .some_label
	; [...]

	.some_label:
	; [Do something]


### jl some_label / jb some_label / jg some_label / ja some_label / je some_label / jne some_label ...
Definition:
Springe, wenn bestimmte Bits im Flag-Register gesetzt sind.
Dies wird in der Regel in Kombination mit einer Vergleich-Operation genutzt,
um diese Bits zu setzen.

| Sprung Bezeichnung   | Bedeutung |
|--------------------- |---------- |
| `je`                 | "Jump equal"     -- Springe, wenn der Vergleich ergeben hat, dass die Werte die selben sind |
| `jne`                | "Jump not equal" -- Springe, wenn der Vergleich ergeben hat, dass die Werte ungleich sind |
| `jb`                 | "Jump below"     -- Springe wenn $\text{reg1} < \text{reg2}$ oder $\text{reg1} < \text{value}$ (unsigned number) |
| `ja`                 | "Jump above"     -- Springe wenn $\text{reg1} > \text{reg2}$ oder $\text{reg1} > \text{value}$ (unsigned number) |
| `jl`                 | "Jump less"      -- Springe wenn $\text{reg1} < \text{reg2}$ oder $\text{reg1} < \text{value}$ (signed number) |
| `jg`                 | "Jump greater"   -- Springe wenn $\text{reg1} > \text{reg2}$ oder $\text{reg1} > \text{value}$ (signed number) |
| `jz`                 | "Jump zero"      -- Äquivalent zu `je`. Springe wenn das Ergebnis 0 ist. |
| `jnz`                | "Jump not zero"  -- Äquivalent zu `jne`. Springe wenn das Ergebnis nicht 0 ist. |
| `jle` / `jge` / ...  | "Jump less equal" / "Jump greater equal" -- Analog zu den Sprüngen oben nur mit equal |

Beispiele:

	; [...]
	cmp rax, 2
	jl .some_label
	; execute here if rax >= 2
	; [...]

	.some_label:
	; execute here if rax < 2

### test reg (value 1), value / test reg (value 1), reg (value 2):
Definition:
Führt ein logisches UND ($\land$) auf das erste Register mit dem Wert des
zweiten Registers bzw. dem angegebenen Wert aus.
Das Ergebnis wird verworfen, jedoch werden folgende Flags gesetzt:

* `sf`: signed flag, gibt an ob es sich um eine negative Zahl handelt,
* `zf`: zero flag, gibt an ob das Ergebnis die Zahl 0 repräsentiert,
* `pf`: parity flag, gibt an ob die Anzahl an gesetzten Bits im niedrigsten Byte gerade ist. 

Anmerkungen:

- `je`/`jz` testet, ob das `zf`-Bit gesetzt ist.
  Also wenn hier die Verundung das Ergebnis 0 ergab.

## Sichern von Daten:

### Grundlagen Stack:
Ein Stack ist eine Datenstruktur die einer Last-In-First-Out-Warteschlange
entspringt.
D.h. das letzte Element welches hinzugefügt wurde wird das erste Element sein,
welches entnommen wird.
Die CPU nutzt einen solchen Stack für diverse Operationen, und es gibt
Assembly Instruktionen um auf diesen direkt zuzugreifen.
Zusätzlich werden zwei Werte vorgehalten: der (Stack-)Base-Pointer
(oder Frame-Pointer) und der Stack-Pointer.
Der Base-Pointer zeigt immer auf den Beginn des Stacks währenddessen der
Stack-Pointer auf die nächste belegte Adresse zeigt. 
Der Stack wächst, wenn `rsp` kleiner wird. Daher "wächst" der Stack nach 
unten. (Der Stack ist "full descending".)

WICHTIG: nach dem Funktionsaufruf (also vor dem ret Befehl)
muss der Stack-Pointer wieder auf der selben Stelle sein wie zu Beginn des
Funktionsaufrufs!

### push reg:
Definition:
Um Daten auf den Stack zu legen nutzt man den `push`-Befehl.
Dieser legt dann den Wert des angegebenen Registers auf den Stack ab und
aktualisiert den Stack-Pointer.

Beispiel:

	push rax
	push esi
	push cl

### pop reg:
Definition:
Um Daten vom Stack wieder zu nehmen nutzt man den `pop`-Befehl.
Dieser lädt das Datum welches zuletzt auf den Stack gelegt wurde und speichert
es in das jeweilige Register.

Beispiel:

	pop cl
	pop esi
	pop rax

WICHTIG: Es muss in umgekehrter Reigenfolge gepoppt werden wie die Elemente
gepusht wurde. Dies ist der Fall wegen der LIFO-Struktur des Stacks!

## Aufrufen einer weiteren Funktion:

### call some_label:
Definition:
Die `call`-Instruktion wird genutzt um eine Subroutine aufzurufen.
Anders als beim `jmp`-Befehl wird nach der jeweiligen Subroutine wieder an die
Stelle des `call` zurückgesprungen.
D.h. das beim Aufruf eines `call`-Befehls der PC (`rip`) auf den Stack gepusht
werden bevor der Sprung zur jeweiligen Adresse durchgeführt wird.

WICHTIG: Achtet beim Aufruf der `call`-Instruktion darauf, dass ihr die
Calling-Convention beachtet (bspw. Eingaberegister füllen oder jeweilige
Register sichern)

Beispiel:

	some_function:
		...
		call some_other_function
		; ret der subroutine macht hier weiter
		...

	some_other_function:
		...
		ret

# Assembly-Tricks:

### Ein Register auf 0 setzen ("clean" oder "bereinigen")
Um den Wert eines Registers auf 0 zu setzen könnt ihr einfach die Zahl 0 in das
jeweilige Register setzen:

	mov rax, 0 ; Setze rax = 0

Optional hierzu könnt ihr die `xor`-Instruktion nutzen.
Da XOR ein gegebenen Bit auf 0 setzt, gdw. beide Register-Einträge 0 sind,
ODER beide Registereinträge 1 sind folgt daraus,
dass ein XOR mit dem selben Wert das jeweilige Register auf 0 setzen wird.
Dies hat also den selben Effekt wie ein `mov` Befehl und *kann* unter Umständen
effizienter sein (konkret ist die Codierungslänge kürzer).

	xor rax, rax ; Setze rax = 0

	e.g rax = 1101 1111

	xor rax, rax
	=>
	1101 1111
	1101 1111
	---------
	0000 0000

### Ganzzahlige Multiplikation/Division um eine zweier Potenz
Die Multiplikation bzw. die Division einer Zahl der Basis $b$ mit einer Zahl
der Form $b^n$ kann als einfache "Verschiebung" um $n$ Stellen betrachtet werden.
Gucken wir uns dies zuerst im Dezimalsystem mit 10-er Potenzen an:

\begin{align*}
	12 \cdot 10^1 &= 12 \cdot 10   &&= 120 \\
	12 \cdot 10^2 &= 12 \cdot 100  &&= 1200 \\
	12 \cdot 10^3 &= 12 \cdot 1000 &&= 12000
\end{align*}

\begin{align*}
	12 \div 10^1 &= 12 \div 10   &&= 1.2 \\
	12 \div 10^2 &= 12 \div 100  &&= 0.12 \\
	12 \div 10^3 &= 12 \div 1000 &&= 0.012
\end{align*}

Im Binärsystem gilt dieses Prinzip natürlich auch:

\begin{align*}
	0011_2 \cdot 2_{10}^1 &= 0011_2 \cdot 2_{10} &&= 0110_2 \\
	0011_2 \cdot 2_{10}^2 &= 0011_2 \cdot 4_{10} &&= 1100_2
\end{align*}

\begin{align*}
	0011_2 \div 2_{10}^1 &= 0011_2 \div 2_{10} &&= 0001(.1000)_2 \\
	0011_2 \div 2_{10}^2 &= 0011_2 \div 4_{10} &&= 0000(.1100)_2
\end{align*}

Hinweise:

1. Wir geben mit den Subscripts die Basis der Zahlendarstellung an.
2. Da wir mit Binärdarstellungen fester Größe arbeiten können die Zahlen hinter dem
   Komma nicht dargestellt werden. Daher sind nur ganzzahlige Division möglich.

In Assembly können wir also eine Multiplikation bzw. Division eines Registers
mit einem Wert der Form $2^n$ als $n$-Fachen-Shift implementieren:

	shl rax, 1 ; rax = rax*2
	shl rax, 2 ; rax = rax*4

	shr rax, 1 ; rax = rax/2 (ganzzahlig)
	shr rax, 2 ; rax = rax/4 (ganzzahlig)


# SSH and working on Andorra

## Verbinden
Als Referenzsystem für unseren Code nutzen wir die Linux-Debian-Systeme an
unserer Uni.
Auf diese können wir über eine SSH Verbindung zugreifen.

Um eine Verbindung mit den Andorra-System aufzunehmen öffnet ihr eine
Command-Line und initiiert die Verbindung über SSH:

	$ ssh ZEDAT_USER_NAME@andorra.imp.fu-berlin.de

Ähnlich funktioniert dies auch für die anderen Remote-Systeme der Uni:
http://www.mi.fu-berlin.de/w/IT/ItServicesTerminalserver

## Copying files (SSH/SCP)
Um Dateien von eurem System auf die Remotesysteme der Universität zu bekommen
kann man das auf SSH basierende SCP (Secure-Copy-Protocol) nutzen.

	$ scp PATH_TO_FILE ZEDAT_USER_NAME@andorra.imp.fu-berlin.de:DESTINATION_PATH


# How-To-Compile:
Wir stellen euch zu (fast) jeder Assembly-Aufgabe einen C-Wrapper zur Verfügung.
Keine Sorge, den müsst ihr noch nicht verstehen.

Da Assembly eine menschenlesbare Version von Maschinen-Code ist muss diese
zunächst Compiled/Übersetzt werden.
Dazu erstellt ihr zunächst mit Hilfe von NASM eine Objekt-Datei (`.o`) aus
eurem Assembly-Code:

	$ nasm -f elf64 -o PROGRAMM_NAME.o PROGRAMM_NAME.asm

Die Flag "-f elf64" teilt NASM mit, dass die Ausgabe für x64 Linux Übersetzt
werden soll.

Nun müsst ihr auch den C-Wrapper compilieren und eine weitere Objektdatei
erzeugen:

	$ c99 -O2 -c -o PROGRAMM_NAME_wrapper.o PROGRAMM_NAME_wrapper.c

Die Flag `-O2` teilt unserem Compiler mit, dass wir die Optimierungsstufe 2
nutzen wollen (automatische Optimierung unseres C-Codes).  Diese *müsst* ihr
angeben, da dies Implikationen für euren Code hat.

Anschließend müssen wir noch beide Objektdateien zu einer **ausführbaren Datei**
verlinken:

	$ c99 -o PROGRAMM_NAME PROGRAMM_NAME_wrapper.o PROGRAMM_NAME.o

Abschließend solltet ihr eine Datei mit dem Namen "PROGRAMM_NAME" besitzen.
Diese könnt ihr wie folgt ausführen:

	$ ./PROGRAMM_NAMME [parameter 1] [parameter 2] [parameter 3] ...


Alternativ könnt ihr auch einfach die gegebene MAKEFILE nutzen

	$ make

# Debugging mit GDB:
Um Einblick in die Ausführung des ASM-Codes zu bekommen kann man
`gdb` verwenden.
Hierzu findet ihr eine kleine Zusammenfassung von Befehlen zur Ausführung des
`gdb` mit einer Terminal "UI":

	$ gdb PROGRAMM_NAME					Lade deinen code in gdb
	gdb> break SOME_LABEL_IN_YOUR_CODE	Setze einen "Breakpoint" bei dem dein Programm hält
	gdb> tui enable 					Aktiviere die UI
	gdb> layout asm						Zeige den Assembly-Code deines Programms
	gdb> layout regs					Zeige deine Register während des Programmlaufs
	gdb> run							Starte Ausführung des Programms
	gdb> ni								Next Instruction
	gdb> continue						Führe code weiter aus bis zum Schluss oder bis nächster breakpoint
	gdb> quit							Beende gdb
	$

# Quellen:

* https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture
* https://en.wikipedia.org/wiki/X86_calling_conventions
* https://stackoverflow.com/questions/18024672/what-registers-are-preserved-through-a-linux-x86-64-function-call
* https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
* https://cs61.seas.harvard.edu/site/2018/Asm1/
