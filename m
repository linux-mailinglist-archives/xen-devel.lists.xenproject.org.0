Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A48A3C04
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 18:28:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3jiT-0004BH-Qr; Fri, 30 Aug 2019 16:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o4/1=W2=merlin.srs.infradead.org=batv+534f0a6dd087dad51536+5850+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i3jiS-0004BC-7z
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 16:25:36 +0000
X-Inumbo-ID: ca3d67c4-cb42-11e9-b95f-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca3d67c4-cb42-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lQOMV47tGYaKlB1bX6Cv6zc1MSAZqUbGFdzkuVYHW0c=; b=2myZA1m70YfpxLvI9FnLL9V4o
 6rLIEuSkXxSQ1bWmixvLyd2hXBM+roF15n1FA2fYjV5WJ80vCEja0IaCJGQQmed1/coy4DIlXsJZP
 il//sOqV8gp+ymG2shJrxChWNDXF0HzKmjVeE63XVT0FKcnMtzC2G8Km88zltamiZWmtvapZ2LQLy
 I1XKJUlj4RdH38GFt+B+9mDcYja7DN1CO91k8qxxNVxn+NCBv0tmyL8sC2/WXVHJxPXgEYVighZaR
 HfF/TFu9kq/PgKTLmkC/jUG3R6yM6WRMs4K/S7UILzSVboz46MnuytZttWurUmSMTppTuwXMVrNAp
 GRbQFlrMQ==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i3jiM-00063v-Tx; Fri, 30 Aug 2019 16:25:31 +0000
Message-ID: <05a88a2bb876b3a165746b91774dc6ee05d86b03.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Fri, 30 Aug 2019 17:25:29 +0100
In-Reply-To: <babca242-db4b-ca59-a1c0-bc1948f9c5b0@suse.com>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
 <20190821163542.172063-4-dwmw2@infradead.org>
 <babca242-db4b-ca59-a1c0-bc1948f9c5b0@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/boot: Copy 16-bit boot variables
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============7667603138867600848=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7667603138867600848==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-4LFwZ8ObNbi1D7qaVppu"


--=-4LFwZ8ObNbi1D7qaVppu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-30 at 17:43 +0200, Jan Beulich wrote:
> On 21.08.2019 18:35, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Ditch the bootsym() access from C code for the variables populated by
> > 16-bit boot code. As well as being cleaner this also paves the way for
> > not having the 16-bit boot code in low memory for no-real-mode or EFI
> > loader boots at all.
> >=20
> > These variables are put into a separate .data.boot16 section and
> > accessed in low memory during the real-mode boot, then copied back to
> > their native location in the Xen image when real mode has finished.
> >=20
> > Fix the limit in gdt_48 to admit that trampoline_gdt actually includes
> > 7 entries, since we do now use the seventh (BOOT_FS) in late code so it
> > matters. Andrew has a patch to further tidy up the GDT and initialise
> > accessed bits etc., so I won't go overboard with more than the trivial
> > size fix for now.
> >=20
> > The bootsym() macro remains in C code purely for the variables which
> > are written for the later AP startup and wakeup trampoline to use.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  xen/arch/x86/boot/edd.S           |  2 ++
> >  xen/arch/x86/boot/head.S          | 16 +++++++++++++++
> >  xen/arch/x86/boot/mem.S           |  2 ++
> >  xen/arch/x86/boot/trampoline.S    | 33 ++++++++++++++++++++++++++++---
> >  xen/arch/x86/boot/video.S         | 30 +++++++++++++++-------------
> >  xen/arch/x86/platform_hypercall.c | 18 ++++++++---------
> >  xen/arch/x86/setup.c              | 22 ++++++++++-----------
> >  xen/arch/x86/xen.lds.S            |  9 ++++++++-
> >  xen/include/asm-x86/edd.h         |  1 -
> >  9 files changed, 94 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
> > index 434bbbd960..138d04c964 100644
> > --- a/xen/arch/x86/boot/edd.S
> > +++ b/xen/arch/x86/boot/edd.S
> > @@ -163,6 +163,7 @@ edd_done:
> >  .Ledd_mbr_sig_skip:
> >          ret
> > =20
> > +        .pushsection .data.boot16, "aw", @progbits
> >  GLOBAL(boot_edd_info_nr)
> >          .byte   0
> >  GLOBAL(boot_mbr_signature_nr)
> > @@ -171,3 +172,4 @@ GLOBAL(boot_mbr_signature)
> >          .fill   EDD_MBR_SIG_MAX*8,1,0
> >  GLOBAL(boot_edd_info)
> >          .fill   EDD_INFO_MAX * (EDDEXTSIZE + EDDPARMSIZE), 1, 0
> > +        .popsection
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 4118f73683..6d315020d2 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -725,6 +725,17 @@ trampoline_setup:
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
> > @@ -762,6 +773,11 @@ trampoline_setup:
> >          mov     $((boot_trampoline_end - boot_trampoline_start) / 4),%=
ecx
> >          rep movsl %fs:(%esi),%es:(%edi)
> > =20
> > +        /* Copy boot data template to low memory. */
> > +        mov     $sym_offs(bootdata_start),%esi
> > +        mov     $((bootdata_end - bootdata_start) / 4),%ecx
> > +        rep movsl %fs:(%esi),%es:(%edi)
>=20
> Afaict neither bootdata_start nor bootdata_end are aligned, and so
> the difference isn't necessarily a multiple of 4. In fact the
> other (preexisting) movsl looks to have the same issue; I wonder
> if we propagate bad EDID data for that reason on certain builds /
> in certain versions.

Hm, I'm not sure I quite realised the distinction between
bootdata_start and __bootdata_start (and likewise _end).

Now that things are placed in the .data.boot16 section by
.pushsection/.popsection can we rely on the ordering, and that the
globals in the .S files are actually at the start and end?

I thought we *needed* to use the ones in the linker script, and what I
should probably do here is kill bootdata_start/bootdata_end completely
and rely only on the ones from the linker script?

Either that or I should kill the ones in the linker script completely.

> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -47,11 +47,15 @@
> >          .long 111b - (off) - .;            \
> >          .popsection
> > =20
> > -#define bootdatasym(s) ((s)-boot_trampoline_start)
> > +        .pushsection .data.boot16, "aw", @progbits
> > +GLOBAL(bootdata_start)
> > +        .popsection
> > +
> > +#define bootdatasym(s) ((s)-bootdata_start+(boot_trampoline_end-boot_t=
rampoline_start))
>=20
> Please can you add the missing blanks around the binary operators
> here? (I should perhaps asked this already on the earlier patch
> adding this #define.) Also it looks like the line might be overly
> long.

Ack.

> > --- a/xen/arch/x86/boot/video.S
> > +++ b/xen/arch/x86/boot/video.S
> > @@ -15,10 +15,10 @@
> > =20
> >  #include "video.h"
> > =20
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
>=20
> Didn't you agree to extend the comment to warn about the risk resulting
> from the literal 2-s in here?

I think I didn't explicitly respond to that paragraph, and thus I
missed it when I went back through the emails to check I'd caught
everything. Will do it this time; apologies for missing it.

> > @@ -290,6 +292,11 @@ SECTIONS
> >    DECL_SECTION(.data) {
> >         *(.data.page_aligned)
> >         *(.data)
> > +       . =3D ALIGN(4);
> > +       __bootdata_start =3D .;
> > +       *(.data.boot16)
> > +       . =3D ALIGN(4);
> > +       __bootdata_end =3D .;
>=20
> What do you need the labels for here? And once they're gone the ALIGN()
> won't belong here anymore either - suitable alignment should be enforced
> by the contributions to the section.

See above. Am I right to be concerned about the fragility of putting
the symbols in the .S files? Doing it in the linker script is more
robust, isn't it?

I know we *currently* build everything with #include from one huge .S
file and thus we do know that they'll end up first/last as we desire,
and it doesn't depend on link order or any crap like that. But I don't
like depending on that.

--=-4LFwZ8ObNbi1D7qaVppu
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
ODMwMTYyNTI5WjAvBgkqhkiG9w0BCQQxIgQgLBQdikpMu3tb7Lk8JJnp8fCD21cDOGD6nj2DgbuT
z6Iwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAI/AnKdxiKlCZqRr1fwFqJWmsXIUTH1KU94Zo7HU7MCfLJyjlvXIG/xoF3fIrm0+
tBdx8ixg5rztR7b7vHbJBT6YgvPpct4MrP2EjrKXGRIMYL5vXX8On2bRXkkkjFaqPqSYx0hjpsUN
WX8gBhJF5MQQ0aIK+7zuJw/cOyND8Gh0LiWMPLFYrPmOBFr6mX8LfChes6l5QpiMGaUU8nf6z1aG
pAItTPflNRqvMF5goPws8F5ckdvIjwSdG+1E+Nng4xOXer2LEFKJsxYJmODMfhDRkIWSFHyR+2p3
XzzTADFEm3Y7jP6kUtizA8AU5eEZfOX07Cf5vBbOjqIh+NZjON4AAAAAAAA=


--=-4LFwZ8ObNbi1D7qaVppu--



--===============7667603138867600848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7667603138867600848==--


