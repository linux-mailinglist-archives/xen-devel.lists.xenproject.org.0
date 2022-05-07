Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC1151E41C
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 06:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323581.545306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnC6s-0007iO-Gs; Sat, 07 May 2022 04:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323581.545306; Sat, 07 May 2022 04:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnC6s-0007fc-DP; Sat, 07 May 2022 04:32:02 +0000
Received: by outflank-mailman (input) for mailman id 323581;
 Sat, 07 May 2022 04:32:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHlD=VP=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nnC6r-0007fW-Cu
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 04:32:01 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a288b875-cdbe-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 06:32:00 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 413775C006B;
 Sat,  7 May 2022 00:31:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 07 May 2022 00:31:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 May 2022 00:31:58 -0400 (EDT)
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
X-Inumbo-ID: a288b875-cdbe-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651897919; x=1651984319; bh=VHaYN/l9+j9mz
	nxryBHFWC+rCMLhHeDMBWZDG/SBAUQ=; b=yNGj3p3dq13CA+Mrk5kbMKu2PPeRq
	tYICJdoWjoIEQexwBkWvESWiXYAa7H3AWBq9z+Lli5QTdEJCD9so5TFaWQRk1bUD
	qRtTvcAoTJWEXbHRyTnEoxphFbWt3qqxKY0Det+kpIfaFL8chV8sSZRONxAja75q
	Ah8LwGpr694jTBTy360wCoolb1JB7eO2Ak/IIdxc0hz9zc0EiGPB+Divz9DJVqOr
	6mA0KpYWUWEw2ZguT2sW9jRbKa5G0opyvOS52v738/9mlUnj++2X381ub0BljXTL
	0m/mYtXTE8heBKLxdPgIAYfRU0wgir0npKPLejsRcByr3VowKaRq1Lmvg==
X-ME-Sender: <xms:PvZ1Yi22rKX8gp_LmqyZ9Axmt328srMkfW6RFumBVcvlRZYcxkzPWA>
    <xme:PvZ1YlEbqPU86eARYYJtqS6fTt_rhApmEOo078bsieB5I7TeN3tWt8p1qjOPoHIJP
    Bng-6UYXDi4eko>
X-ME-Received: <xmr:PvZ1Yq6_KgVy-rLXe1YvB1lshsn2n_tCCovo5wENUfzEupDZPf023gEzYlOH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedukeetkeekkeekvdetgedtkeetffdthfdt
    tdfgieffhfekhefhjefhveeggfeiheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:P_Z1Yj1dtXjMcqfj_wcsbLYZs6KkOLE2ktqX0XjQpOxJbZOX1-GYLg>
    <xmx:P_Z1YlFFfW0mhmX-Hn9S-9CcZl7f2tImRdlLRJIeMhw3M42d1DhfDg>
    <xmx:P_Z1Ys_lL9Crj21pBRFmOswISDlrRWTRQrVkTTvShkySaNxOlnM7Mg>
    <xmx:P_Z1YkwHHMWld3gakcme0OtZnfMKoKIRD1hzLx7NeqZ_I33vzurCfw>
Date: Sat, 7 May 2022 00:31:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] Preserve the EFI System Resource Table for dom0
Message-ID: <65b8c4b59ea92c6d79dcd60ba3a0b85a5e1609b5.1651897415.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xdYGmixzvS7L29mQ"
Content-Disposition: inline


--xdYGmixzvS7L29mQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 7 May 2022 00:31:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] Preserve the EFI System Resource Table for dom0

The EFI System Resource Table (ESRT) is necessary for fwupd to identify
firmware updates to install.  According to the UEFI specification =C2=A723.=
4,
the ESRT shall be stored in memory of type EfiBootServicesData.  However,
memory of type EfiBootServicesData is considered general-purpose memory
by Xen, so the ESRT needs to be moved somewhere where Xen will not
overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
in memory of type EfiRuntimeServicesData.

Earlier versions of this patch reserved the memory in which the ESRT was
located.  This created awkward alignment problems, and required either
splitting the E820 table or wasting memory.  It also would have required
a new platform op for dom0 to use to indicate if the ESRT is reserved.
By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
does not need to be modified, and dom0 can just check the type of the
memory region containing the ESRT.  The copy is only done if the ESRT is
not already in EfiRuntimeServicesData memory, avoiding memory leaks on
repeated kexec.

See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
for details.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 106 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..3d56422dfa 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -39,6 +39,25 @@
   { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b,=
 0x23} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a=
, 0xe0} }
+#define ESRT_GUID    \
+  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21,=
 0x80} }
+
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
=20
 typedef EFI_STATUS
 (/* _not_ EFIAPI */ *EFI_SHIM_LOCK_VERIFY) (
@@ -567,6 +586,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
MAGE *loaded_image)
 }
 #endif
=20
+static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
+
+static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
+{
+    size_t available_len, len;
+    const UINTN physical_start =3D desc->PhysicalStart;
+    const ESRT *esrt_ptr;
+
+    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
+        return 0;
+    if ( physical_start > esrt || esrt - physical_start >=3D len )
+        return 0;
+    /*
+     * The specification requires EfiBootServicesData, but accept
+     * EfiRuntimeServicesData, which is a more logical choice.
+     */
+    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
+         (desc->Type !=3D EfiBootServicesData) )
+        return 0;
+    available_len =3D len - (esrt - physical_start);
+    if ( available_len <=3D offsetof(ESRT, Entries) )
+        return 0;
+    available_len -=3D offsetof(ESRT, Entries);
+    esrt_ptr =3D (const ESRT *)esrt;
+    if ( esrt_ptr->Version !=3D 1 || !esrt_ptr->Count )
+        return 0;
+    if ( esrt_ptr->Count > available_len / sizeof(esrt_ptr->Entries[0]) )
+        return 0;
+    return esrt_ptr->Count * sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -845,6 +896,8 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTP=
UT_PROTOCOL *gop,
     return gop_mode;
 }
=20
+static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -868,6 +921,8 @@ static void __init efi_tables(void)
             efi.smbios =3D (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 =3D (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt =3D (UINTN)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1056,9 +1111,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHand=
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
@@ -1067,6 +1120,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
     if ( !efi_memmap )
         blexit(L"Unable to allocate memory for EFI memory map");
=20
+    efi_memmap_size =3D info_size;
+    status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
+                                                     efi_memmap, &map_key,
+                                                     &efi_mdesc_size,
+                                                     &mdesc_ver);
+    if ( EFI_ERROR(status) )
+        PrintErrMesg(L"Cannot obtain memory map", status);
+
+    /* Try to obtain the ESRT.  Errors are not fatal. */
+    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
+    {
+        /*
+         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
+         * so that the memory it is in will not be used for other purposes.
+         */
+        void *new_esrt =3D NULL;
+        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
+
+        if ( !esrt_size )
+            continue;
+        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type =3D=3D
+             EfiRuntimeServicesData )
+            break; /* ESRT already safe from reuse */
+        status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
+                                      &new_esrt);
+        if ( status =3D=3D EFI_SUCCESS && new_esrt )
+        {
+            memcpy(new_esrt, (void *)esrt, esrt_size);
+            status =3D efi_bs->InstallConfigurationTable(&esrt_guid, new_e=
srt);
+            if ( status !=3D EFI_SUCCESS )
+            {
+                PrintStr(L"Cannot install new ESRT\r\n");
+                efi_bs->FreePool(new_esrt);
+            }
+        }
+        else
+            PrintStr(L"Cannot allocate memory for ESRT\r\n");
+        break;
+    }
+
     for ( retry =3D false; ; retry =3D true )
     {
         efi_memmap_size =3D info_size;
@@ -1753,3 +1846,12 @@ void __init efi_init_memory(void)
     unmap_domain_page(efi_l4t);
 }
 #endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--xdYGmixzvS7L29mQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ19j4ACgkQsoi1X/+c
IsGgghAAoP34EA3hSfs7Hrj2ghAeCKoA3N0RIZ4scbyOjmIUm7RhCd9Z+goDfMCU
UaDYFaF7+s5g+Tqp4nVyRMTtup0frD01o6NQcbs/VKxxkiOQTeSHn7suT53o8nya
grsK6tjh9s2J7suKZ8G8HiNsVq7VpUHMNE+iY+O2+kAkkIzhDpaitf/blPMTYhXx
SLIEIpktUlZpG1ViWdFzKo7Q0Tq5L+KuEoMgx653q8bqe5xLhxuE+gLnfYLwNBko
WLcO43+ru2rKCNj1TY4N/FX+d4goAHnk6N6D3EKRoE22Lb8+BPWQCA9hCN6wmy30
jGcTj/hIVAJg9rukSpWsqwO20hxBpFdd4tcdB8brbWgPvjgampovp+D4wo7lmRds
iE2Ib9ze2MyOlwLyTXqLvndMfndqicnbJb4ga9A7GNIdU1upUxm35ie7NhCXvU7m
6AHbKxsNtFa4s8F6D28YcqqtbYCZcIMsoDbMrcDDgvrJXEEaVej9OroyyStuXiqY
iGhPKzo9RkuykkSH1VAPrYaryYCgRtCwHJKGL6KeziCTXhZhKQ9JVchJoOI39P0/
vfeMvE1uTUuwCbu68kiIeWrhnIKPvf/aEU1DU1xOvd3RKX9xVJZ1XGTyzj5BW8qV
/QSdGpsAj66Qw+Alkdr0GoXKR4F1tF49kPDpz1GStIu5peXDC2U=
=QQfX
-----END PGP SIGNATURE-----

--xdYGmixzvS7L29mQ--

