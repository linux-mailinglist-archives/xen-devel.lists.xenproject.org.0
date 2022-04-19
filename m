Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081695071E3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308260.523929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpsS-0000tK-1G; Tue, 19 Apr 2022 15:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308260.523929; Tue, 19 Apr 2022 15:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpsR-0000qP-Tq; Tue, 19 Apr 2022 15:34:51 +0000
Received: by outflank-mailman (input) for mailman id 308260;
 Tue, 19 Apr 2022 15:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfI/=U5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngpsR-0000qH-0t
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:34:51 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f7dbf9f-bff6-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:34:49 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CF8DA5C00CD;
 Tue, 19 Apr 2022 11:34:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 19 Apr 2022 11:34:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 11:34:48 -0400 (EDT)
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
X-Inumbo-ID: 3f7dbf9f-bff6-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650382488; x=1650468888; bh=pDF5lIUPyRqlP
	/JhuV0ZhW01cjaNMztjWYSbTJ2f/NM=; b=o/1MiSGDCiJJ46eTFM9lCwNbiAvE+
	i2+pe/C/5d3JlpqmUagiRPCIim7AcPRIhRtyq3YypEesFFJER5jDahGTezqk1yLo
	gTE7IfvlY6At94LiHa8kOb5vCln4TQYQJWoRL1as79+N9TpJcL5ZtsHJdRpW9BxU
	zgVGG82WInRfKMqwIf2tV8WO/ZkX8cWG3jscE8V8EWu4WON2C67cDCDZWWr6Rkq0
	gHCqgvV9gD15DGqZ09QOCYp2PBYC5+q5V99WydNng9qHB/rUi4q4QLFd5HDXwb1e
	jQ03rnetUnUYfA4J1ED7qnA8sK1tXdnFOWijR18k1e9OcjDKK788oPyTA==
X-ME-Sender: <xms:mNZeYtLglo4-idT0JkLSvpF4RxZv3I8dJoRLLoIHGkgMWD-uSt1ZtQ>
    <xme:mNZeYpKByOl2T-zVCY_aVpUB7hLL3JtF2_ScHdLtQHaXLZGh-3j8dUNIB0Eo-EnyP
    g-cwHg9sjNQWk0>
X-ME-Received: <xmr:mNZeYluvwLTkSg6JG_iCPvxamaMN2fsBUs4jkW5WCra36U-n986OZjjDo7J8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuveeguefgvdeiueejfedugeevleefteek
    udefheetuddvtdduvefggfeghedtffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:mNZeYubXXepC_q51TTbUCLeh-IEaH_prrjtLhHzjXl_EFnPSMcIkZA>
    <xmx:mNZeYkZVOdLrvDVV1KSN5fxBU2DY_hefVS5JL3ftU532_oH-irMXVg>
    <xmx:mNZeYiDPdNZ76iAlCWgCp59TJBRp7UHI-jtHVKQEVtAI-IcN455Vzw>
    <xmx:mNZeYpMepqzCHm5gGN52cEyD4fbQwxIHGZBaqZOHLSArOh6CEQQL_Q>
Date: Tue, 19 Apr 2022 11:34:46 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Message-ID: <Yl7Wlm8Ljx6vGhI9@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6fndWT1Hd0pt5QFy"
Content-Disposition: inline


--6fndWT1Hd0pt5QFy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 11:34:46 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/4] Grab the EFI System Resource Table and check it

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
 xen/arch/arm/efi/efi-boot.h |  1 +
 xen/arch/x86/efi/efi-boot.h |  2 +-
 xen/common/efi/boot.c       | 50 ++++++++++++++++++++++++++++++++++---
 xen/common/efi/efi.h        | 18 +++++++++++++
 xen/common/efi/runtime.c    |  3 ++-
 xen/include/efi/efiapi.h    |  3 +++
 6 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..ab2ad3dfe0 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -188,6 +188,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
               desc_ptr->Type =3D=3D EfiLoaderCode ||
               desc_ptr->Type =3D=3D EfiLoaderData ||
               (!map_bs &&
+               desc_ptr !=3D esrt_desc &&
                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
         {
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 6e65b569b0..75937c8a11 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -171,7 +171,7 @@ static void __init efi_arch_process_memory_map(EFI_SYST=
EM_TABLE *SystemTable,
         {
         case EfiBootServicesCode:
         case EfiBootServicesData:
-            if ( map_bs )
+            if ( map_bs || desc =3D=3D (EFI_MEMORY_DESCRIPTOR *)esrt_desc )
             {
         default:
                 type =3D E820_RESERVED;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ac1b235372..31664818c1 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -567,6 +567,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
MAGE *loaded_image)
 }
 #endif
=20
+static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
+
+static bool __init is_esrt_valid(
+    const EFI_MEMORY_DESCRIPTOR *const desc)
+{
+    size_t available_len, len;
+    const UINTN physical_start =3D desc->PhysicalStart;
+    const ESRT *esrt_ptr;
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
+    esrt_ptr =3D (const ESRT *)esrt;
+    if ( esrt_ptr->Version !=3D 1 || !esrt_ptr->Count )
+        return false;
+    return esrt_ptr->Count <=3D
+           (available_len - sizeof(*esrt_ptr)) /
+           sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -857,6 +889,7 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
         static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
         static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
+        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
=20
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
             efi.acpi20 =3D (unsigned long)efi_ct[i].VendorTable;
@@ -868,6 +901,8 @@ static void __init efi_tables(void)
             efi.smbios =3D (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 =3D (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt =3D (UINTN)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1056,19 +1091,19 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHa=
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
+        esrt_desc =3D (const EFI_MEMORY_DESCRIPTOR *)EFI_INVALID_TABLE_ADD=
R;
+
         efi_memmap_size =3D info_size;
         status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_siz=
e,
                                                          efi_memmap, &map_=
key,
@@ -1077,6 +1112,15 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
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
         efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_si=
ze,
                                     efi_mdesc_size, mdesc_ver);
=20
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c9aa65d506..02f499071a 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -10,6 +10,23 @@
 #include <xen/spinlock.h>
 #include <asm/page.h>
=20
+typedef struct _ESRT_ENTRY {
+    EFI_GUID FwClass;
+    UINT32 FwType;
+    UINT32 FwVersion;
+    UINT32 FwLowestSupportedVersion;
+    UINT32 FwCapsuleFlags;
+    UINT32 FwLastAttemptVersion;
+    UINT32 FwLastAttemptStatus;
+} ESRT_ENTRY;
+
+typedef struct _ESRT {
+    UINT32 Count;
+    UINT32 Max;
+    UINT64 Version;
+    ESRT_ENTRY Entries[];
+} ESRT;
+
 struct efi_pci_rom {
     const struct efi_pci_rom *next;
     u16 vendor, devid, segment;
@@ -28,6 +45,7 @@ extern const EFI_RUNTIME_SERVICES *efi_rs;
=20
 extern UINTN efi_memmap_size, efi_mdesc_size;
 extern void *efi_memmap;
+extern const EFI_MEMORY_DESCRIPTOR *esrt_desc;
=20
 #ifdef CONFIG_X86
 extern mfn_t efi_l4_mfn;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866..0d09647952 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -52,6 +52,7 @@ static unsigned int efi_rs_on_cpu =3D NR_CPUS;
 UINTN __read_mostly efi_memmap_size;
 UINTN __read_mostly efi_mdesc_size;
 void *__read_mostly efi_memmap;
+const EFI_MEMORY_DESCRIPTOR *__read_mostly esrt_desc;
=20
 UINT64 __read_mostly efi_boot_max_var_store_size;
 UINT64 __read_mostly efi_boot_remain_var_store_size;
@@ -269,7 +270,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *in=
fo)
     case XEN_FW_EFI_MEM_INFO:
         for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
         {
-            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
+            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
             u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
=20
             if ( info->mem.addr >=3D desc->PhysicalStart &&
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

--6fndWT1Hd0pt5QFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJe1pUACgkQsoi1X/+c
IsGPQxAAxsZVCYYTvdJhTNgRYq1pkjv+AOUMdymUQKXffX84MM8eMF8yHwysJ6N3
LciAgKaQTmaU7RQu2pNt6lu0ySzQADVQkgQYqRJogkOkPylz9tRm0VmLoTIS3P9B
rV7P24XBU2hWmm60ynM2nVofC7qE/vgOv4O4xplk9x+0Pc+Fb6cna/tCRgNdFg7c
6fX9gca7JYhav0hw61jZUqDhh3G/1UwzF7qapxdjCHw8hy15709XNz3BzAbzUsa1
Qq1YsfHR57KXEDPRAk/qVdAFuTggUaw5E5x/fFGqsVG8h3U2XV3JfhgLOVUz50u0
U9lwBV/8nWl5BT+Elk3rsQR6YNkgQ3nT92H6KDaXkNvXqlsORVPSJrVKyQ3yEYcm
eQijlifXrRjmXGyRcP9WJSdWIG1vv+2KbABhCn6PQPdoG+lppA5HhzufiwncBhO0
DitwoGv9HN3610/T9Ru/3AZbxlQe7tJrjLkimKl+kR73t3qJWBwYdiIWXz55NPjh
oZfWEX/XE74UHzxEkhPZ7CrxUU+YOsFDqBULx/U/SQWdcS+Lz0yu9cMQJi0sjFg2
JSoDIERvpNq4fRVbizT9CTbtPmwmldseAlfYmaxmh/AU45bWj3HENS3I8j5Cux/G
zU96DEDiTVa2z6ES84tnejeczhUCxQEus+2LHkyZegVohZCjKq4=
=km7a
-----END PGP SIGNATURE-----

--6fndWT1Hd0pt5QFy--

