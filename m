Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA20675374
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 12:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481693.746771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpeE-00063A-05; Fri, 20 Jan 2023 11:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481693.746771; Fri, 20 Jan 2023 11:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpeD-0005zj-SJ; Fri, 20 Jan 2023 11:33:29 +0000
Received: by outflank-mailman (input) for mailman id 481693;
 Fri, 20 Jan 2023 11:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrnU=5R=casper.srs.infradead.org=BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pIpe9-0005zd-9l
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 11:33:28 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed5fe8e-98b6-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 12:33:23 +0100 (CET)
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIpe3-001ttS-Vy; Fri, 20 Jan 2023 11:33:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3ed5fe8e-98b6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FPmMJJucX/DY1S9Sm3Up0z7xbAoQFdvYkviGDi2uMMs=; b=naiS7fk8gxacUZ3x4HlaciIzLf
	XKqAH7AVLuriO6KopMrb+IwHuBvdaA5BMj3oqXseffvUXZofXK3ZI892h/OA77G3KPbVKcxStmlpm
	3YmPaEQQHJfao3h5dWXMtZpamyr/yOqF31QTFDqDXq4pp0Zwj9wH2kUlMzJ8WDVf7MzopLfkEWRQ7
	EgKWSyVfjdisarVKmMlYdpxgWR4pLKwsO3mmaweeHoZ95GY6PHXIwgtkulGCxqzotLfwpIvLXjqg1
	VoSfCBZouWaL3nGBlkYa1WOYRcppmCOWd5/6wixlvDF51RraYNAfiERzzHhMwGlmdbzRX+PB0M2WR
	SRLCvh+Q==;
Message-ID: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Subject: [SeaBIOS PATCH] xen: require Xen info structure at 0x1000 to detect
 Xen
From: David Woodhouse <dwmw2@infradead.org>
To: seabios <seabios@seabios.org>, xen-devel
 <xen-devel@lists.xenproject.org>,  qemu-devel <qemu-devel@nongnu.org>
Cc: paul <paul@xen.org>
Date: Fri, 20 Jan 2023 11:33:19 +0000
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-j8Wo6X+P905qFelz4Cgk"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-j8Wo6X+P905qFelz4Cgk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

When running under Xen, hvmloader places a table at 0x1000 with the e820
information and BIOS tables. If this isn't present, SeaBIOS will=20
currently panic.

We now have support for running Xen guests natively in QEMU/KVM, which
boots SeaBIOS directly instead of via hvmloader, and does not provide
the same structure.

As it happens, this doesn't matter on first boot. because although we
set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
gives zero. Presumably because in true Xen, this is all already RAM. But
in QEMU with a faithfully-emulated PAM config in the host bridge, it's
still in ROM mode at this point so we don't see what we've just written.

On reboot, however, the region *is* set to RAM mode and we do see the
updated value of PlatformRunningOn, do manage to remember that we've
detected Xen in CPUID, and hit the panic.

It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
runs, because it's so early. We can't even make a XENVER_extraversion
hypercall to look for hints, because we haven't set up the hypercall
page (and don't have an allocator to give us a page in which to do so).

So just make Xen detection contingent on the info structure being
present. If it wasn't, we were going to panic anyway. That leaves us
taking the standard QEMU init path for Xen guests in native QEMU,
which is just fine.

Untested on actual Xen but ObviouslyCorrect=E2=84=A2.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 src/fw/xen.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/src/fw/xen.c b/src/fw/xen.c
index a215b9e..00e4b0c 100644
--- a/src/fw/xen.c
+++ b/src/fw/xen.c
@@ -40,16 +40,25 @@ struct xen_seabios_info {
     u32 e820_nr;
 } PACKED;
=20
-static void validate_info(struct xen_seabios_info *t)
+static struct xen_seabios_info *validate_info(void)
 {
-    if ( memcmp(t->signature, "XenHVMSeaBIOS", 14) )
-        panic("Bad Xen info signature\n");
+    struct xen_seabios_info *t =3D (void *)INFO_PHYSICAL_ADDRESS;
=20
-    if ( t->length < sizeof(struct xen_seabios_info) )
-        panic("Bad Xen info length\n");
+    if ( memcmp(t->signature, "XenHVMSeaBIOS", 14) ) {
+        dprintf(1, "Bad Xen info signature\n");
+        return NULL;
+    }
+
+    if ( t->length < sizeof(struct xen_seabios_info) ) {
+        dprintf(1, "Bad Xen info length\n");
+        return NULL;
+    }
=20
-    if (checksum(t, t->length) !=3D 0)
-        panic("Bad Xen info checksum\n");
+    if (checksum(t, t->length) !=3D 0) {
+        dprintf(1, "Bad Xen info checksum\n");
+        return NULL;
+    }
+    return t;
 }
=20
 void xen_preinit(void)
@@ -86,7 +95,10 @@ void xen_preinit(void)
         dprintf(1, "No Xen hypervisor found.\n");
         return;
     }
-    PlatformRunningOn =3D PF_QEMU|PF_XEN;
+    if (validate_info())
+        PlatformRunningOn =3D PF_QEMU|PF_XEN;
+    else
+        dprintf(1, "Not enabling Xen support due to lack of Xen info\n");
 }
=20
 static int hypercall_xen_version( int cmd, void *arg)
@@ -122,10 +134,14 @@ void xen_hypercall_setup(void)
=20
 void xen_biostable_setup(void)
 {
-    struct xen_seabios_info *info =3D (void *)INFO_PHYSICAL_ADDRESS;
-    void **tables =3D (void*)info->tables;
+    struct xen_seabios_info *info =3D validate_info();
+    void **tables;
     int i;
=20
+    if (!info)
+        panic("Xen info corrupted\n");
+
+    tables =3D (void*)info->tables;
     dprintf(1, "xen: copy BIOS tables...\n");
     for (i=3D0; i<info->tables_nr; i++)
         copy_table(tables[i]);
@@ -136,12 +152,15 @@ void xen_biostable_setup(void)
 void xen_ramsize_preinit(void)
 {
     int i;
-    struct xen_seabios_info *info =3D (void *)INFO_PHYSICAL_ADDRESS;
-    struct e820entry *e820 =3D (struct e820entry *)info->e820;
-    validate_info(info);
+    struct xen_seabios_info *info =3D validate_info();
+    struct e820entry *e820;
+
+    if (!info)
+        panic("Xen info corrupted\n");
=20
     dprintf(1, "xen: copy e820...\n");
=20
+    e820 =3D (struct e820entry *)info->e820;
     for (i =3D 0; i < info->e820_nr; i++) {
         struct e820entry *e =3D &e820[i];
         e820_add(e->start, e->size, e->type);
--=20
2.34.1



--=-j8Wo6X+P905qFelz4Cgk
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTIwMTEzMzE5WjAvBgkqhkiG9w0BCQQxIgQgt0UAYe1I
+LcFmYJrg6c89Ru3BLQ8skfDDkeczLgmevowgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBIfcfobJqNP13umN2Ms9YmbaNrUnYVRYnQ
yYo7rcjIZ+9rDtcDc3/vRqdWyCgTXAnG3CyXknQW8YLYT4RCjKe2cp3cBcszVEPwK4cPR4FyNYcA
gOoosByBQXfYVdMa66PIr3RUwwObC3gsheDIUvqPMrAm/fLeivCTBSDLo8fD2YAAK7LXuxIl5Bnn
1ze694ex3GX5KOmpr6jwOlosP1+51RMKH1Jvul47RgDvLPXQGm/D3q1nffFYC66dqZyxnF+co2tk
eGqyRjQ+5O0u1e3cSJK7lnl+4P7rW7p8rub1jsRWVzQ032jKIX+45wK+2/MtNBB2lhqn3NmgiMhu
wqIIzZF+3j+ywDz4JnUZe5QB1Do6T9ukqtIdKD2s3BSUSpnUxaMBAi1Ee1KRqmchQd9gqNFQ+uz2
7C1devC13Cx2711/dntBkjweaNr8cZmw3SVyZ30Zq1UDw9S8kCgCslf0TireKVQQiMmxCRcezBQb
VM/APe8Mq+KlvRM7npuKmr750dvRBQr53MZvTKfmMDX/MOByjABnzHroHjA6HQA67frjTM9M2BOc
OLI5tDm5V7HaTSXEvNto1SUrzBVoakktQzYgeHK3BXDiygwO1LZ5CmJQqr74UK9bOUDVk1j0Lwu8
dig4FHBAAAxYZzmkU6isIojVaDGRwCCce0NPwBH+NgAAAAAAAA==


--=-j8Wo6X+P905qFelz4Cgk--

