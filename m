Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E721987DAA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:04:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6PB-000387-8O; Fri, 09 Aug 2019 15:02:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfSS=WF=merlin.srs.infradead.org=batv+726623fc28cc57e4ef8a+5829+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hw6P9-00036E-7U
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:02:07 +0000
X-Inumbo-ID: a6217b9a-bab6-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a6217b9a-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqXzwlXQxDwAMgGkBwjdpVp1k19sYdFAxaLjg/2LP90=; b=pP0m8Dmrw6rgEduRjQUbKKTL6
 MvXLGTCUL7I7Y/dVt9bUp231GLm4gEq5KFUA3ALV6wjIrjb9SBk28R5D5ePPjOV3bW410JoF57r9b
 8CtUBVgjStAkS4RogdLvOnXRan/UQH4i7BxEcpzWlhOr1xSscfnwha/GrpiOcqmIXf2n3B8VeqBi8
 iuhhOKaTmgF1o87wr62KOz3LyYOPxbcfKe8wjrobIbGPrUtMSklupt/EoJCAlGT5mLMCfwHzOD7av
 yhkjaxg8lTLpxzeXfWteuvk/QjJKPhNWMjI1VbLXCrMlxQvWzT3t7u0shSYbZG/Q6csnnqSefE+D7
 aC3+Z812Q==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hw6P5-0007j4-OM; Fri, 09 Aug 2019 15:02:03 +0000
Message-ID: <759652afb52a3258f0da44de61ed28d0875774f8.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 09 Aug 2019 16:02:02 +0100
In-Reply-To: <cover.1565362089.git.dwmw@amazon.co.uk>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH v2 4/6] x86/boot: Rename trampoline_{start,
 end} to boot_trampoline_{start, end}
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7037166200354700991=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7037166200354700991==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-ileI02YGYKTH+hEiGdzx"


--=-ileI02YGYKTH+hEiGdzx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

In preparation for splitting the boot and permanent trampolines from
each other. Some of these will change back, but most are boot so do the
plain search/replace that way first, then a subsequent patch will extract
the permanent trampoline code.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 xen/arch/x86/boot/head.S       | 12 ++++++------
 xen/arch/x86/boot/trampoline.S | 10 +++++-----
 xen/arch/x86/boot/video.S      |  4 ++--
 xen/arch/x86/efi/efi-boot.h    |  4 ++--
 xen/arch/x86/setup.c           |  4 ++--
 xen/arch/x86/tboot.c           |  6 +++---
 xen/arch/x86/x86_64/mm.c       |  2 +-
 xen/arch/x86/xen.lds.S         |  6 +++---
 xen/include/asm-x86/config.h   |  6 +++---
 9 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 07621d1a30..556dab127f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -754,20 +754,20 @@ trampoline_setup:
         cmpb    $0, sym_fs(skip_realmode)
         jz      1f
         /* If no-real-mode, jump straight to trampoline_protmode_entry */
-        lea     trampoline_protmode_entry-trampoline_start(%edi),%eax
+        lea     trampoline_protmode_entry-boot_trampoline_start(%edi),%eax
         /* EBX =3D=3D 0 indicates we are the BP (Boot Processor). */
         xor     %ebx,%ebx
         jmp     2f
 1:
         /* Go via 16-bit code in trampoline_boot_cpu_entry */
-        lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
+        lea     trampoline_boot_cpu_entry-boot_trampoline_start(%edi),%eax
 2:
         pushl   $BOOT_CS32
         push    %eax
=20
         /* Copy bootstrap trampoline to low memory, below 1MB. */
-        mov     $sym_offs(trampoline_start),%esi
-        mov     $((trampoline_end - trampoline_start) / 4),%ecx
+        mov     $sym_offs(boot_trampoline_start),%esi
+        mov     $((boot_trampoline_end - boot_trampoline_start) / 4),%ecx
         rep movsl %fs:(%esi),%es:(%edi)
=20
         /* Jump into the relocated trampoline. */
@@ -779,8 +779,8 @@ cmdline_parse_early:
 reloc:
 #include "reloc.S"
=20
-ENTRY(trampoline_start)
+ENTRY(boot_trampoline_start)
 #include "trampoline.S"
-ENTRY(trampoline_end)
+ENTRY(boot_trampoline_end)
=20
 #include "x86_64.S"
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.=
S
index 95a4bef553..26af9c6beb 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -31,7 +31,7 @@
  *                to be used for AP startup.
  */
 #undef bootsym
-#define bootsym(s) ((s)-trampoline_start)
+#define bootsym(s) ((s)-boot_trampoline_start)
=20
 #define bootsym_rel(sym, off, opnd...)     \
         bootsym(sym),##opnd;               \
@@ -47,7 +47,7 @@
         .long 111b - (off) - .;            \
         .popsection
=20
-#define bootdatasym(s) ((s)-trampoline_start)
+#define bootdatasym(s) ((s)-boot_trampoline_start)
 #define bootdatasym_rel(sym, off, opnd...) \
         bootdatasym(sym),##opnd;           \
 111:;                                      \
@@ -56,7 +56,7 @@
         .popsection
=20
 #undef trampsym
-#define trampsym(s) ((s)-trampoline_start)
+#define trampsym(s) ((s)-boot_trampoline_start)
=20
 #define trampsym_rel(sym, off, opnd...)    \
         trampsym(sym),##opnd;              \
@@ -66,7 +66,7 @@
         .popsection
=20
 #undef tramp32sym
-#define tramp32sym(s) ((s)-trampoline_start)
+#define tramp32sym(s) ((s)-boot_trampoline_start)
=20
 #define tramp32sym_rel(sym, off, opnd...)  \
         tramp32sym(sym),##opnd;            \
@@ -232,7 +232,7 @@ gdt_48: .word   6*8-1
=20
 /* The first page of trampoline is permanent, the rest boot-time only. */
 /* Reuse the boot trampoline on the 1st trampoline page as stack for wakeu=
p. */
-        .equ    wakeup_stack, trampoline_start + PAGE_SIZE
+        .equ    wakeup_stack, boot_trampoline_start + PAGE_SIZE
         .global wakeup_stack
=20
 /* From here on early boot only. */
diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
index 03907e9e9a..5087c6a4d5 100644
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -15,8 +15,8 @@
=20
 #include "video.h"
=20
-/* Scratch space layout: trampoline_end to trampoline_end+0x1000. */
-#define modelist       bootsym(trampoline_end)   /* 2kB (256 entries) */
+/* Scratch space layout: boot_trampoline_end to boot_trampoline_end+0x1000=
. */
+#define modelist       bootsym(boot_trampoline_end)   /* 2kB (256 entries)=
 */
 #define vesa_glob_info (modelist + 0x800)        /* 1kB */
 #define vesa_mode_info (vesa_glob_info + 0x400)  /* 1kB */
=20
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 556942482e..fc2ea554b5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -232,7 +232,7 @@ static void __init noreturn efi_arch_post_exit_boot(voi=
d)
     u64 cr4 =3D XEN_MINIMAL_CR4 & ~X86_CR4_PGE, efer;
=20
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
-    memcpy((void *)trampoline_phys, trampoline_start, cfg.size);
+    memcpy((void *)trampoline_phys, boot_trampoline_start, cfg.size);
=20
     /* Set system registers and transfer control. */
     asm volatile("pushq $0\n\tpopfq");
@@ -566,7 +566,7 @@ static void __init efi_arch_memory_setup(void)
     cfg.addr =3D 0x100000;
=20
     if ( efi_enabled(EFI_LOADER) )
-        cfg.size =3D trampoline_end - trampoline_start;
+        cfg.size =3D boot_trampoline_end - boot_trampoline_start;
     else
         cfg.size =3D TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
=20
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index decea2e77a..06e779368c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1879,8 +1879,8 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     if ( !xen_regions[0].s )
     {
         /* S3 resume code (and other real mode trampoline code) */
-        xen_regions[region_s3].s =3D bootsym_phys(trampoline_start);
-        xen_regions[region_s3].e =3D bootsym_phys(trampoline_end);
+        xen_regions[region_s3].s =3D bootsym_phys(boot_trampoline_start);
+        xen_regions[region_s3].e =3D bootsym_phys(boot_trampoline_end);
=20
         /*
          * This needs to remain in sync with the uses of the same symbols =
in
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index f3fdee4d39..325d94d23a 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -369,9 +369,9 @@ void tboot_shutdown(uint32_t shutdown_type)
          */
         g_tboot_shared->num_mac_regions =3D 3;
         /* S3 resume code (and other real mode trampoline code) */
-        g_tboot_shared->mac_regions[0].start =3D bootsym_phys(trampoline_s=
tart);
-        g_tboot_shared->mac_regions[0].size =3D bootsym_phys(trampoline_en=
d) -
-                                              bootsym_phys(trampoline_star=
t);
+        g_tboot_shared->mac_regions[0].start =3D bootsym_phys(boot_trampol=
ine_start);
+        g_tboot_shared->mac_regions[0].size =3D bootsym_phys(boot_trampoli=
ne_end) -
+                                              bootsym_phys(boot_trampoline=
_start);
         /* hypervisor .text + .rodata */
         g_tboot_shared->mac_regions[1].start =3D (uint64_t)__pa(&_stext);
         g_tboot_shared->mac_regions[1].size =3D __pa(&__2M_rodata_end) -
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 1919cae18b..149cc4f7b5 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -697,7 +697,7 @@ void __init zap_low_mappings(void)
=20
     /* Replace with mapping of the boot trampoline only. */
     map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
-                     PFN_UP(trampoline_end - trampoline_start),
+                     PFN_UP(boot_trampoline_end - boot_trampoline_start),
                      __PAGE_HYPERVISOR);
 }
=20
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 400dffaf23..6968262a60 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -377,12 +377,12 @@ ASSERT(IS_ALIGNED(cpu0_stack, STACK_SIZE), "cpu0_stac=
k misaligned")
 ASSERT(IS_ALIGNED(__init_begin, PAGE_SIZE), "__init_begin misaligned")
 ASSERT(IS_ALIGNED(__init_end,   PAGE_SIZE), "__init_end misaligned")
=20
-ASSERT(IS_ALIGNED(trampoline_start, 4), "trampoline_start misaligned")
-ASSERT(IS_ALIGNED(trampoline_end,   4), "trampoline_end misaligned")
+ASSERT(IS_ALIGNED(boot_trampoline_start, 4), "boot_trampoline_start misali=
gned")
+ASSERT(IS_ALIGNED(boot_trampoline_end,   4), "boot_trampoline_end misalign=
ed")
 ASSERT(IS_ALIGNED(__bss_start,      8), "__bss_start misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        8), "__bss_end misaligned")
=20
-ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_=
MIN,
+ASSERT((boot_trampoline_end - boot_trampoline_start) < TRAMPOLINE_SPACE - =
MBI_SPACE_MIN,
     "not enough room for trampoline and mbi data")
 ASSERT((wakeup_stack - wakeup_stack_start) >=3D WAKEUP_STACK_MIN,
     "wakeup stack too small")
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index 6e4f28d934..ada8c7b4f6 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -90,11 +90,11 @@
 #ifndef __ASSEMBLY__
 extern unsigned long trampoline_phys;
 #define bootsym_phys(sym)                                 \
-    (((unsigned long)&(sym)-(unsigned long)&trampoline_start)+trampoline_p=
hys)
+    (((unsigned long)&(sym)-(unsigned long)&boot_trampoline_start)+trampol=
ine_phys)
 #define bootsym(sym)                                      \
     (*RELOC_HIDE((typeof(&(sym)))__va(__pa(&(sym))),      \
-                 trampoline_phys-__pa(trampoline_start)))
-extern char trampoline_start[], trampoline_end[];
+                 trampoline_phys-__pa(boot_trampoline_start)))
+extern char boot_trampoline_start[], boot_trampoline_end[];
 extern char trampoline_realmode_entry[];
 extern unsigned int trampoline_xen_phys_start;
 extern unsigned char trampoline_cpu_started;


--=-ileI02YGYKTH+hEiGdzx
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
ODA5MTUwMjAyWjAvBgkqhkiG9w0BCQQxIgQgBCKUHwrmdV5T4FKfo0CXF62VpfdReNXyIndIIDeq
cGEwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAHBCPfnW2xrIgtUPp6u95MsdWs+uVKKNSQkC5whSdxFBrxVdCwM1sIXfBpcbp/jh
mtDcnyRG9OtDrjRwommy49lMvoNSPdbmlTHXDUNZE8QfxMmzHMCeh84fhLn9HbO2cecgda9RIrY/
2zqWwLqGE73UFQ/c2slNFlfztd39D/EoNiBtilVn3OCRZWYfj6m2lG54yJ1wGrUsym/sNlwAHpaq
Zv10/yx16S4sYoTCLRJMCdLCMvS7r6NvySmgi0+SJDqEewySuJ/hBommVO/N8J3JKmgdv4LFaten
XtafMavFaQgY3GHVNM9j5Cnctd43a8opLs2xr6wTS6kmH1kX2MwAAAAAAAA=


--=-ileI02YGYKTH+hEiGdzx--



--===============7037166200354700991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7037166200354700991==--


