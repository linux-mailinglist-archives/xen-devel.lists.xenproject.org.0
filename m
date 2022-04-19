Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C6507203
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308291.523973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpyE-0003xy-Jy; Tue, 19 Apr 2022 15:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308291.523973; Tue, 19 Apr 2022 15:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpyE-0003uS-GM; Tue, 19 Apr 2022 15:40:50 +0000
Received: by outflank-mailman (input) for mailman id 308291;
 Tue, 19 Apr 2022 15:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfI/=U5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngpyD-0001X4-4Z
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:40:49 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 153e9ac8-bff7-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:40:48 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 731F15C017F;
 Tue, 19 Apr 2022 11:40:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 19 Apr 2022 11:40:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 11:40:46 -0400 (EDT)
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
X-Inumbo-ID: 153e9ac8-bff7-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650382847; x=1650469247; bh=3
	arqv03JGEGVKFR5SMcDPvfcQfJd+3ZKaEx4TULio5U=; b=qKNxCblSJz6gsng7G
	YoUR2s1K3Y2gRE0PZA7hmzMaeE0bqbiB1v0EvMyPWkqwRU3PQ8Zto7cL0hBiGuDb
	i1QFmcMp3w9JWYla75ac+cWalloxZ7fVv1Cd4XmGGFehWIJGLCeClFrJfvfHZ54x
	gkP6heZYzMBZTHl4W1pUHf59cB6YH62/BIJn8/uMiSe11NY9FlTi/UTFZIwj6qsT
	rYiW54QsxfPDmBV0Q3QYNkTqIvgpGxmd9dS9vKgqxJR1m+iXV58B8eJPmLjGnqrr
	rYu00HGEP7LRCPTNNUUaYJA+xcuL8posXX9o87r5u3E7U4Tw1nX79IqG2NSL531s
	GGrRg==
X-ME-Sender: <xms:_tdeYnstA60vZOalsoerbzGiOE2HSaoiYYvM_vweRfMOnnShNDjbIQ>
    <xme:_tdeYof7kGSvZH2kRojNGTi7JbBBWnJfZE6mtxufHy6-iYqFdZAHxgq6TqfBYEsas
    vavKQxhUj76HIU>
X-ME-Received: <xmr:_tdeYqy6iv2NEhQY0cm-g89Oj1MbipDw6oVcWJpHOoK20QyP5-Uqwb2E8gIx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepveefleduheekhfdtfffffedukeevtedu
    leekfffgudfhtdduhfevueefueegtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:_9deYmNvOxtqP_qBBhmnSnXDIIyZCDYoxbUF-gBRsIzZRpLy3v3yEg>
    <xmx:_9deYn8j6cNRrFpNvipfT6VXVfKyuSTza3IL7_mJ8F3NjD-9qXd1hw>
    <xmx:_9deYmXTIjx-jw5Ap7fl7LSFWMDSdupj71Z4LVXVHHI5OSBzNDhvgA>
    <xmx:_9deYpKBP81Mr0fqgniwSTJrX_nzCCTdaIjL-Isc5LUSq4YhWFXe4A>
Date: Tue, 19 Apr 2022 11:40:44 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/4] Add a dedicated memory region for the ESRT
Message-ID: <Yl7X/dT39vvhZmho@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="weNRqal4jiKrbyKp"
Content-Disposition: inline
In-Reply-To: <Yl7WHv6+M+eJwQep@itl-email>


--weNRqal4jiKrbyKp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 11:40:44 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/4] Add a dedicated memory region for the ESRT

This allows the ESRT to be marked as reserved without having to waste a
potentially large amount of memory.  This patch assumes that Xen can
handle memory regions that are not page-aligned.  If it cannot,
additional code will need to be added to align the regions.
---
 xen/arch/x86/efi/efi-boot.h     | 69 +++++++++++++++++++++++++--------
 xen/arch/x86/include/asm/e820.h |  2 +-
 2 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 75937c8a11..edf1fea3e0 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -165,13 +165,14 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
     {
         EFI_MEMORY_DESCRIPTOR *desc =3D map + i;
         u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+        UINTN physical_start =3D desc->PhysicalStart;
         u32 type;
=20
         switch ( desc->Type )
         {
         case EfiBootServicesCode:
         case EfiBootServicesData:
-            if ( map_bs || desc =3D=3D (EFI_MEMORY_DESCRIPTOR *)esrt_desc )
+            if ( map_bs )
             {
         default:
                 type =3D E820_RESERVED;
@@ -179,9 +180,9 @@ static void __init efi_arch_process_memory_map(EFI_SYST=
EM_TABLE *SystemTable,
             }
             /* fall through */
         case EfiConventionalMemory:
-            if ( !trampoline_phys && desc->PhysicalStart + len <=3D 0x1000=
00 &&
-                 len >=3D cfg.size && desc->PhysicalStart + len > cfg.addr=
 )
-                cfg.addr =3D (desc->PhysicalStart + len - cfg.size) & PAGE=
_MASK;
+            if ( !trampoline_phys && physical_start + len <=3D 0x100000 &&
+                 len >=3D cfg.size && physical_start + len > cfg.addr )
+                cfg.addr =3D (physical_start + len - cfg.size) & PAGE_MASK;
             /* fall through */
         case EfiLoaderCode:
         case EfiLoaderData:
@@ -198,21 +199,57 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
             type =3D E820_NVS;
             break;
         }
-        if ( e820_raw.nr_map && type =3D=3D e->type &&
-             desc->PhysicalStart =3D=3D e->addr + e->size )
-            e->size +=3D len;
-        else if ( !len || e820_raw.nr_map >=3D ARRAY_SIZE(e820_raw.map) )
-            continue;
-        else
+
+#define ADD_ENTRY(len, type_, physical_start)                           \
+        if ( len )                                                      \
+        {                                                               \
+            if ( e820_raw.nr_map && (type_) =3D=3D e->type &&             =
  \
+                 (physical_start) =3D=3D e->addr + e->size )              =
  \
+                e->size +=3D (len);                                       \
+            else if ( e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )      \
+                continue;                                               \
+            else                                                        \
+            {                                                           \
+                ++e;                                                    \
+                e->addr =3D (physical_start);                             \
+                e->size =3D (len);                                        \
+                e->type =3D (type_);                                      \
+                ++e820_raw.nr_map;                                      \
+            }                                                           \
+        }                                                               \
+        else                                                            \
+            do {} while (0)
+
+        if ( desc =3D=3D (EFI_MEMORY_DESCRIPTOR *)esrt_desc )
         {
-            ++e;
-            e->addr =3D desc->PhysicalStart;
-            e->size =3D len;
-            e->type =3D type;
-            ++e820_raw.nr_map;
+            const ESRT *esrt_ptr;
+            UINTN esrt_offset, esrt_len;
+
+            BUG_ON(physical_start > esrt);
+            BUG_ON(len < sizeof(*esrt_ptr));
+            esrt_offset =3D esrt - physical_start;
+
+            BUG_ON(len - sizeof(*esrt_ptr) < esrt_offset);
+            esrt_ptr =3D (const ESRT *)esrt;
+
+            BUG_ON(esrt_ptr->Version !=3D 1);
+            BUG_ON(esrt_ptr->Count < 1);
+
+            esrt_len =3D (esrt_ptr->Count + 1) * sizeof(*esrt_ptr);
+
+            BUG_ON( len - esrt_offset < esrt_len );
+
+            ADD_ENTRY(esrt_offset, type, physical_start);
+
+            ADD_ENTRY(esrt_len, E820_RESERVED, esrt);
+
+            physical_start =3D esrt + esrt_len;
+            len -=3D esrt_offset + esrt_len;
         }
-    }
=20
+        ADD_ENTRY(len, type, physical_start);
+    }
+#undef ADD_ENTRY
 }
=20
 static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e82=
0.h
index 92f5efa4f5..98eca96425 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -16,7 +16,7 @@ struct __packed e820entry {
     uint32_t type;
 };
=20
-#define E820MAX	1024
+#define E820MAX	1026
=20
 struct e820map {
     unsigned int nr_map;
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--weNRqal4jiKrbyKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJe1/wACgkQsoi1X/+c
IsHFtxAAp1e2QIOgX1bpt7qNcCU5Zsz899u1wSFeVNkiZXPfrfE8D4H8ORJZIl88
27e0V68HVQkE4uaJ9XgX9/WVCmSOrCGcX3frrJCbUHS7AvVDkEoxR9En0txPGX7q
rWuk3EpGrGdeaKYq2Ze6iQs4H7kPKmgi95fwyY/8pqw9gQAniHiJ3adSxBUafFfH
Ez/7LesMXKHLRUTWAUQzKNwQnH6VVBYarKap3DQCZOz0i9C9gWGrEt4CK3ygWipx
5b6lx+dOE5HbILaW5LbTFbdVZPaZ5dXPEDPJw5QPFK03AY8Q8L51O0f7M2K7Zue+
KWojkSWYtACQsisU0UYHcrYdMEFP69GjHfhPev7cAuchrRV56RCiXs1Mt9U3+mI6
htsW+Us0wIGyxElXfyEptPyQU/POeQ5KSaZjQ3DoBctCK7K3+8kBpFBQZ9jfQeER
uOUpXb5dQ0kG3boBiGrfNJFvmWSAX+2PDXEa7uLr0ryfc9o6L9vdYGab9mA9DEiF
VB6qmAQfnVpMkDRz4JWn3yYUJGBd0PDFv+Tpl/cmMvEuQj6s05P6m7PmPIGhilC7
HwNfPkZ7FBpT3mFGFpaczuS4/AWNWlQk5RcpdcrKw8jCTlhrajqyFF6SM+5TWRGg
JIxC7d2EvDVFKGxN+wbp6kksRPG+JGWEU4ECiqROELsAmoFPcFA=
=LKhS
-----END PGP SIGNATURE-----

--weNRqal4jiKrbyKp--

