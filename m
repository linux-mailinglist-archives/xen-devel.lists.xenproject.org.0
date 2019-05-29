Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B462DF52
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 16:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVzE2-00070N-Mz; Wed, 29 May 2019 14:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MbNQ=T5=ice.rwth-aachen.de=lukas.juenger@srs-us1.protection.inumbo.net>)
 id 1hVzE0-00070I-Lr
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 14:06:40 +0000
X-Inumbo-ID: f8cce040-821a-11e9-83cd-ab912761b51f
Received: from mail-out-4.itc.rwth-aachen.de (unknown [134.130.5.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8cce040-821a-11e9-83cd-ab912761b51f;
 Wed, 29 May 2019 14:06:37 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AtBQCtkO5c/5wagoZlHgEfBg2BSIEoA?=
 =?us-ascii?q?mWBPGOECa9nCQEBAQEBAQEBAQMEAS0CAQGHNyM4EwEDAQEFAQEBAQRtKIV0gTM?=
 =?us-ascii?q?CBFsNCAEBgx4BggqpVYEvhUeDYH8QCQGBKAICgU6KA4IWgTiDKYURgj2CWASoY?=
 =?us-ascii?q?AcCgTJdgxmCGY1nIYIPAYpNBYlxonYCAgICCQIVgWYhgVdxgzyQUz6BW4t9AYE?=
 =?us-ascii?q?gAQE?=
X-IPAS-Result: =?us-ascii?q?A2AtBQCtkO5c/5wagoZlHgEfBg2BSIEoAmWBPGOECa9nCQE?=
 =?us-ascii?q?BAQEBAQEBAQMEAS0CAQGHNyM4EwEDAQEFAQEBAQRtKIV0gTMCBFsNCAEBgx4Bg?=
 =?us-ascii?q?gqpVYEvhUeDYH8QCQGBKAICgU6KA4IWgTiDKYURgj2CWASoYAcCgTJdgxmCGY1?=
 =?us-ascii?q?nIYIPAYpNBYlxonYCAgICCQIVgWYhgVdxgzyQUz6BW4t9AYEgAQE?=
Received: from rwthex-w1-a.rwth-ad.de ([134.130.26.156])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 29 May 2019 16:06:36 +0200
Received: from [137.226.91.156] (137.226.91.156) by rwthex-w1-a.rwth-ad.de
 (2a00:8a60:1:e500::26:156) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 16:06:35 +0200
To: <xen-devel@lists.xenproject.org>
From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>
Message-ID: <5135f598-556c-cdd4-f9b1-2ce83f49b5d9@ice.rwth-aachen.de>
Date: Wed, 29 May 2019 16:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
X-Originating-IP: [137.226.91.156]
X-ClientProxiedBy: rwthex-w3-a.rwth-ad.de (2a00:8a60:1:e500::26:162) To
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156)
Subject: [Xen-devel] [xen/arm]: Mapping physical memory to dom0/domU
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
Content-Type: multipart/mixed; boundary="===============4131775491249537532=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4131775491249537532==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms060208040901040800090200"

--------------ms060208040901040800090200
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all,

Is there a way to map a region of physical memory to dom0/domU?
Let's say I have a custom device mapped at that memory region and I want =

either dom0 or a domU to have full access to this device.
There seems to be a way to share memory between dom0 and a domU, maybe=20
also between domU and domU.

Thanks,
Lukas


--------------ms060208040901040800090200
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EL8wggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIF9TCCBN2gAwIBAgIMH82llPklWDm75neOMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MDkyODEzMDkyNloXDTIxMDky
NzEzMDkyNlowgYMxCzAJBgNVBAYTAkRFMRQwEgYDVQQKDAtSV1RIIEFhY2hlbjFGMEQGA1UE
Cww9SW5zdGl0dXRlIGZvciBDb21tdW5pY2F0aW9uIFRlY2hub2xvZ2llcyBhbmQgRW1iZWRk
ZWQgU3lzdGVtczEWMBQGA1UEAwwNTHVrYXMgSnVlbmdlcjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMwu1968dVplCQF7E8qcfmH69j4wgk3F8l0dnyrJR44QUGNMQf1Q4Ap8
yYSr+WcJhlYQric47wcT6Cyd5PiUs6SyGp8p2vZPPpDUb4nw+Z6Y835I4aGUkbh0qSx+0ohN
sw+zMJC8bZNcQ00/nQy+s3EZ5J+UAmTlYHI57LX08XziB/MzHyEVljh2c/DT8tmGY67StN+G
dNqYBzZVADKHg/bufR4BenKCx7oX63xB/7tM4aZeMMbvb7f/W1gGOSOA8wMBL3ZVMZkFn2MS
a/Wl6ANUBKwd1fbP68h3zUM3EzPAzE2SJR4/W2aQwIkP5hcv3AKHKf0ewT6EHR5n20VhLacC
AwEAAaOCAlswggJXMEAGA1UdIAQ5MDcwDwYNKwYBBAGBrSGCLAEBBDARBg8rBgEEAYGtIYIs
AQEEAwgwEQYPKwYBBAGBrSGCLAIBBAMIMAkGA1UdEwQCMAAwDgYDVR0PAQH/BAQDAgXgMB0G
A1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUpuj2DlDUOOzcO/iBS+QA
cUgXmRwwHwYDVR0jBBgwFoAUazqYi/nyU4na4K2yMh4JH+iqO3QwKwYDVR0RBCQwIoEgbHVr
YXMuanVlbmdlckBpY2Uucnd0aC1hYWNoZW4uZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0
cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3Js
MD+gPaA7hjlodHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2Ny
bC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHOMIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2Nz
cC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1AwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAx
LnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSQYI
KwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBACbY4U3kbHN5OvhbAYBCD372
KyWiuSpSqJvPhKT/PdknlPyHgtCLP4ossyFS8dTsZw7nXa5Dw1YHVVdWTPv8kZrmuWVg1OkU
yFLTEt6AVtZTl6Hek2cNRbgz4rlxgobN1LOMtJ+ziIvCVPqCfPmCtwWGke7T7rZvVyFZyC7z
IW4fZAqZo4KAI7cMBOXDRdVSrCQ4PUr0JUdeaSe3kzSo/Dp0dqms1rjHsgG7eAtixGQGGdHB
xRn4xvgZY3lbJxP1uW9hZM1b+23uqRMvSeVITyV6nct3e0pnD3O8EA/WkUvHJsB5lJGUf8ip
snejDJ2Y3+d3l/4z14iu2o4qCbfRoAsxggQLMIIEBwIBATCBnjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2No
dW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVp
biBHbG9iYWwgSXNzdWluZyBDQQIMH82llPklWDm75neOMA0GCWCGSAFlAwQCAQUAoIICPTAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA1MjkxNDA2MzVa
MC8GCSqGSIb3DQEJBDEiBCC2u5WzM71KEtvBAUkLHxmrVwq5iljIsrpcNzm+QAlpmDBsBgkq
hkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYI
KoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGv
BgkrBgEEAYI3EAQxgaEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVy
IEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAO
BgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0EC
DB/NpZT5JVg5u+Z3jjCBsQYLKoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRFMUUw
QwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4g
R2xvYmFsIElzc3VpbmcgQ0ECDB/NpZT5JVg5u+Z3jjANBgkqhkiG9w0BAQEFAASCAQAemFSJ
tCCj7J8SN5oLayIg2Hm42ofQoHnEqZSyjjOL++4CB6fyBp43ec0ZbYPs9jS+39EKYdxAyKt8
kc+XdE4yCP4FjckV6K0/+BfI9zbV68Iidr2XaEe0xVKlerNnQLV9lLgw+Pq6E/7Roq71/eEA
zg6P8TBUXRLJsiyhgEz7GpBH6tqB/hdEObaZsE8h97tWxJDyND8ZYTTsgrWQgfK5/Y7Px2Ik
awtSbv6zsEIiEfy69JLUvdTxpWZnwkhvRnkbZ4LFoP6ip+nBwbAWfEGMXpnSPQwoaR9ki73Z
sSl/CeCA3MsL4d8uidzyxAAQNRLBQ43plJWTBmo21OYtJwyJAAAAAAAA
--------------ms060208040901040800090200--


--===============4131775491249537532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4131775491249537532==--

