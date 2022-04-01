Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5A4EFD08
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 01:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297643.507079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naQTg-0004D2-VT; Fri, 01 Apr 2022 23:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297643.507079; Fri, 01 Apr 2022 23:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naQTg-0004Am-SH; Fri, 01 Apr 2022 23:14:48 +0000
Received: by outflank-mailman (input) for mailman id 297643;
 Fri, 01 Apr 2022 23:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zo7N=UL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1naQTe-0004Ag-O5
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 23:14:47 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 826ca2bf-b211-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 01:14:43 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D6E443201ECF;
 Fri,  1 Apr 2022 19:14:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 01 Apr 2022 19:14:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 19:14:38 -0400 (EDT)
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
X-Inumbo-ID: 826ca2bf-b211-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=WPE//5ah+E0hKk2PE+vG+xE7cWokDT9zLMikJPcvP
	jo=; b=P8Gd3YFgv9pd0SUbT6EcyeaSfmAZpfc9h91Bmm9jqmTgQky9dLaZAwRLo
	2tnfpjna0THtUDQP3bi7MYRvo4o6qpqQr32mSGEi34XWXOXCQiWXfHwnrEjJUdqj
	MP1ELbrefZEguBJDUt5DRpjq+iyE0G32w65dcmme+WG1kljgPBVKwEgnMfpMFP+q
	RgT9ypD2XZfoHo5hZgrCn+WBpdAYZsPsYgRX/ssvjd3CV+1latVEgqYokvjxhqae
	8EBKimxSKxnzu5yyrsIBq5IyM8Mkm2vsDrBej24ohP558RKl5OwSEd3t38UR+wvf
	MIJU+cBI9U9UUacOrjPw5wditOi2w==
X-ME-Sender: <xms:X4dHYjOnAN-8-w_YHL8hYtwqrQB54KvHXhhjR-Lg6Ij6fYJv8wIYCQ>
    <xme:X4dHYt8eeS4GbVG4fWE9vJi3ws8WR2Yg1d5CrdIK62fzfhjR9AdV0gzSXNrdFZzym
    6Gw5_4tLCD9WNE>
X-ME-Received: <xmr:X4dHYiTXQmq1gqNBiTBFW_F8MjS1C5yJIWahwlDT63dFIijs6L3F74U8qrM2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeijedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuveeguefgvdeiueejfedugeevleefteek
    udefheetuddvtdduvefggfeghedtffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:X4dHYnte0x3ODsk5b_jFEP87QWNz8bOFenNYGFKHnLayHKadFaWhIA>
    <xmx:X4dHYreAiZmgRHCasq3J-492LIgXSL4b0ylzUVWzpXCRO6Je5k2C7Q>
    <xmx:X4dHYj3UysSn19fwizrAqEvl4AzD3MPRLB_8rNg4VQoMTNB476WMyw>
    <xmx:X4dHYjQ_Ai938zRVK4Q0oACNpI449w8sd1ds5-0Fn4cBmzeWrP9_xA>
Date: Fri, 1 Apr 2022 19:14:32 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH v2] Grab the EFI System Resource Table and check it
Message-ID: <YkeHXFvgB3MwXnuR@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lfy7FQ1zC0j/nFNw"
Content-Disposition: inline


--Lfy7FQ1zC0j/nFNw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 1 Apr 2022 19:14:32 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH v2] Grab the EFI System Resource Table and check it

The EFI System Resource Table (ESRT) is necessary for fwupd to identify
firmware updates to install.  According to the UEFI specification =A723.4,
the table shall be stored in memory of type EfiBootServicesData.
Therefore, Xen must avoid reusing that memory for other purposes, so
that Linux can access the ESRT.  Additionally, Xen must mark the memory
as reserved, so that Linux knows accessing it is safe.

See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
for details.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/arm/efi/efi-boot.h |  9 +++--
 xen/arch/x86/efi/efi-boot.h |  5 ++-
 xen/common/efi/boot.c       | 77 +++++++++++++++++++++++++++++++++++--
 xen/common/efi/efi.h        |  2 +-
 xen/common/efi/runtime.c    |  5 ++-
 xen/include/efi/efiapi.h    |  3 ++
 6 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index ae8627134e..767b2c9154 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -176,7 +176,8 @@ static bool __init meminfo_add_bank(struct meminfo *mem,
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
@@ -188,6 +189,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
               desc_ptr->Type =3D=3D EfiLoaderCode ||
               desc_ptr->Type =3D=3D EfiLoaderData ||
               (!map_bs &&
+               desc_ptr !=3D esrt_desc &&
                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
         {
@@ -393,11 +395,12 @@ static void __init efi_arch_process_memory_map(EFI_SY=
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
index d91eb5a537..6e6a5d2224 100644
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
index 4dd5ea6a06..ad5883133d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -93,6 +93,23 @@ typedef struct _EFI_LOAD_OPTION {
     CHAR16 Description[];
 } EFI_LOAD_OPTION;
=20
+struct esrt_entry {
+    EFI_GUID fw_class;
+    UINT32 fw_type;
+    UINT32 fw_version;
+    UINT32 fw_lowest_supported_version;
+    UINT32 fw_capsule_flags;
+    UINT32 fw_last_attempt_version;
+    UINT32 fw_last_attempt_status;
+};
+
+struct esrt {
+    UINT32 esrt_count;
+    UINT32 esrt_max;
+    UINT64 esrt_version;
+    struct esrt_entry esrt_entries[];
+};
+
 #define LOAD_OPTION_ACTIVE              0x00000001
=20
 union string {
@@ -567,6 +584,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
MAGE *loaded_image)
 }
 #endif
=20
+static UINTN __initdata esrt;
+
+static bool __init is_esrt_valid(
+    const EFI_MEMORY_DESCRIPTOR *const desc)
+{
+    size_t available_len, esrt_len, len;
+    const UINTN physical_start =3D desc->PhysicalStart;
+    const struct esrt *esrt_ptr;
+
+    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
+        return false;
+    if ( physical_start > esrt || esrt - physical_start >=3D len )
+        return false;
+    /*
+     * The specification requires EfiBootServicesData, but accept
+     * EfiRuntimeServicesData for compatibility
+     */
+    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
+         (desc->Type !=3D EfiBootServicesData) )
+        return false;
+    available_len =3D len - (esrt - physical_start);
+    if ( available_len < sizeof(*esrt_ptr) )
+        return false;
+    esrt_ptr =3D (const struct esrt *)esrt;
+    if ( esrt_ptr->esrt_version !=3D 1 || esrt_ptr->esrt_count <=3D 0 )
+        return false;
+    esrt_len =3D esrt_ptr->esrt_count * sizeof(esrt_ptr->esrt_entries[0]);
+
+    return esrt_len > available_len - sizeof(*esrt_ptr);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -846,6 +895,10 @@ static void __init efi_tables(void)
 {
     unsigned int i;
=20
+    BUILD_BUG_ON(sizeof(struct esrt_entry) !=3D 40);
+    BUILD_BUG_ON(__alignof(struct esrt_entry) !=3D 4);
+    BUILD_BUG_ON(sizeof(struct esrt) !=3D 16);
+
     /* Obtain basic table pointers. */
     for ( i =3D 0; i < efi_num_ct; ++i )
     {
@@ -854,6 +907,7 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
         static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
         static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
+        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
=20
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
 	       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
@@ -865,6 +919,8 @@ static void __init efi_tables(void)
 	       efi.smbios =3D (long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
 	       efi.smbios3 =3D (long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+	       esrt =3D (long)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1053,19 +1109,19 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHa=
ndle, EFI_SYSTEM_TABLE *Syste
     EFI_STATUS status;
     UINTN info_size =3D 0, map_key;
     bool retry;
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
     unsigned int i;
-#endif
=20
     efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
                          &efi_mdesc_size, &mdesc_ver);
-    info_size +=3D 8 * efi_mdesc_size;
+    info_size +=3D 8 * (efi_mdesc_size + 1);
     efi_memmap =3D efi_arch_allocate_mmap_buffer(info_size);
     if ( !efi_memmap )
         blexit(L"Unable to allocate memory for EFI memory map");
=20
     for ( retry =3D false; ; retry =3D true )
     {
+        esrt_desc =3D (EFI_MEMORY_DESCRIPTOR*)EFI_INVALID_TABLE_ADDR;
+
         efi_memmap_size =3D info_size;
         status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_siz=
e,
                                                          efi_memmap, &map_=
key,
@@ -1074,8 +1130,21 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
         if ( EFI_ERROR(status) )
             PrintErrMesg(L"Cannot obtain memory map", status);
=20
+        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
+        {
+            if ( is_esrt_valid(efi_memmap + i) )
+            {
+                esrt_desc =3D efi_memmap + i;
+                break;
+            }
+        }
+
+        /*
+         * We cannot pass esrt because we need to explicitly compare the
+         * descriptor pointers for equality.
+         */
         efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_si=
ze,
-                                    efi_mdesc_size, mdesc_ver);
+                                    efi_mdesc_size, mdesc_ver, esrt_desc);
=20
         efi_arch_pre_exit_boot();
=20
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c9aa65d506..498c8dc1fa 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -27,7 +27,7 @@ extern const CHAR16 *efi_fw_vendor;
 extern const EFI_RUNTIME_SERVICES *efi_rs;
=20
 extern UINTN efi_memmap_size, efi_mdesc_size;
-extern void *efi_memmap;
+extern void *efi_memmap, *esrt_desc;
=20
 #ifdef CONFIG_X86
 extern mfn_t efi_l4_mfn;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866..9b6a06e651 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -52,6 +52,7 @@ static unsigned int efi_rs_on_cpu =3D NR_CPUS;
 UINTN __read_mostly efi_memmap_size;
 UINTN __read_mostly efi_mdesc_size;
 void *__read_mostly efi_memmap;
+void *__read_mostly esrt_desc;
=20
 UINT64 __read_mostly efi_boot_max_var_store_size;
 UINT64 __read_mostly efi_boot_remain_var_store_size;
@@ -269,14 +270,14 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *=
info)
     case XEN_FW_EFI_MEM_INFO:
         for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
         {
-            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
+            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
             u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
=20
             if ( info->mem.addr >=3D desc->PhysicalStart &&
                  info->mem.addr < desc->PhysicalStart + len )
             {
                 info->mem.type =3D desc->Type;
-                info->mem.attr =3D desc->Attribute;
+                info->mem.attr =3D desc =3D=3D esrt_desc ? EFI_MEMORY_RUNT=
IME : desc->Attribute;
                 if ( info->mem.addr + info->mem.size < info->mem.addr ||
                      info->mem.addr + info->mem.size >
                      desc->PhysicalStart + len )
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
--=20
Sincerely,
Demi Marie Obenour
Invisible Things Lab

--Lfy7FQ1zC0j/nFNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJHh1wACgkQsoi1X/+c
IsGDdQ//RyTKBEmNYUgRFfD0IhEQg7zXoui/D7uGkHkjyFnA9R9DfUCsRlHE17rc
uuk+D9oOWXogWLfZ7rBWSsCbrGUq+0Z/oYgCGXp90kP8G2WxWUMvS1iWmsWG6XYg
ODkDB+UFzdToyV3Pj3kjnBJ+kFMraYG1VPPAtH2qkRaDJzpOMOiwD2lWGupG8mAw
QIsX3LIBhKteRKZkIHEEGFG2Kwlzf+3tjwN53ebaG3/vuZnpguQAiq7X5VJnbXQr
cKECyz9COZsyD/ay9OMtthQ202nhHvb6s/V9kxdLbxRz1Pnts6XxFXsMPDX9xP1e
O3qHm+qWMORVM48q7ZhGqQUnc/L94FNJsiaiBqgk0KX44C7MakHy2xyOAC8VYs5Y
pHH9KwDQ+WOXU+UgLe+cybv0iDzXeZmcOCIALSTmkDxXhcyJCNSgKAALrkb3Cs3o
RG1LIrxEFHeLZW7P2Omb/tppZypoR4YpV6T50TkV4g0jSeigJH4RwxuSgRbyhDm/
CLOVAuqGkV22P+qWXzQqarmshykUl2N4WthkfX+KxOQfoo2qcpfSeN4DJcbu9jbM
iQGX38JK59qarH0AeYf+3s1r6GGP0Ee9idDfdrx/om0Hk6xWal5e2QU744BOnZjt
j9FuZ0oCA1de6VJVMBcXZfjLVPZRI0RCeJgP5DUjMVzARn0b1pE=
=i9tQ
-----END PGP SIGNATURE-----

--Lfy7FQ1zC0j/nFNw--

