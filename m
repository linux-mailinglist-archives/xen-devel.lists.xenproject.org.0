Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A444ECD9C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 22:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296533.504793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeVb-0001T7-Bc; Wed, 30 Mar 2022 20:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296533.504793; Wed, 30 Mar 2022 20:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeVb-0001Qt-8F; Wed, 30 Mar 2022 20:01:35 +0000
Received: by outflank-mailman (input) for mailman id 296533;
 Wed, 30 Mar 2022 20:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3v6=UJ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nZeVY-0001Qn-Oc
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 20:01:33 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303721be-b064-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 22:01:30 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EAE105C0184
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 16:01:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 30 Mar 2022 16:01:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 16:01:28 -0400 (EDT)
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
X-Inumbo-ID: 303721be-b064-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=0L+PbbAQ9lQ5nbvWA+56zsLpMwBKl9OJdMkNNa5/7
	xM=; b=mUTFoq1LgRIpSj96i1tk3dOrwfcLGX8XIFBpnM8WssjwDp6wRZAaRZYrQ
	1jNbce9++PpA7vyAspwvD0rnP2h2aQzhOEOUbp1CSoMxIOSZbUeI3Y0owu4Q9/SG
	ZcOyeJcYjQrb4pTz50EpgxSzxbqSh9e3a1wnyfqgHYHXYLVtxLDwyfbziw0Z0AQ7
	jJzXYc6m827K6boNhWEufmvMQyTbwn9trw2hmJc8edx0l0A0DY1Y9bn8Wik5wHoO
	1FTgAGx2ZBovuJefx7FbupLjMwWEI216N7+bTjdrGmerjCd476Uw+Qde+v5RiDT+
	1IWqY3uUj9Uw5+3ADPdHemKO9jOAg==
X-ME-Sender: <xms:GLdEYqepjP-g7wKgSMHEFcJL7-ATCrJ-zOrIY76rHOe_z7pUyEHAGA>
    <xme:GLdEYkNiOq9-YF5qJf3NKXzqlMgirz_mKz-K1Lhk1bvB1_tccLjqNsQK2CuaZK6qq
    6ECM6qeBmQrZeM>
X-ME-Received: <xmr:GLdEYrhgSLfS6BCRvk5GTp9kYJMM_ITCpesMGh4y0UDnvi3hlk_P319DdSNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepueevgeeugfdvieeujeefudegveelfeet
    kedufeehteduvddtudevgffggeehtdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:GLdEYn_qOQ_EZJ8-g3Ydcw_7hNQ0V_jqEujFFOSA90nlk1-Zoe1wRQ>
    <xmx:GLdEYmu2rg-NY1v_6uyAP9yulYXmyWa3uBEk3UD_Ir954xqHxxL_yw>
    <xmx:GLdEYuFp0hq_nM7VeoqLalrP8mOG1F4j4R_y6LVRqXE0qjuF6yJ5kg>
    <xmx:GLdEYk4C9BhpEGpXFmDvSfuuqmUPG3Dei4ZAOmtSGlmiexmyPGUEUA>
Date: Wed, 30 Mar 2022 16:01:26 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] Grab the EFI System Resource Table and check it
Message-ID: <YkS3FthpZU0xQ2Y7@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vd+8j19dK24jMUwi"
Content-Disposition: inline


--vd+8j19dK24jMUwi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Mar 2022 16:01:26 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
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
index 458cfbbed4..398a2411a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -187,7 +187,8 @@ static bool __init meminfo_add_bank(struct meminfo *mem,
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
@@ -199,6 +200,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
               desc_ptr->Type =3D=3D EfiLoaderCode ||
               desc_ptr->Type =3D=3D EfiLoaderData ||
               (!map_bs &&
+               desc !=3D esrt_desc &&
                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
         {
@@ -404,11 +406,12 @@ static void __init efi_arch_process_memory_map(EFI_SY=
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
index 9b0cc29aae..fb1e9d5eef 100644
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
index 8fd5e2d078..04024b7e99 100644
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
@@ -175,6 +192,38 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *=
loaded_image)
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
@@ -844,6 +893,10 @@ static void __init efi_tables(void)
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
@@ -852,6 +905,7 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
         static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
         static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
+        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
=20
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
 	       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
@@ -863,6 +917,8 @@ static void __init efi_tables(void)
 	       efi.smbios =3D (long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
 	       efi.smbios3 =3D (long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+	       esrt =3D (long)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1051,19 +1107,19 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHa=
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
@@ -1072,8 +1128,21 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
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
index 375b94229e..c45c7cee77 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -51,6 +51,7 @@ static unsigned int efi_rs_on_cpu =3D NR_CPUS;
 UINTN __read_mostly efi_memmap_size;
 UINTN __read_mostly efi_mdesc_size;
 void *__read_mostly efi_memmap;
+void *__read_mostly esrt_desc;
=20
 UINT64 __read_mostly efi_boot_max_var_store_size;
 UINT64 __read_mostly efi_boot_remain_var_store_size;
@@ -251,14 +252,14 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *=
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
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--vd+8j19dK24jMUwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJEtxcACgkQsoi1X/+c
IsErNQ//b4caeklgHydDDq/Mr5xn1ZKOeYBMHwXg1ap1dxy8hpJjgbnHf+jfq6Xo
eJJa6dcsUX5WHmOzUGAjbjrddm7MPJI2btxGfYvUTJfIppwC9b8y2WcXLC6zpcfj
BWdWQGuXlE1x5jYcOjsXxmhVzLLyUDl9Apc8keVtSexQnbGr8QYwakXqyJVqcXcL
AdSbUvA3JsCGX0JGCU0QxDcAKUl9cwP9s/MQEh4ZjYnQRaP9DDY1OqQIRH2HS255
nqwsB2c3IY0EFeNh/1ggl2NDKavXxE399fXMJYyF1y+p25erIEMlNA4JzDnGyZgU
J3T4XE44jNdjsZUpZUFSUydEHgM8BIYpipjlvQx5chM/c4RCShJJ4x6SB6yBrIMi
lWloBX//EobB1UV3oe0JZ9g9ubvuPqmhWNTMdxRSmvOnf0zE2CqP540CqSkys6/D
PO4D6nwAIka4yHX/k2S5TcIDHQleGqmwdGaQR6D7IoCAmmdOGqs+QpObI9p/pXk8
Wfok6XIWObXmz6dR60Ah+F8ymUc1x1DHgW7ck7OXtuQ0YeAAur10DQERLnq0D4bJ
FQMhnsdeATrDlnKa8Okqelk08SLyJ4v+ZjL3bqDWYSlM+EydL7b0v2F3Qln2mUK1
FF4DqUYIOIgAPLzGppcMu7t7gIYVwq9UZi/QuTQ3IB2Q2ymMYd0=
=UYP0
-----END PGP SIGNATURE-----

--vd+8j19dK24jMUwi--

