Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8C92857
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 17:28:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzjXC-00045M-4L; Mon, 19 Aug 2019 15:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9RKc=WP=merlin.srs.infradead.org=batv+8bc00d32ecc795eaca9c+5839+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hzjXA-000455-1R
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 15:25:24 +0000
X-Inumbo-ID: 8e949b4e-c295-11e9-b90c-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e949b4e-c295-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=64t023pRkZlBaxaPZ9I9wRFGHPNfSNHXjZ3F0Gvk2+I=; b=3MHQ1+0VNAi9rCnK4M7qoNCsG
 DcyIZLydaLkdxFityJ6g08ug3ozPwCU0mOblhYpDU1u7okG0DzZBcwJdNWbpbRz/iQmHakB158bSS
 /YhbVGJ50G8/DjFo7a9Bc4EQATH5EB0Ky5XGzxUIcyN6yufi07JBwQiCNjgAZM/wwsSC5o+qV/Lgv
 OpTQwgTpCcqicv94uS1aoZdI8fpjg48iKLJkTjwBJtLJmc2rWQiQjowBPCXIlETOewXHsXIj2oqjh
 wuvScl0EKSRsRudSR276ABbRyffzhpGC0z/jkhyp47dGzqy2OfwYyww64whQ+ahXKgiCyHGpTGplO
 tkDHAjEfw==;
Received: from [2001:8b0:10b:1::eed] (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hzjX3-0000ay-PN; Mon, 19 Aug 2019 15:25:20 +0000
Message-ID: <32bc72da5d499125a1b3c620e1438b2e8c31f772.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 19 Aug 2019 17:25:16 +0200
In-Reply-To: <6487c442-d134-756a-e29d-81fae360a504@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <14720122f97667082d27153edd0e50aa6bc29e96.camel@infradead.org>
 <6487c442-d134-756a-e29d-81fae360a504@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============4925878514595485225=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4925878514595485225==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-8Q8jnnhqqmuSOHcai5KT"


--=-8Q8jnnhqqmuSOHcai5KT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-12 at 12:24 +0200, Jan Beulich wrote:
> On 09.08.2019 17:02, David Woodhouse wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -733,6 +733,17 @@ trampoline_setup:
> >          cmp     $sym_offs(__bootsym_seg_stop),%edi
> >          jb      1b
> > =20
> > +        /* Relocations for the boot data section. */
> > +        mov     sym_fs(trampoline_phys),%edx
> > +        add     $(boot_trampoline_end - boot_trampoline_start),%edx
> > +        mov     $sym_offs(__bootdatasym_rel_start),%edi
> > +1:
> > +        mov     %fs:(%edi),%eax
> > +        add     %edx,%fs:(%edi,%eax)
> > +        add     $4,%edi
> > +        cmp     $sym_offs(__bootdatasym_rel_stop),%edi
> > +        jb      1b
> > +
> >          /* Do not parse command line on EFI platform here. */
> >          cmpb    $0,sym_fs(efi_platform)
> >          jnz     1f
> > @@ -770,6 +781,11 @@ trampoline_setup:
> >          mov     $((boot_trampoline_end - boot_trampoline_start) / 4),%=
ecx
> >          rep movsl %fs:(%esi),%es:(%edi)
> > =20
> > +        /* Copy boot data template to low memory. */
> > +        mov     $sym_offs(bootdata_start),%esi
> > +        mov     $((bootdata_end - bootdata_start + 3) / 4),%ecx
> > +        rep movsl %fs:(%esi),%es:(%edi)
>=20
> The new data arrangement should be described in the commit message.
> Also just like for the trampoline copying I think it would be better
> if you suitable aligned bootdata_start and bootdata_end, such that
> you wouldn't need to add 3 here before dividing by 4.

Ack.

> > @@ -227,7 +231,7 @@ start64:
> >          .word   0
> >  idt_48: .word   0, 0, 0 # base =3D limit =3D 0
> >          .word   0
> > -gdt_48: .word   6*8-1
> > +gdt_48: .word   7*8-1
> >          .long   tramp32sym_rel(trampoline_gdt,4)
>=20
> You don't grow trampoline_gdt here, so I think this change is
> wrong. And if a change was needed at all (perhaps in the next
> patch), then I think it would be better to replace the use of
> literal numbers, using the difference of two labels instead
> (the "end" lable preferably being a .L-prefixed one).

I don't grow it but... count it =E2=98=BA.

I do start using sym_fs() here in places that it wasn't before, so the
incorrect size started to *matter* because the BOOT_FS selector wasn't
included in the limit.

I will make sure I explicitly comment on that in the commit message; no
need for a code comment to explain why the limit actually *does* match
the size of the table.

> > --- a/xen/arch/x86/boot/video.S
> > +++ b/xen/arch/x86/boot/video.S
> > @@ -15,10 +15,10 @@
> >  =20
> >   #include "video.h"
> >  =20
> > -/* Scratch space layout: boot_trampoline_end to boot_trampoline_end+0x=
1000. */
> > -#define modelist       bootsym(boot_trampoline_end)   /* 2kB (256 entr=
ies) */
> > -#define vesa_glob_info (modelist + 0x800)        /* 1kB */
> > -#define vesa_mode_info (vesa_glob_info + 0x400)  /* 1kB */
> > +/* Scratch space layout: bootdata_end to bootdata_end+0x1000. */
> > +#define modelist(t)       bootdatasym_rel(bootdata_end,2,t)         /*=
 2KiB (256 entries) */
> > +#define vesa_glob_info(t) bootdatasym_rel((bootdata_end+0x800),2,t) /*=
 1KiB */
> > +#define vesa_mode_info(t) bootdatasym_rel((bootdata_end+0xc00),2,t) /*=
 1KiB */
> >  =20
> >   /* Retrieve Extended Display Identification Data. */
> >   #define CONFIG_FIRMWARE_EDID
> > @@ -113,7 +113,7 @@ mopar2: movb    %al, _param(PARAM_VIDEO_LINES)
> >  =20
> >   # Fetching of VESA frame buffer parameters
> >   mopar_gr:
> > -        leaw    vesa_mode_info, %di
> > +        leaw    vesa_mode_info(%di)
>=20
> Just as a note, as I can't really see how to improve the situation:
> The embedding of the relocation offset (2) in the macros is making
> this code even more fragile, as they're now not usable anymore in
> an arbitrary way (consider e.g. their use for the memory operand if
> an insn which also requires an immediate). I think you want to at
> least warn about this restriction in the comment above.

Yeah. I file that one under "don't touch the VESA code unless you want
your brain to dribble out of your ears". Which was basically true
before I touched it too, in my defence =E2=98=BA.

> > @@ -291,6 +293,10 @@ SECTIONS
> >     DECL_SECTION(.data) {
> >          *(.data.page_aligned)
> >          *(.data)
> > +       . =3D ALIGN(16);
> > +       __bootdata_start =3D .;
> > +       *(.data.boot16)
> > +       __bootdata_end =3D .;
>=20
> Why 16-byte alignment?

Er... not sure. I think this (and the end) can be 4 as you suggest
elsewhere. Will make that change and retest.

> Having reached the end of the patch without seeing the C-level
> bootsym() go away (and as a result noticing that you didn't remove
> all uses) - could you please explain in the commit message what
> the replacement (or not) criteria are?

In the subsequent patch (6/6), bootsym() is indeed gone from C code,
and only trampsym() is left. The latter is for the permanent (not boot
time) trampoline used wakeup and for AP startup. As noted in the commit
message of that patch, the physical location of the Xen image isn't
mapped when those code paths run. So anything they need must be
relocated with them.



--=-8Q8jnnhqqmuSOHcai5KT
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkw
ODE5MTUyNTE2WjAvBgkqhkiG9w0BCQQxIgQgnoc2muvXUyU8QOBO4qPjMAH65RAho0MkWNzNunxj
d+Awgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAK4Ph7xNJRCtid1u9cVEfmh55GmYlEiHzjLhgfAaXMrji5lK2qiH07+it523GFIx
eR6lKAl6LWbHccIpUnwZBn3aFu15y1SodAWhfoQmpyDFd9UPkvK+mT6P3eki53zRx0RP9B3wLj+X
u7QqySGPeXrZIYggJAMbVojJkiWUo/Vx9FleyOs9z4pFsSRJWBoi2j2W3JfY4jH8w/ZWdwkCwMaC
QcTiY2FhtPol7H/BtXEAiwcD8Kl9hDWhWAX9m5axFxaGj+57zUdCIF7nGqEtKOVLUkJO8JAGWZAO
xyJaVLKKFcYtMl3QDDEQIY3qs5rtHdk5+/2C3WdoMLoto4xIgsIAAAAAAAA=


--=-8Q8jnnhqqmuSOHcai5KT--



--===============4925878514595485225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4925878514595485225==--


