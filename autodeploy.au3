#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <GUIConstantsEx.au3>

; inicialização das variáveis
; o arquivo a ser lido no git se chama "head", por isso os nomes headIncial e Atual
$headInicial = readMaster()
$headAtual = $headInicial
$file = FileGetShortName("C:\Program Files\Git\cmd\git.exe")

;leitura do arquivo .ini com as informações sobre os caminhos
$localDeploy = IniRead('autodeploy.ini', "options", "localdeploy", "")
$localGit = IniRead('autodeploy.ini', "options", "localgit", "")

Opt("GUIOnEventMode", 1) ; Para que o autoit rode em modo "on event"

; Parametros do GUI
Local $hMainGUI = GUICreate("Autodeploy", 300, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEButton")
GUICtrlCreateLabel("O HEAD atual é:", 30, 10)
$Labelhandle = GUICtrlCreateLabel("" & $headAtual, 30, 30)
Local $iOKButton = GUICtrlCreateButton("Fechar", 70, 60, 60)
GUICtrlSetOnEvent($iOKButton, "CLOSEButton")
GUISetState(@SW_SHOW, $hMainGUI)

; While que verifica se o hash do head mudou
; caso mude, executa um comando "git checkout"
;While $headInicial == $headAtual
While 1
    Sleep (10000)
    $headAtual = readMaster()
	If $headInicial <> $headAtual Then
	   ; executa o comando git
	   Run(@ComSpec & " /c " & $file & ' --work-tree=' & $localDeploy & ' --git-dir=' & $localGit & ' checkout -f', "", @SW_HIDE )
	   ; atualiza a head no GUI
	   GUICtrlSetData($Labelhandle, $headAtual)
    EndIf
WEnd

Func CLOSEButton()
    Exit
 EndFunc

Func readMaster()
    ; Define o local do arquivo
    Local Const $sFilePath = "E:\gitserver\autodeploy\refs\heads\master"

    ; Abre o arquivo e armazena a variável
    Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "Um erro ocorreu ao abrir o arquivo heads/master", 10)
        Return False
    EndIf

    ; Lê o conteudo do arquivo e armazena
    Local $sFileRead = FileRead($hFileOpen)

    ; Fecha o arquivo
    FileClose($hFileOpen)

    ; Mostra o conteudo -> apenas para testes
    ; MsgBox($MB_SYSTEMMODAL, "", "Contents of the file:" & @CRLF & $sFileRead)

	Return $sFileRead
EndFunc
