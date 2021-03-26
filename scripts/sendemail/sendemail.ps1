function Send-Email() {
    param(
        [Parameter(mandatory=$true)][string]$To,
        [Parameter(mandatory=$true)][string]$Subject,
        [Parameter(mandatory=$true)][string]$Body
    )
    $username   = "bot.sctrprotecta@gmail.com"
    $password   = "botprotecta"
    $secstr     = New-Object -TypeName System.Security.SecureString
    $password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}

    $hash = @{
        from       = $username
        to         = $To
        subject    = $Subject
        smtpserver = "smtp.gmail.com"
        body       = $Body
        credential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr
        usessl     = $true
        verbose    = $true
        port       = 587
    }

    Send-MailMessage @hash
}

$body = ""
$subject = ""

if($args[0] -eq "Login")
{ 
    $subject = "LOGIN - PROBLEMAS AL INICIAR SESION EN OPTIMUS"
    $body = "No se ha podido ingresar al Sistema Optimus de forma correcta, por favor proceder manualmente"  
}
elseif ($args[0] -eq  "Download") {
    $subject = "DESCARGA - PROBLEMAS AL GENERAR TRAMAS"
    $body = "El sistema Optimus no ha generado las tramas de forma correcta, por favor proceder manualmente"
}
else {
    $subject = "LOGIN - PROBLEMAS"
    $body = "Ha ocurrido un problema, por favor proceder manualmente"
}

Send-Email -To "juan.castro@materiagris.pe" -Subject $subject -Body $body