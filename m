Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87392858
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 17:29:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzjXN-00047i-DU; Mon, 19 Aug 2019 15:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9RKc=WP=merlin.srs.infradead.org=batv+8bc00d32ecc795eaca9c+5839+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hzjXK-00047H-WF
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 15:25:35 +0000
X-Inumbo-ID: 95394cc4-c295-11e9-a661-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95394cc4-c295-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KlQdvtUCaUMrrjYzDh8M4Ww48nCTxxAHvoRVFRqxTGA=; b=rmZmDYxrRYo6pN8OzsDB8gL57
 /s9nLlVTMDOrSlGZ7RtHaCATQ8x6RM4ridt/UINPrNjtMTnMn11WQZ+4dmrlw/BFFALCuaFH3g1uw
 JOHDt/KL8KGfTTsGt1Knqi6LEPj5fJCvP2gDXP0rx0hhvIsKeVdIzvI1NyPUA/Lb64AHkaCXO7c8Q
 83gALYCOZzW4F3BXOpkQN8zAMynBT68Sjrnyg+B4YfN+eNb3wSx73NXrhSBdlc3YTTDSEIMeL/GYC
 ZSKBu1YgYsY55RemWBXRMPQv21J4JyQmi+oAZHU2YnWLKCCCmnssOF1ihZSy3Y0Wumfqis1clL/0d
 NJKJRvCNw==;
Received: from [2001:8b0:10b:1::eed] (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hzjXH-0000bK-Fb; Mon, 19 Aug 2019 15:25:31 +0000
Message-ID: <a2143ee639599afb848e168d0f741c5130f7a241.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 19 Aug 2019 17:25:30 +0200
In-Reply-To: <5f867a0d-036f-9800-5347-7c4d109cce47@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <c0e531fc665c9ad7595d853e2ce631a13974c022.camel@infradead.org>
 <5f867a0d-036f-9800-5347-7c4d109cce47@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86/boot: Do not use trampoline for
 no-real-mode boot paths
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
Content-Type: multipart/mixed; boundary="===============0450153392000056255=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0450153392000056255==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-GDe8LrerT1UmmPji8sm+"


--=-GDe8LrerT1UmmPji8sm+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-12 at 12:55 +0200, Jan Beulich wrote:
> On 09.08.2019 17:02, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Where booted from EFI or with no-real-mode, there is no need to stomp
> > on low memory with the 16-boot code. Instead, just go straight to
> > trampoline_protmode_entry() at its physical location within the Xen
> > image.
> >=20
> > For now, the boot code (including the EFI loader path) still determines
> > what the trampoline_phys address should be. The trampoline is actually
> > relocated for that address and copied into low memory, from a
> > relocate_trampoline() call made from __start_xen().
>=20
> I assume this talks about the real mode part of the trampoline, as
> opposed to the next paragraph? Would be nice if you made this
> explicit.

This is the permanent real-mode trampoline used for AP startup and
wakeup, not the real-mode boot code (which the boot code has to have
put there for itself it it wanted it).

I will try to make the commit message clearer; thanks for pointing it
out.

> > For subsequent AP startup and wakeup, the 32-bit trampoline can't
> > trivially be used in-place as that region isn't mapped. So copy it
> > down to low memory too, having relocated it (again) to work from
> > there.
>=20
> trampoline_protmode_entry gets entered with CR0.PG=3D0, i.e. at
> that point there's not even the question yet of there being a
> mapping. Subsequently idle_pg_table gets loaded into CR3. I wonder
> if, rather than relocating the 32-bit part of the trampoline, it
> wouldn't be better to install a 1:1 mapping into idle_pg_table.
> Such a mapping would need to have the G bits clear in order to
> not conflict with PV guest mappings of the same linear addresses.

Yeah, I tried making that happen. It made me sad. This seemed to be
simpler and less fragile.

> > --- a/xen/arch/x86/acpi/power.c
> > +++ b/xen/arch/x86/acpi/power.c
> > @@ -152,9 +152,9 @@ static void acpi_sleep_prepare(u32 state)
> >           return;
> >  =20
> >       if ( acpi_sinfo.vector_width =3D=3D 32 )
> > -        *(uint32_t *)wakeup_vector_va =3D bootsym_phys(wakeup_start);
> > +        *(uint32_t *)wakeup_vector_va =3D trampsym_phys(wakeup_start);
> >       else
> > -        *(uint64_t *)wakeup_vector_va =3D bootsym_phys(wakeup_start);
> > +        *(uint64_t *)wakeup_vector_va =3D trampsym_phys(wakeup_start);
> >   }
> >  =20
> >   static void acpi_sleep_post(u32 state) {}
> > @@ -388,7 +388,7 @@ static void tboot_sleep(u8 sleep_state)
> >       g_tboot_shared->acpi_sinfo.wakeup_vector =3D acpi_sinfo.wakeup_ve=
ctor;
> >       g_tboot_shared->acpi_sinfo.vector_width =3D acpi_sinfo.vector_wid=
th;
> >       g_tboot_shared->acpi_sinfo.kernel_s3_resume_vector =3D
> > -                                              bootsym_phys(wakeup_star=
t);
> > +                                              trampsym_phys(wakeup_sta=
rt);
>=20
> Shouldn't changes like these have happened earlier, when you
> introduce the (logical only at that point) distinction between
> trampoline pieces?

That was in assembler code. This is C, which never had to be that
involved with the distinction. But now that all the dust has settled,
I'm making it consistent, using 'trampsym' for stuff in the permanent
trampoline just like the asm code does.


> > @@ -97,7 +100,7 @@ GLOBAL(trampoline_realmode_entry)
> >          cld
> >          cli
> >          lidt    trampsym(idt_48)
> > -        lgdt    trampsym(gdt_48)
> > +        lgdtl   trampsym(gdt_48)
>=20
> Stray / unrelated change (and if needed, then also for lidt)?

The difference between 16bit l.dt and 32-bit l.dtl is that the former
only loads 24 bits of the actual table address (trampoline_gdt in this
case).

Thus, when trampoline_gdt is being used in-place, as it is during early
boot, and *if* the Xen image is loaded higher than 16MiB, lgdt doesn't
work. That's half a day of my life I want back.

It doesn't matter for lidt because we're just loading an empty limit
and pointer there, and we don't care about bits 24-31 of a zero value.

> > @@ -236,11 +239,23 @@ gdt_48: .word   7*8-1
> >  =20
> >   /* The first page of trampoline is permanent, the rest boot-time only=
. */
> >   /* Reuse the boot trampoline on the 1st trampoline page as stack for =
wakeup. */
> > -        .equ    wakeup_stack, boot_trampoline_start + PAGE_SIZE
> > +        .equ    wakeup_stack, perm_trampoline_start + PAGE_SIZE
> >           .global wakeup_stack
> >  =20
> > +ENTRY(perm_trampoline_end)
> > +
> >   /* From here on early boot only. */
> >  =20
> > +ENTRY(boot_trampoline_start)
> > +
> > +        .word   0
> > +boot16_idt:
> > +        .word   0, 0, 0 # base =3D limit =3D 0
> > +        .word   0
> > +boot16_gdt:
> > +        .word   7*8-1
> > +        .long   tramp32sym_rel(trampoline_gdt,4)
>=20
> Can we really not get away without a second copy of these?

Probably, but my judgement was that the complexity and the pain of
doing so would exceed the benefit. I'll take another look at doing so.

> > @@ -304,8 +319,8 @@ trampoline_boot_cpu_entry:
> >           cli
> >  =20
> >           /* Reset GDT and IDT. Some BIOSes clobber GDTR. */
> > -        lidt    bootsym(idt_48)
> > -        lgdt    bootsym(gdt_48)
> > +        lidt    bootsym(boot16_idt)
> > +        lgdtl   bootsym(boot16_gdt)
>=20
> As above - either both should gain a suffix, or neither of them.
>=20
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -682,6 +682,42 @@ static unsigned int __init copy_bios_e820(struct e=
820entry *map, unsigned int li
> >       return n;
> >   }
> >  =20
> > +extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
> > +extern const s32 __trampoline32_rel_start[], __trampoline32_rel_stop[]=
;
> > +
> > +static void __init relocate_trampoline(unsigned long phys)
> > +{
> > +    const s32 *trampoline_ptr;
> > +    uint32_t tramp32_delta =3D 0;
> > +
> > +    /* Apply relocations to trampoline. */
> > +    for ( trampoline_ptr =3D __trampoline_rel_start;
> > +          trampoline_ptr < __trampoline_rel_stop;
> > +          ++trampoline_ptr )
> > +        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> > +
> > +    tramp32_delta =3D phys;
>=20
> Any reason this can't be the initializer of the variable, or the
> zero initializer above can't be dropped?

I can't think of one. I think I quite like the initial setting of
tramp32_delta=3Dphys to live *right* above the subsequent if(something)
tramp32_delta-=3Dsomething, to make it very clear what that calculation
is.

So maybe I'll just drop the pointless =3D0 initialiser.

> > +    if (!efi_enabled(EFI_LOADER)) {
>=20
> Style (missing blanks inside the parentheses, and brace to go on
> its own line).

Ack. You can take the Linux hacker out of the Linux kernel but...

> > --- a/xen/include/asm-x86/config.h
> > +++ b/xen/include/asm-x86/config.h
> > @@ -89,12 +89,12 @@
> > =20
> >  #ifndef __ASSEMBLY__
> >  extern unsigned long trampoline_phys;
> > -#define bootsym_phys(sym)                                 \
> > -    (((unsigned long)&(sym)-(unsigned long)&boot_trampoline_start)+tra=
mpoline_phys)
> > -#define bootsym(sym)                                      \
> > +#define trampsym_phys(sym)                                 \
> > +    (((unsigned long)&(sym)-(unsigned long)&perm_trampoline_start)+tra=
mpoline_phys)
> > +#define trampsym(sym)                                      \
> >      (*RELOC_HIDE((typeof(&(sym)))__va(__pa(&(sym))),      \
> > -                 trampoline_phys-__pa(boot_trampoline_start)))
> > -extern char boot_trampoline_start[], boot_trampoline_end[];
> > +                 trampoline_phys-__pa(perm_trampoline_start)))
>=20
> As you're touching these, could you please also insert the missing
> blanks around the binary + and - ?

Will do. Thanks.


--=-GDe8LrerT1UmmPji8sm+
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
ODE5MTUyNTMwWjAvBgkqhkiG9w0BCQQxIgQgYdMBAbXTCZ22ODSC9cvb8yP8Teu2w7zzZIjgHwMp
0Rgwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAKAyDbNF8YSeD95Ysna7uVKXzLG/YezznlYN9tKXf/r8FyVxbQP+MRXCW4vYSfdO
Hb4rDLus8fTnqfWlMcXY6D7RxLrndPhJMsTm1AeC6gMucer6ju4QuoRj7/2UpBeOS5EGc8MI6hPM
ze9bVFp0KLnnxv/rPclJLyk8sWPG4fPa7Mt9JjupMYxDXV+jujePRGn7DCsKeOjTADk4bYIncoLP
nlid0gw73CKuUOZ8rPe7gA3//jPfuD2Mjd5+CHLi/M9QZOsK0XECHo6AVAw6+lopo1vUrG07CxkQ
MiV0sES4DgFG74XjRHhKS2hgIlUzlJot9wDPxD2LoZUH7xHEH8QAAAAAAAA=


--=-GDe8LrerT1UmmPji8sm+--



--===============0450153392000056255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0450153392000056255==--


