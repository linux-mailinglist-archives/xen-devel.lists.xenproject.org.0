Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE7C3FAB48
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 14:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174668.318458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKJmW-0000v1-8J; Sun, 29 Aug 2021 12:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174668.318458; Sun, 29 Aug 2021 12:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKJmW-0000sv-59; Sun, 29 Aug 2021 12:19:24 +0000
Received: by outflank-mailman (input) for mailman id 174668;
 Sun, 29 Aug 2021 12:19:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6aKm=NU=invisiblethingslab.com=demi@srs-us1.protection.inumbo.net>)
 id 1mKJmU-0000sp-Ha
 for xen-devel@lists.xenproject.org; Sun, 29 Aug 2021 12:19:22 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffd4ce76-1eaa-47fd-9b43-cfdd3315ec41;
 Sun, 29 Aug 2021 12:19:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2904C320082A;
 Sun, 29 Aug 2021 08:19:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 29 Aug 2021 08:19:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 08:19:14 -0400 (EDT)
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
X-Inumbo-ID: ffd4ce76-1eaa-47fd-9b43-cfdd3315ec41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=2EOZI1kciWaygQyMETTjlMRivpvez
	UzmahsFnp7e2/w=; b=fU2bs+fu0/CZZW6Z/2JrWvCcn6qiOhBJq1/TpuzNg/9fW
	+EPMmAVg71nM7nJUxSujz/HoECjed4SYlTPXt5VHv+N0BnTdMCLRDQhqsRHX7lQO
	ENZ8L6jperWUBgzgXO1fR89pWGmyV3nE/5Ggz+hpv7Wq9GCpXfK2c8lXQU19rBga
	7Qh8GcLybj7YA8J8GNeFK7COY9kiwCnGIhF9RJK8zJonmL9FJyPyB3lyatyByzp7
	gkT6apyaNuOHaqcje2WelRfkzqRGDuQuDqr0ub5eTOxkJnaxUgpn6m7ZzVTP1xwS
	MLn7psTqN3pNEclw/20KsYu5ySzGrcMSkn6yURd1Q==
X-ME-Sender: <xms:RXsrYfdC5n_kVJsN555fQbPJY0KcUvpdode-l90th-DVleby_s07_w>
    <xme:RXsrYVOJ3op68IgC3IuOLEbcHHFrHe9jHlsMm26Sg9xJvYi9zAjmR6J6T3nju39s6
    5wO4Ce2WRTN68c>
X-ME-Received: <xmr:RXsrYYhiBZr2hn6APT7fxssqsG77rrQATfnhYVynUS6dtMRCbNDncGBX8r0YuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuveeguefgvdeiueejfedugeevleefteek
    udefheetuddvtdduvefggfeghedtffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RXsrYQ-QFHUNGSzr7X5J02MARgB7kWUTSWpxL-woA76f_uCLGGSuWw>
    <xmx:RXsrYbuURl-Gf0eL4NIxzmVEWEbegHQ45jOnZ6xfK5B2F7Mykdg8iw>
    <xmx:RXsrYfHx98Fx8U7Pg9MzgJ2LBllraiytLfM6qjxXFSkyKVIYsuvioA>
    <xmx:RnsrYU8OmUtuT55GVRPVWYzXWh-D2hoNu1Z_zvo9g0Seup8JuYqepw>
Date: Sun, 29 Aug 2021 08:18:57 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH] Grab the EFI System Reference Table and check it
Message-ID: <YSt7P0a63GCxygAa@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Na29geeagoyx7X7"
Content-Disposition: inline


--9Na29geeagoyx7X7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Aug 2021 08:18:57 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH] Grab the EFI System Reference Table and check it

The EFI System Reference Table (ESRT) is necessary for fwupd to identify
firmware updates to install.  According to the UEFI specification =A723.4,
the table shall be stored in memory of type EfiBootServicesData.
Therefore, Xen must avoid reusing that memory for other purposes, so
that Linux can access the ESRT.

See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
for details.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/arm/efi/efi-boot.h |  9 ++--
 xen/arch/x86/efi/efi-boot.h |  5 ++-
 xen/common/efi/boot.c       | 90 +++++++++++++++++++++++++++++++++++--
 xen/common/efi/runtime.c    |  1 +
 xen/include/efi/efiapi.h    |  3 ++
 xen/include/xen/efi.h       |  1 +
 6 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index cf9c37153f..d8de478022 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -142,7 +142,8 @@ static bool __init meminfo_add_bank(struct meminfo *mem,
=20
 static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRI=
PTOR *map,
                                                 UINTN mmap_size,
-                                                UINTN desc_size)
+                                                UINTN desc_size,
+                                                const EFI_MEMORY_DESCRIPTO=
R *const esrt_desc)
 {
     int Index;
     EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map;
@@ -154,6 +155,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
               desc_ptr->Type =3D=3D EfiLoaderCode ||
               desc_ptr->Type =3D=3D EfiLoaderData ||
               (!map_bs &&
+               desc !=3D esrt_desc &&
                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
         {
@@ -359,11 +361,12 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
                                                void *map,
                                                UINTN map_size,
                                                UINTN desc_size,
-                                               UINT32 desc_ver)
+                                               UINT32 desc_ver,
+                                               const EFI_MEMORY_DESCRIPTOR=
 *const esrt_desc)
 {
     EFI_STATUS status;
=20
-    status =3D efi_process_memory_map_bootinfo(map, map_size, desc_size);
+    status =3D efi_process_memory_map_bootinfo(map, map_size, desc_size, e=
srt_desc);
     if ( EFI_ERROR(status) )
         blexit(L"EFI memory map processing failed");
=20
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index fb217031ff..f381855368 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -154,7 +154,8 @@ static void __init efi_arch_process_memory_map(EFI_SYST=
EM_TABLE *SystemTable,
                                                void *map,
                                                UINTN map_size,
                                                UINTN desc_size,
-                                               UINT32 desc_ver)
+                                               UINT32 desc_ver,
+                                               const EFI_MEMORY_DESCRIPTOR=
 *const esrt_desc)
 {
     struct e820entry *e;
     unsigned int i;
@@ -171,7 +172,7 @@ static void __init efi_arch_process_memory_map(EFI_SYST=
EM_TABLE *SystemTable,
         {
         case EfiBootServicesCode:
         case EfiBootServicesData:
-            if ( map_bs )
+            if ( map_bs || desc =3D=3D esrt_desc )
             {
         default:
                 type =3D E820_RESERVED;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 758f9d74d2..0603172074 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -93,6 +93,23 @@ typedef struct _EFI_LOAD_OPTION {
     CHAR16 Description[];
 } EFI_LOAD_OPTION;
=20
+struct esrt_entry {
+    EFI_GUID fw_class;
+    uint32_t fw_type;
+    uint32_t fw_version;
+    uint32_t fw_lowest_supported_version;
+    uint32_t fw_capsule_flags;
+    uint32_t fw_last_attempt_version;
+    uint32_t fw_last_attempt_status;
+};
+
+struct esrt {
+    uint32_t esrt_count;
+    uint32_t esrt_max;
+    uint64_t esrt_version;
+    struct esrt_entry esrt_entries[];
+};
+
 #define LOAD_OPTION_ACTIVE              0x00000001
=20
 union string {
@@ -166,6 +183,41 @@ static void __init PrintErr(const CHAR16 *s)
     StdErr->OutputString(StdErr, (CHAR16 *)s );
 }
=20
+enum esrt_status {
+    ESRT_NOTFOUND =3D 0,
+    ESRT_GOOD,
+    ESRT_BAD,
+};
+
+static enum esrt_status __init is_esrt_valid(
+    const EFI_MEMORY_DESCRIPTOR *const desc) {
+    size_t available_len, esrt_len, len;
+    const uintptr_t physical_start =3D desc->PhysicalStart;
+    const uintptr_t esrt =3D efi.esrt;
+    const struct esrt *esrt_ptr;
+
+    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
+        return ESRT_BAD;
+    if ( physical_start > esrt || esrt - physical_start >=3D len )
+        return ESRT_NOTFOUND;
+    if ( ! ( desc->Attribute & EFI_MEMORY_RUNTIME ) &&
+           ( desc->Type !=3D EfiRuntimeServicesData ) &&
+           ( desc->Type !=3D EfiBootServicesData ) )
+        return ESRT_BAD;
+    available_len =3D len - (esrt - physical_start);
+    if ( available_len < offsetof(struct esrt, esrt_entries) )
+        return ESRT_BAD;
+    esrt_ptr =3D (const struct esrt *) esrt;
+    if ( esrt_ptr->esrt_count <=3D 0 ||
+         __builtin_mul_overflow(esrt_ptr->esrt_count,
+                                sizeof(struct esrt_entry),
+                                &esrt_len) ||
+         esrt_len > available_len - offsetof(struct esrt, esrt_entries) )
+        return ESRT_BAD;
+    return ESRT_GOOD;
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -835,6 +887,10 @@ static void __init efi_tables(void)
 {
     unsigned int i;
=20
+    BUILD_BUG_ON(sizeof(struct esrt_entry) !=3D 40);
+    BUILD_BUG_ON(_Alignof(struct esrt_entry) !=3D 4);
+    BUILD_BUG_ON(offsetof(struct esrt, esrt_entries) !=3D 16);
+
     /* Obtain basic table pointers. */
     for ( i =3D 0; i < efi_num_ct; ++i )
     {
@@ -843,6 +899,7 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
         static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
         static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
+        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
=20
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
 	       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
@@ -854,6 +911,8 @@ static void __init efi_tables(void)
 	       efi.smbios =3D (long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
 	       efi.smbios3 =3D (long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+	       efi.esrt =3D (long)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1042,9 +1101,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHand=
le, EFI_SYSTEM_TABLE *Syste
     EFI_STATUS status;
     UINTN info_size =3D 0, map_key;
     bool retry;
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
     unsigned int i;
-#endif
=20
     efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
                          &efi_mdesc_size, &mdesc_ver);
@@ -1055,6 +1112,10 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
=20
     for ( retry =3D false; ; retry =3D true )
     {
+        enum esrt_status esrt_status =3D ESRT_NOTFOUND;
+        const EFI_MEMORY_DESCRIPTOR *esrt_desc =3D
+            (const EFI_MEMORY_DESCRIPTOR*) EFI_INVALID_TABLE_ADDR;
+
         efi_memmap_size =3D info_size;
         status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_siz=
e,
                                                          efi_memmap, &map_=
key,
@@ -1063,8 +1124,31 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
         if ( EFI_ERROR(status) )
             PrintErrMesg(L"Cannot obtain memory map", status);
=20
+        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
+        {
+            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
+            switch ( is_esrt_valid(desc) )
+            {
+            case ESRT_NOTFOUND:
+                break;
+            case ESRT_GOOD:
+                esrt_status =3D ESRT_GOOD;
+                esrt_desc =3D desc;
+                break;
+            case ESRT_BAD:
+                esrt_status =3D ESRT_BAD;
+                break;
+            }
+        }
+        if ( esrt_status !=3D ESRT_GOOD )
+            efi.esrt =3D EFI_INVALID_TABLE_ADDR;
+
+        /*
+         * We cannot pass efi.esrt because we need to explicitly compare t=
he
+         * descriptor pointers for equality.
+         */
         efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_si=
ze,
-                                    efi_mdesc_size, mdesc_ver);
+                                    efi_mdesc_size, mdesc_ver, esrt_desc);
=20
         efi_arch_pre_exit_boot();
=20
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e..8ae086feaa 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -68,6 +68,7 @@ struct efi __read_mostly efi =3D {
 	.mps    =3D EFI_INVALID_TABLE_ADDR,
 	.smbios =3D EFI_INVALID_TABLE_ADDR,
 	.smbios3 =3D EFI_INVALID_TABLE_ADDR,
+	.esrt   =3D EFI_INVALID_TABLE_ADDR,
 };
=20
 const struct efi_pci_rom *__read_mostly efi_pci_roms;
diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
index a616d1238a..42ef3e1c8c 100644
--- a/xen/include/efi/efiapi.h
+++ b/xen/include/efi/efiapi.h
@@ -882,6 +882,9 @@ typedef struct _EFI_BOOT_SERVICES {
 #define SAL_SYSTEM_TABLE_GUID    \
     { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1=
, 0x4d} }
=20
+#define ESRT_GUID    \
+    { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x2=
1, 0x80} }
+
=20
 typedef struct _EFI_CONFIGURATION_TABLE {
     EFI_GUID                VendorGuid;
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f9..bb149fbfb9 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -19,6 +19,7 @@ struct efi {
     unsigned long acpi20;       /* ACPI table (ACPI 2.0) */
     unsigned long smbios;       /* SM BIOS table */
     unsigned long smbios3;      /* SMBIOS v3 table */
+    unsigned long esrt;         /* EFI System Reference Table */
 };
=20
 extern struct efi efi;
--=20
Demi Marie Obenour
she/her/hers
QubesOS Developer, Invisible Things Lab


--9Na29geeagoyx7X7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmErez8ACgkQsoi1X/+c
IsEQrA//SdhHwnkQmsG5Bej3UjUC3kPSCTP9s5Ar7nkotpXFbEb8OQZwGjx8yzn5
HeDdUXKIMRyuOX+cX9MYwWH8v/yMWaIbpzIFJghW8BCyOtE7w0KpjxZF4i6yWf6F
zj4VM9blEhzMirGbfsIjdDeSi+UiuM2UP9eADRpnxW7mErA1zs6Px4/BEbZ8iYQu
dvVMQInkJth5pBfDQ/RsiDF432DR9xtsJlxp8aho9Euq+rH9rz+RIBhoFF0nRsUm
1Ig/LrCBLNIF+YToC9EynrqIvXSJz8EKCzb2W1xqOEQ9nzYpa8qG8fSGRX0+X7c1
4RY2a4jHkDZjLy1FpVpCLonaVIaXE6oQ+E3B0Esrmo6wUWdvak6kpeOlhu8G8TTU
sNn1gL29yVCMOMryOq7cCdKtnTsGmEcOAWYYWMZmFZ1XV7LC3aAWLL5XxtJwnlAG
ZngiCXpfvay83Ae7C5CVR94z0VCFVYz9qmfvjSvmLK8PDD7Ld0PHD2KXVDxVbqYi
xza0DaINN0Yz5Pk4BHwl+/AQVCvjmmM4ZH3Zjt1gDmykrb4Rcp96pS9rlBtXUiBY
uCWqYbohy/OtJhWflRqD53rOAJ0PdZd/17PS8h197s00inpsIj76xGIRQ4yT6ffP
dGRJqWsPDLMfxejEB3lF4AiSfXwY1RNKKg4o5iF1pM5DYyX2kzw=
=PwAq
-----END PGP SIGNATURE-----

--9Na29geeagoyx7X7--

