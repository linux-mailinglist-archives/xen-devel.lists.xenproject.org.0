Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19CC132F96
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 20:37:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iouco-0006Tt-Ph; Tue, 07 Jan 2020 19:34:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YJVR=24=phptrix.de=einsle@srs-us1.protection.inumbo.net>)
 id 1ioucn-0006To-8k
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 19:34:45 +0000
X-Inumbo-ID: bb94cb1a-3184-11ea-bf56-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb94cb1a-3184-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 19:34:34 +0000 (UTC)
Received: from mail.phptrix.de ([93.213.231.84]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MyJx6-1jcAnF2S68-00yeM0 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan
 2020 20:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=phptrix.de;
 s=default; h=Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type; bh=PYcjWAXwYtR
 Xk1WVNWj5UDSH6Aw=; b=bWVZs55iptj5neuxsl4R11jKNvFRYCeEaC+317SRGLh
 dtYpk0iqI79pEJ/3OewyV+e/z4OU58xblpM7Rv3B24qz1w/Iv9ijFF5SZe46Io6a
 Bk+2UbA+T+G8MP9C5HuBD+u4Xfs7MqkWeIYtOzYM79hweCtQmDQ4GwvlJYzcddaA
 =
DomainKey-Signature: a=rsa-sha1; q=dns; c=simple; s=default; d=phptrix.de;
 b=d5dTEoxgFmJHmovS3R8uXJcQeZwtBSowtdXds5lbuZ+aTm/Rh13iHiH/3kr+YQEnpYieIaZX7sl+WSMJ637BlLEi3SgvHhh8XJoL3sMHOygWBOoowq/sncz4spKs8D3j7kmOGabmDbXWQ3MZQIgMYOrpjUcANihvEq/8Cm+8Emo=;
Received: (qmail 18082 invoked by uid 210); 7 Jan 2020 20:34:32 +0100
X-Qmail-Scanner-Diagnostics: from whisperdark.phptrix.de
 (einsle@whisperdark.phptrix.de) by portfish (envelope-from
 <einsle@phptrix.de>, uid 201) with qmail-scanner-2.11st 
 (clamdscan: 0.100.1/25686. spamassassin: 3.4.1. perlscan: 2.11st.  
 Clear:RC:1(192.168.139.163):. 
 Processed in 0.243153 secs); 07 Jan 2020 19:34:32 -0000
Received: from whisperdark.phptrix.de (HELO ?192.168.139.163?)
 (einsle@192.168.139.163)
 by portfish.phptrix.de with ESMTPA; 7 Jan 2020 20:34:32 +0100
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <001f1181-615a-fcbe-de30-5792a1f1f318@phptrix.de>
 <719c82c2904741b58691ec5896d5b116@EX13D32EUC003.ant.amazon.com>
From: Steffen Einsle <einsle@phptrix.de>
Message-ID: <fc34ad12-aa99-e7ec-ab67-9313cb6fe30b@phptrix.de>
Date: Tue, 7 Jan 2020 20:34:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <719c82c2904741b58691ec5896d5b116@EX13D32EUC003.ant.amazon.com>
X-Provags-ID: V03:K1:Rsb0GonMX1p/Jjy0ohxb0itC//D8UCcKbZlN1JRNcPDxC8jUxz6
 UfXkDnSGQIJTqbiUjIjLeF/g3RzvZcGOs/+9R+77yc2LMWkKOGSS6lnEhx8v4lAunhFuxU+
 W2BokkNo/TkYab5DshysZ+MuHKtn4sJESRwBOmMDNdrY/8Um7qQlwQsGNq4kK7PcY9/9IkR
 FLxHxNJ092l8xWxsjoAOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t867iBGWJ+o=:cya+wD6B3KyYKijEyu/v2R
 TQRkAu/JCChjevY0hPpFUWpTDgt3LjGSOFNsZcIM7fPGrS30GHQMGOeMwh+1jY9deCyQOPnM1
 zyYXEfcQZqO0zisx4g9rEYlawYI3T0nwFNIGZ81iV6QnyWhVZ9nLmIJ0wn0GalDrdVTmJyBHl
 cKFaqHu0hd1QXlHK9rIUNAihSvwDLJRyh2CsIbKIQd0JiQJyem6ieXbVPanjjQiyc+sHaCfQ1
 60DE6You6eESl6HvLIyZbQJenc1ogVmjAAwHLXaGV+fmJ53814h8YkejSmlo8lnRbRLMnANco
 i83JuWFKwkq2BPUTJIhKadPqIMQUYE3ahVXNRvkVsBiSGxYLyDlE8QJq4rs3puihPhSfAmVGe
 LE9TMdon51zxetcNGLiCQHDXwps59jFdaxW9ZQHsaMBzBxcOoIrNgLC9J5ST9qu2LJ/uQLIfY
 VO+8JVvpX6L+YGLjjaxCS4AeLLYyYkOm+q7Tlt/Q5Wn9A3O6PudOygxsJkF9Y3aiM5eJXlVNX
 GLqpGR2zWq1iYMR7rEF2cvhvG+c//Sa9CcSyxbgkIlMrATnqg6a/sXaFuCgcuMPS1N/2uKI9m
 qQ4Wd3bUzFuWIkmichmsVXgBG54PAaDTnS/JecKLuTQTMYA9tCfvuvqVZQJHX2lPga7Qq1rYK
 qtAXO92QRq3zxkMqbJhmDBHQqsnha8MeIBq00zMqmJyeQMU5W4jcTQNEJYZKkrtntAMXsI9vg
 eSZTSBIUT/ga57P6PIZQzKY50urq7dnIo/RqT8QNNBkMaW+q4gOaMRCDT+SARpKBcMJWe+wID
 AuPxjlXAzrutsffBLE7wLP5OdaZul+va2jnQpETCoEucBv4c8sCK9ufYxq9LCiix/69vaD/wP
 DNXnzhZm+crb+u0786EA==
Subject: Re: [Xen-devel] [...], USB-passthru only works with qemu-traditional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7363298659179156110=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a cryptographically signed message in MIME format.

--===============7363298659179156110==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms080900060101010409060408"

This is a cryptographically signed message in MIME format.

--------------ms080900060101010409060408
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

you're probably right about the malformed commandline for USB-passthru:=20
With upstream qemu I get

qemu-system-x86_64: -usbdevice tablet: '-usbdevice' is deprecated,=20
please use '-device usb-...' instead
qemu-system-x86_64: -usbdevice host:0d46:3003: '-usbdevice' is=20
deprecated, please use '-device usb-...' instead
qemu-system-x86_64: -usbdevice host:0d46:3003: could not add USB device=20
'host:0d46:3003'

I'm not quite sure if this ever worked (without trad), but if it did, it =

was some years ago... perhaps at the times of xen 4.1 ?


Am 06.01.2020 um 11:23 schrieb Durrant, Paul:
>> -----Original Message-----
>> From: win-pv-devel <win-pv-devel-bounces@lists.xenproject.org> On Beha=
lf
>> Of Steffen Einsle
>> Sent: 05 January 2020 00:44
>> To: win-pv-devel@lists.xenproject.org
>> Subject: [win-pv-devel] Driver 9.0.0 no keyboard in vncviewer, USB-
>> passthru only with qemu-traditional
>>
>> Hello,
>>
>> I just installed a Windows 2019 Server with the new 9.0.0 PV drivers
>> under xen 4.12.1. I use gentoo and since I need usb-passthru I have to=

>> use the qemu-traditional useflag (or device_model_version =3D
>> 'qemu-xen-traditional').
>>
>> - USB-passthru works only with qemu-traditional
>    That seems odd, but I guess nor many people use USB passthru so it c=
ould have got broken with upstream somewhere along the way.
>> Is there a general trick to get USB-passthru working with qemu-xen?
>> (without qemu-traditional my usbdevice =3D ['tablet', 'host:0d46:3003'=
]
>> prevents domu creation - device-model-exited-error)
>    I think that is probably something to post on xen-users or xen-devel=
=2E Have you ever had USB passthrough working with upstream QEMU? There's=
 nothing at https://wiki.xenproject.org/wiki/Xen_USB_Passthrough to sugge=
st it is only supported using trad so if it is broken it needs fixing. Wh=
at does your qemu log (under /var/log/xen) say was the reason for failure=
? (I'm guessing it was probably malformed command line, which would mean =
there's a bug in libxl).
> Paul




--------------ms080900060101010409060408
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
C5owggVLMIIEM6ADAgECAhAzO0efAb5pn3uDz2OOtv1YMA0GCSqGSIb3DQEBCwUAMIGCMQsw
CQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoM
GkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBB
dXRoZW50aWNhdGlvbiBDQSBHMTAeFw0xOTA2MDYwODU4NTBaFw0yMDA2MDYwODU4NTBaMBwx
GjAYBgNVBAMMEWVpbnNsZUBwaHB0cml4LmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAt0xgy7MsZFN4q4qFwq+eUWJnf+W7cZqNudL4ZjxjHZ48WydFAqnu7sFMSw1QSsbM
AhDJurr7eAY83Qe/uNJqk8G01QyY6nJ6Hm80DuUgL8KXjdI+J9nD/2gTJHIDJyJjv6xO1A6y
rdjdDi8QCWB12BF7KThcKyfWdg+n1Y7aiQ9ppsvz6iVzBqgi9VnjqsrIMFSobEdvTcyYDqhl
lzy/k1O1lk6Lhvnndsz5w7H6ie3H7NYq+oS67R3aXCKT34TZJT6g9L74Uz68XG6PMJDAVtkf
R6IaZqLzFBJ1Ot/RsVdcetf0Le0SDU7Z10/7u31G/dQsRS+xWPQjevUp0gKizwIDAQABo4IC
IDCCAhwwDAYDVR0TAQH/BAIwADAfBgNVHSMEGDAWgBR+YPz4bKc9Pdeuk6F5Ao+zdCk79TBL
BggrBgEFBQcBAQQ/MD0wOwYIKwYBBQUHMAKGL2h0dHA6Ly9jYWNlcnQuYWN0YWxpcy5pdC9j
ZXJ0cy9hY3RhbGlzLWF1dGNsaWcxMBwGA1UdEQQVMBOBEWVpbnNsZUBwaHB0cml4LmRlMEcG
A1UdIARAMD4wPAYGK4EfARgBMDIwMAYIKwYBBQUHAgEWJGh0dHBzOi8vd3d3LmFjdGFsaXMu
aXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgegGA1Ud
HwSB4DCB3TCBm6CBmKCBlYaBkmxkYXA6Ly9sZGFwMDUuYWN0YWxpcy5pdC9jbiUzZEFjdGFs
aXMlMjBDbGllbnQlMjBBdXRoZW50aWNhdGlvbiUyMENBJTIwRzEsbyUzZEFjdGFsaXMlMjBT
LnAuQS4vMDMzNTg1MjA5NjcsYyUzZElUP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q7Ymlu
YXJ5MD2gO6A5hjdodHRwOi8vY3JsMDUuYWN0YWxpcy5pdC9SZXBvc2l0b3J5L0FVVEhDTC1H
MS9nZXRMYXN0Q1JMMB0GA1UdDgQWBBQC9ikG3u2u/1o1yPPMfjL0QnQoAjAOBgNVHQ8BAf8E
BAMCBaAwDQYJKoZIhvcNAQELBQADggEBAAlKClW+m9KSK6tCChgya45FMrY1YQ19sV64ltaf
+/XVwzvDxm9kjkfOCxL/PXKJJguklP/TsfUakuO0J1m3bg1fZubJOiR9i+xzvkHYHZScA3NH
q7vjEgh1QIft52xbaXMHAMHUPMuY8zem88/6QGkGGALXub36uX1KyF8uN0nnxOy/dNz7LaNj
0wBU4WFy9j7bYoIH3Guz11QGBRwdKdtWSehHnqzGZ8s0Ulg+npCfZ1peZ6uFYYPZxRyk/nDs
3XkjSF9wMWjLPXuKd4jMcNtPo1KDdHJ0Xa9whhnaYTCyC2EzgjQRK9yyf9ibvcArAKzhl9xE
epax0wM+Lm1S4DAwggZHMIIEL6ADAgECAggs1IrTsR4PiTANBgkqhkiG9w0BAQsFADBrMQsw
CQYDVQQGEwJJVDEOMAwGA1UEBwwFTWlsYW4xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAz
MzU4NTIwOTY3MScwJQYDVQQDDB5BY3RhbGlzIEF1dGhlbnRpY2F0aW9uIFJvb3QgQ0EwHhcN
MTUwNTE0MDcxNDE1WhcNMzAwNTE0MDcxNDE1WjCBgjELMAkGA1UEBhMCSVQxDzANBgNVBAgM
Bk1pbGFubzEPMA0GA1UEBwwGTWlsYW5vMSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1
ODUyMDk2NzEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVudGljYXRpb24gQ0EgRzEw
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDA/MGJVtmI4vQEZb/NCTWrKCkw/gzK
9yerHBHuhj1d5PVsRLYMVzOVl96Iio0tqduTKpPHJ1dn6TGhL3TvWpaxnrNL6nFKpcuz5FO+
d0RpbHmF0dlwo1YbOHLkWI7gZm8aUUicUSJpj504SmONa9J5em9wOmdjDoz0Be4ejgmGMLc/
84r//lAVefO1NriJTrpGku145OAK2JELBk0rHwQV6qp9Oli98Rvgf3UTuf5jrWObR3YTx8nb
AZNpJLCNzydMjYCle6OhzO6RvaQerBoY/erlS551ZydFlzrldSEr9norfYq+tC40/fYX/kzG
S8QOcmlSee32IwTG8TOffXMNAgMBAAGjggHVMIIB0TBBBggrBgEFBQcBAQQ1MDMwMQYIKwYB
BQUHMAGGJWh0dHA6Ly9vY3NwMDUuYWN0YWxpcy5pdC9WQS9BVVRILVJPT1QwHQYDVR0OBBYE
FH5g/Phspz09166ToXkCj7N0KTv1MA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUUtiI
OsifeGbtifN7OHCUyQICNtAwRQYDVR0gBD4wPDA6BgRVHSAAMDIwMAYIKwYBBQUHAgEWJGh0
dHBzOi8vd3d3LmFjdGFsaXMuaXQvYXJlYS1kb3dubG9hZDCB4wYDVR0fBIHbMIHYMIGWoIGT
oIGQhoGNbGRhcDovL2xkYXAwNS5hY3RhbGlzLml0L2NuJTNkQWN0YWxpcyUyMEF1dGhlbnRp
Y2F0aW9uJTIwUm9vdCUyMENBLG8lM2RBY3RhbGlzJTIwUy5wLkEuJTJmMDMzNTg1MjA5Njcs
YyUzZElUP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q7YmluYXJ5MD2gO6A5hjdodHRwOi8v
Y3JsMDUuYWN0YWxpcy5pdC9SZXBvc2l0b3J5L0FVVEgtUk9PVC9nZXRMYXN0Q1JMMA4GA1Ud
DwEB/wQEAwIBBjANBgkqhkiG9w0BAQsFAAOCAgEATZPO1SS+QRtKFlhzX2WJ8tl6PliMvMvE
D+VbFmeywUukM/JJ/Myad3PcXTpLnWW3AN75uVPByl3NSXczZqUofds6vznmS71Gvq553Jr4
cZBRPQ6GoOjYrYIAT2cFx8A3GJ+N9PxfMKgLdy1/27HeiDVa4TxZNwtkqAIy41EGYm170LhS
DTDeJeo/Orwq5FGhs0qp10+OTcSIr5AD4QUIKRrXE4uH/tw8ZMkw21rX/S7mguJdo4Ad4Au3
+ep5naRn6WLMryhO/iKflq8h/d6Vregvq+vClNxrtNnFNf3R7zTl1lA3ipFU909usGVa02jM
ftJ0t4utyg3yXYRc7rX3QYAlh3KdNzYToTKstUZwMpRf3VWYJJGuoSmlntbTlNtZEuLr7A+M
DOZOrZdKYp9qOruO5MqCSTDsUUkHKLFrQ11Jmix1BvdWQuobwQ5g5qZkuof6/u5rT66WDsU6
+IVt5nthH15E7zU7wULW4uC62XIYPb4YuOBCey+d4Oxs0BZ+SivL6qoDG9XNfk9JpCnaknnY
BogfUw3WLb+B5FI/zdNEysWTC4gzMOFfEoVC+myk1zX29xOvLOO3A/jGrRY1LhhY9LhT72Zb
5TQKCeyDH18yIk1st+V/mpJvnePcAYeeMr+onM9rf3AVNctcHrjwXfDVB/1Ht5l5NEl8JBj9
8lQxggP2MIID8gIBATCBlzCBgjELMAkGA1UEBhMCSVQxDzANBgNVBAgMBk1pbGFubzEPMA0G
A1UEBwwGTWlsYW5vMSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEsMCoG
A1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVudGljYXRpb24gQ0EgRzECEDM7R58Bvmmfe4PP
Y462/VgwDQYJYIZIAWUDBAIBBQCgggIvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTIwMDEwNzE5MzQzMlowLwYJKoZIhvcNAQkEMSIEIJ1ko9NtP+Gtq+4v
AZz5U2BBfENFnQWx8+c+zUadR1YxMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgagGCSsGAQQBgjcQBDGBmjCBlzCBgjELMAkGA1UE
BhMCSVQxDzANBgNVBAgMBk1pbGFubzEPMA0GA1UEBwwGTWlsYW5vMSMwIQYDVQQKDBpBY3Rh
bGlzIFMucC5BLi8wMzM1ODUyMDk2NzEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVu
dGljYXRpb24gQ0EgRzECEDM7R58Bvmmfe4PPY462/VgwgaoGCyqGSIb3DQEJEAILMYGaoIGX
MIGCMQswCQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAh
BgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENs
aWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMQIQMztHnwG+aZ97g89jjrb9WDANBgkqhkiG9w0B
AQEFAASCAQAil2UQV36zj5jQX5N9jvvBO9HuYLJeRXyIfdBLqIwbrDvnl5Wl9xSIdiCyjQY6
KZHqVeXjI+mxYgiy7I+xzkjIkgOynU5XAQH3g9Yi1BovYkOFp/1cLwMcRjJagU2FmaiZe2zd
jfT2/eZ1Riq7Sy9hoIWYH+N71Hrc1GWnj5Fi34SC5pKIS/ptYc0NbahsZuSr6hnqtRI9WSkG
S4qjwFjg2SdCtrbbTiDMmn/NQkq33Ojfs7iJVfkkCqWnj+uGlnd6OvANCwwzPglMItS9K3Y9
Kj31Kfe1Et4A+K/4Mqfso1nKRJ1Fvp5ONXbECpLdjk8FPeQLzVuBQOzdlfMScwROAAAAAAAA

--------------ms080900060101010409060408--


--===============7363298659179156110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7363298659179156110==--

