Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD984B32
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:08:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKgJ-0004fE-Op; Wed, 07 Aug 2019 12:04:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PPj4=WD=amazon.co.uk=prvs=1152dc74e=dwmw@srs-us1.protection.inumbo.net>)
 id 1hvKgH-0004f5-NU
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:04:37 +0000
X-Inumbo-ID: 862a1988-b90b-11e9-8980-bc764e045a96
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 862a1988-b90b-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1565179475; x=1596715475;
 h=from:to:cc:subject:date:message-id:references: in-reply-to;
 bh=6CW7ug0lecWhAK0vK7vo48xypk3pg7oIMAsaXqsrAJM=;
 b=vAh1pnVVmkeuxx17ymIlaZqykcM+/GNwyuoAOpLOvjIVtjFZVbGRi4/L
 04trKik6K0Ux3JoozK6tFXRcwtmWlW/ir9+qtkkDmUetSMLbeL9+Rziv7
 jx/mxMJMVu8W9yiiIYoofYcrezKDAXmJNonAnxkcXWcKZS2VSTsUqp8gq 0=;
X-Amazon-filename: smime.p7s
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; 
 d="p7s'?scan'208";a="745595002"
Content-Type: multipart/mixed; boundary="===============7603139817930150747=="
MIME-Version: 1.0
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Aug 2019 12:04:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 09AF4A27C6; Wed,  7 Aug 2019 12:04:32 +0000 (UTC)
Received: from EX13D03EUC003.ant.amazon.com (10.43.164.192) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 12:04:32 +0000
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13D03EUC003.ant.amazon.com (10.43.164.192) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 12:04:31 +0000
Received: from EX13D08UEE001.ant.amazon.com ([10.43.62.126]) by
 EX13D08UEE001.ant.amazon.com ([10.43.62.126]) with mapi id 15.00.1367.000;
 Wed, 7 Aug 2019 12:04:30 +0000
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "Elnikety, Eslam" <elnikety@amazon.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] evtchn: make support for different ABIs tunable
Thread-Index: AQHVTRIwY33XrYdtVUS71oiV/ROVZ6bvj84AgAAGlAA=
Date: Wed, 7 Aug 2019 12:04:30 +0000
Message-ID: <48bf4b7991aa1bafb96dd30093e07593ce2b8d1f.camel@amazon.co.uk>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
In-Reply-To: <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.60.226]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7603139817930150747==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/x-pkcs7-signature"; boundary="=-HJc0IMOpiQOLRsWRdRk8"

--=-HJc0IMOpiQOLRsWRdRk8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-07 at 12:40 +0100, Andrew Cooper wrote:
> On 07/08/2019 12:20, Eslam Elnikety wrote:
> > Adding support for FIFO event channel ABI was first introduced in Xen 4=
.4
> > (see 88910061ec6). Make this support tunable, since the choice of which
> > event channel ABI has implications for hibernation. Consider resuming a
> > pre Xen 4.4 hibernated Linux guest. The guest boot kernel defaults to F=
IFO
> > ABI, whereas the resume kernel assumes 2L. This, in turn, results in Xe=
n
> > and the resumed kernel talking past each other (due to different protoc=
ols
> > FIFO vs 2L).
>=20
> I'm afraid I don't follow.
>=20
> We have a Linux kernel which knows about FIFO, which was first booted on
> Xen < 4.4, so configured 2L mode.
>=20
> It is then suspended, and resumed on a newer Xen >=3D 4.4.  The guest now
> has a choice between 2L mode, and FIFO mode.
>=20
> What is the problem?
>=20
> When resuming, the guest in question should continue to use 2L mode,
> because that is what it was using previously.

On resume, the guest first boots a Linux kernel (the 'boot' kernel).
That kernel then loads the previous state (the 'resumed' kernel) from
disk and then transfers control to it.

I believe the problem occurs when the boot kernel sees and enables FIFO
mode, then transfers control to the resumed kernel which is expecting
2L.

I wonder if treating it more like a kexec and doing SHUTDOWN_soft_reset
in the handover might be a viable long-term approach (and deal with
other KASLR-related problems). Not that soft reset currently resets
this AFAICT at a quick glance, but maybe it should? In the meantime
though, hiding 2L mode for guests which were first booted without it is
a simple option which doesn't force guests to upgrade.



--=-HJc0IMOpiQOLRsWRdRk8
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEE4w
ggUuMIIEFqADAgECAhEArUDv6+74dq3c2eBL08L87zANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjAwMTAyMjM1
OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFkd213QGFtYXpvbi5jby51azCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAN2pISRkvUNV4yw2EDL6+sjW2wB5usKaF8RaGtUQswDeHkJ26xAJwnkz
hi6WV53Ta/X16t8nRvl8ayd415N7b5Wfttfxv5B5Y1TCMElPP16LOvTh0YSeO51aUUMp9jtBsD8n
HdYrV2c+DCvqsRE5MH4FyKIlU0ZK8xhtcsG3k4CPE+AkPPailHH3DdoWa5uuMoLTtELwcaDoXdyR
9T40IF5u1UILs73+3UsfMfk8QCnp5TZ4udVCIo2XL9VOFXF8nkJH7rBFHr0nGpU/ichL3/p0nF0w
u0LEuyavxmgY3uSfJTPvnlX2+Nf9eW1Kn8MGxMfGXkxoZxLL6EGMUM+wP08CAwEAAaOCAecwggHj
MB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRV0Rb8VJdXONbe1ows
lxjL1P9RnjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcD
BAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQEC
AQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRT
MFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJ
aHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRT
ZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMBwG
A1UdEQQVMBOBEWR3bXdAYW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUAA4IBAQBleXwqG1xXp96Y
OuoFMwoPBvXGe13r4ZEF+yFiw8BJO9LHZ6WIo98S45nfSPkNFwV7GrV98vMXgbNo1adTtBJOEGq+
RV074oILoCnQRjjVrLLPXk6SPHBD2XhwUgh32di5ihWCXBGIrjpgw6+iUYEKIEh2jilWL90xCava
X8zcLdfv+Kswr26P0OeVMC1qTeXhbp2PZhkJVQ2eNfOKn7VfvE6cdJyW6tVyIPDYnwbPLeuKfZkE
ClokUbw3jLoKECkD7YD9zqqAe2vHmJr7Sa2XzKkDrHAOBAxqbkpb3kDd/7xwM4ezBWa7mR/wWE95
CQOptkW7af3IHqpTCloPU9j2MIIFLjCCBBagAwIBAgIRAK1A7+vu+Hat3NngS9PC/O8wDQYJKoZI
hvcNAQELBQAwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAO
BgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEw
MjAwMDAwMFoXDTIwMDEwMjIzNTk1OVowIjEgMB4GCSqGSIb3DQEJARYRZHdtd0BhbWF6b24uY28u
dWswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDdqSEkZL1DVeMsNhAy+vrI1tsAebrC
mhfEWhrVELMA3h5CdusQCcJ5M4Yulled02v19erfJ0b5fGsneNeTe2+Vn7bX8b+QeWNUwjBJTz9e
izr04dGEnjudWlFDKfY7QbA/Jx3WK1dnPgwr6rEROTB+BciiJVNGSvMYbXLBt5OAjxPgJDz2opRx
9w3aFmubrjKC07RC8HGg6F3ckfU+NCBebtVCC7O9/t1LHzH5PEAp6eU2eLnVQiKNly/VThVxfJ5C
R+6wRR69JxqVP4nIS9/6dJxdMLtCxLsmr8ZoGN7knyUz755V9vjX/XltSp/DBsTHxl5MaGcSy+hB
jFDPsD9PAgMBAAGjggHnMIIB4zAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNV
HQ4EFgQUVdEW/FSXVzjW3taMLJcYy9T/UZ4wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
IAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNV
HSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21v
ZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01P
RE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcB
AQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
Y3NwLmNvbW9kb2NhLmNvbTAcBgNVHREEFTATgRFkd213QGFtYXpvbi5jby51azANBgkqhkiG9w0B
AQsFAAOCAQEAZXl8KhtcV6femDrqBTMKDwb1xntd6+GRBfshYsPASTvSx2eliKPfEuOZ30j5DRcF
exq1ffLzF4GzaNWnU7QSThBqvkVdO+KCC6Ap0EY41ayyz15OkjxwQ9l4cFIId9nYuYoVglwRiK46
YMOvolGBCiBIdo4pVi/dMQmr2l/M3C3X7/irMK9uj9DnlTAtak3l4W6dj2YZCVUNnjXzip+1X7xO
nHSclurVciDw2J8Gzy3rin2ZBApaJFG8N4y6ChApA+2A/c6qgHtrx5ia+0mtl8ypA6xwDgQMam5K
W95A3f+8cDOHswVmu5kf8FhPeQkDqbZFu2n9yB6qUwpaD1PY9jCCBeYwggPOoAMCAQICEGqb4Tg7
/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTEzMDEx
MDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVy
IE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVk
MT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVt
YWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrOeV6wodnVAFsc4A5jTxhh2
IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf+bGBSyD9aH95dDSmeny1nxdlYCeX
IoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0
wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFN
e1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0B
OSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQw
HQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8E
CDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEF
BQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFk
ZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJKoZI
hvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo7EIMERoh
42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaBQ+394k+z3ZBy
WPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtlenlxBhh7ETrN
543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPtTbq7vODqzCM6
ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5UY5g2xANPECTQdu9v
WPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7EuTecP/CFtR72uYRBcunw
wH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2niOYihZ+FCbtf3D9mB12D4ln
9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4ognzgXtgtdk3ShrtOS1iAN2ZBXFiR
mjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81r
gzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBAhEArUDv6+74dq3c2eBL08L87zANBglghkgBZQMEAgEFAKCCAe0wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwODA3MTIwNDI4WjAvBgkqhkiG9w0B
CQQxIgQgGuoVeleHAQZIQfO7TQktKXZNNQcHdtxS7ahoqrl5f5Awgb4GCSsGAQQBgjcQBDGBsDCB
rTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQCtQO/r7vh2rdzZ4EvT
wvzvMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0
ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQCtQO/r7vh2rdzZ4EvTwvzvMA0GCSqGSIb3DQEBAQUABIIBAHJNt0EsFv7yb3c6
ioxswvTMwwsL3H3MzLBdjmJPJ7WLj2Ip8Fuijl0pvB0TsuVHreSzJ7KlVCeZWs9QEFQ4/TdWwCRP
d9k3Wqua/kux0f2n6ItWu+7hkDdgM1Gwp9932XmShnvBFG6MQPL3BEiq1/fTVnbOwhxv1ATzCfDT
/29xnlPC3iDOI3UztiklEl0ulRF3X/9sfAjwsZeOzcAPcuDTMks+S++xX0IVRsCQuLMAigvZk+9i
PlDMxGbI4/HL3eNOW/Rqm5Zuc+uKq3qQG1Eksaj8xGflJLSsbaUNLC0PssdB8okNO+ZuyG4yl3KV
2S02uaAQ7/Mz1b1a2XbUbJMAAAAAAAA=


--=-HJc0IMOpiQOLRsWRdRk8--

--===============7603139817930150747==
Content-Type: multipart/alternative; boundary="===============7487350644349294039=="
MIME-Version: 1.0
Content-Disposition: inline

--===============7487350644349294039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============7487350644349294039==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============7487350644349294039==--

--===============7603139817930150747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7603139817930150747==--

