Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE2507220
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308318.524016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq6j-0006gv-Cn; Tue, 19 Apr 2022 15:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308318.524016; Tue, 19 Apr 2022 15:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq6j-0006eO-8w; Tue, 19 Apr 2022 15:49:37 +0000
Received: by outflank-mailman (input) for mailman id 308318;
 Tue, 19 Apr 2022 15:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfI/=U5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngq6h-0006bg-OZ
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:49:35 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f1a3660-bff8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 17:49:34 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C8CA75C01B9;
 Tue, 19 Apr 2022 11:49:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 11:49:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 11:49:33 -0400 (EDT)
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
X-Inumbo-ID: 4f1a3660-bff8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650383373; x=1650469773; bh=/
	sHDqu5TR+my1VccR9iUf0aiaYoUSa126jvmh3CA+Xk=; b=c8FvKmdLc6lFlXIaX
	1GbBfeZgu60Wek4Z5Pvxw3wIflxj6k+jsBGqWu4tUnv4XtOTOMB/i7uPwpj/e/oO
	Pcexr7nx6G7BNREGg4AZ9oINFVaqsja657tvmusXByrTRI6ypXmG0kYBS4FJ1H3I
	hJc7Q372MpgdvM4YSEXSHTdTp7gytWmIh86Q1E84OMrBkYrB51GyN5P5yy/aL1Y7
	biFLVaWf4b2AvMgSwDPnfDgYmqU5Gd7oyjay/tuwKOdjLMuf3AgWuHIGIfeihjCq
	BExjc3bqlhbAD0bXrwTXPYRLp5Of8Ps2cvj10OMr73zEPIVovaFL0IuqrIC927GI
	0lGxA==
X-ME-Sender: <xms:DdpeYuZMSnWccLTrYWBMiHLlIkynI8SgzDqkcAbRa1my_Xarx2XhSQ>
    <xme:DdpeYhZ-t1HuXsCpz8J-e4P5-N_Ql-p9DH5D0tKEtSFnsF1BBsAStFfPLDVw57ii6
    nT3k6NJZJO_lP4>
X-ME-Received: <xmr:DdpeYo_LEO7zTXIa0k-xbVmZ0tQSV_CB6ox37iKeCt9YJ_CdYcyHWoWjL0hG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepveefleduheekhfdtfffffedukeevtedu
    leekfffgudfhtdduhfevueefueegtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:DdpeYgqSwGK7g3ZjHpJWDdT6nJacY-cmJFUlMcl34RIiTivxsWHrAg>
    <xmx:DdpeYprurpi6baO5zon--AMdjASE81lF8r0Uhz_Kb2uL4dNcdntpOA>
    <xmx:DdpeYuSPuC-n2luslH1Llr1O14h64m6lfxsh21klkbXWePH2oUYREw>
    <xmx:DdpeYqmV5d0aTd4M8bwY2ZifmdXZZ1C6PtLxdb96i_-mj-eZFjSXTw>
Date: Tue, 19 Apr 2022 11:49:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <Yl7aC2a+TtOaFtqZ@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i0aPqryS6w7vx+4i"
Content-Disposition: inline
In-Reply-To: <Yl7WHv6+M+eJwQep@itl-email>


--i0aPqryS6w7vx+4i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 11:49:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/4] Add a new hypercall to get the ESRT

This hypercall can be used to get the ESRT from the hypervisor.  It
returning successfully also indicates that Xen has reserved the ESRT and
it can safely be parsed by dom0.
---
 xen/common/efi/boot.c         | 15 ++++++++++-----
 xen/common/efi/efi.h          |  2 ++
 xen/common/efi/runtime.c      | 14 ++++++++++++++
 xen/include/public/platform.h |  7 +++++++
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 31664818c1..01b2409c5e 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -567,8 +567,6 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IM=
AGE *loaded_image)
 }
 #endif
=20
-static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
-
 static bool __init is_esrt_valid(
     const EFI_MEMORY_DESCRIPTOR *const desc)
 {
@@ -594,9 +592,13 @@ static bool __init is_esrt_valid(
     esrt_ptr =3D (const ESRT *)esrt;
     if ( esrt_ptr->Version !=3D 1 || !esrt_ptr->Count )
         return false;
-    return esrt_ptr->Count <=3D
-           (available_len - sizeof(*esrt_ptr)) /
-           sizeof(esrt_ptr->Entries[0]);
+    if ( esrt_ptr->Count >
+	 (available_len - sizeof(*esrt_ptr)) /
+	 sizeof(esrt_ptr->Entries[0]) )
+        return false;
+    esrt_size =3D sizeof(*esrt_ptr) +
+        esrt_ptr->Count * sizeof(esrt_ptr->Entries[0]);
+    return true;
 }
=20
 /*
@@ -1121,6 +1123,9 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHand=
le, EFI_SYSTEM_TABLE *Syste
             }
         }
=20
+	if ( esrt_desc =3D=3D (const EFI_MEMORY_DESCRIPTOR *)EFI_INVALID_TABLE_AD=
DR )
+	    esrt =3D EFI_INVALID_TABLE_ADDR;
+
         efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_si=
ze,
                                     efi_mdesc_size, mdesc_ver);
=20
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index 02f499071a..0736662ebc 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -46,6 +46,8 @@ extern const EFI_RUNTIME_SERVICES *efi_rs;
 extern UINTN efi_memmap_size, efi_mdesc_size;
 extern void *efi_memmap;
 extern const EFI_MEMORY_DESCRIPTOR *esrt_desc;
+extern UINTN esrt;
+extern UINTN esrt_size;
=20
 #ifdef CONFIG_X86
 extern mfn_t efi_l4_mfn;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 0d09647952..4466d5379c 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -227,6 +227,12 @@ const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN=
 n)
 #endif /* COMPAT */
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
+
+#ifndef COMPAT
+UINTN esrt =3D EFI_INVALID_TABLE_ADDR;
+UINTN esrt_size =3D 0;
+#endif
+
 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
     unsigned int i, n;
@@ -311,6 +317,14 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *i=
nfo)
         info->apple_properties.size =3D efi_apple_properties_len;
         break;
=20
+    case XEN_FW_EFI_ESRT:
+        if ( esrt_desc =3D=3D (const EFI_MEMORY_DESCRIPTOR *)EFI_INVALID_T=
ABLE_ADDR )
+            return -ENODATA;
+        if ( info->esrt.size < esrt_size )
+            return -ERANGE;
+        if ( copy_to_guest(info->esrt.table, (const ESRT *)esrt, esrt_size=
) )
+            return -EFAULT;
+        break;
     default:
         return -EINVAL;
     }
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 8100133509..a848df2066 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -243,6 +243,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
 #define  XEN_FW_EFI_RT_VERSION     4
 #define  XEN_FW_EFI_PCI_ROM        5
 #define  XEN_FW_EFI_APPLE_PROPERTIES 6
+#define  XEN_FW_EFI_ESRT           7
 #define XEN_FW_KBD_SHIFT_FLAGS    5
 struct xenpf_firmware_info {
     /* IN variables. */
@@ -307,6 +308,12 @@ struct xenpf_firmware_info {
                 uint64_t address;
                 xen_ulong_t size;
             } apple_properties;
+            struct {
+                /* IN variables */
+                uint64_t size;
+                /* OUT variables */
+                XEN_GUEST_HANDLE(void) table;
+            } esrt;
         } efi_info; /* XEN_FW_EFI_INFO */
=20
         /* Int16, Fn02: Get keyboard shift flags. */
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--i0aPqryS6w7vx+4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJe2goACgkQsoi1X/+c
IsHj2xAAxd80MtCKJV/pn9p8JOQoS7zPDoXYsikhyFi7e9HVcGzFm9P5GkA7ymis
CVy1LrPNaqPPa0GugnmTvBXV0BCvZc1IRZGU+vXQuPfYga+hATQjAMToybrrWJNM
h2WHqp41GE81bICGVcRrw13giqjs5Sy7/1+RJoRh02H5+gjewcg+0cqoRKCwZtvY
JwRpe0sHNnQDdJwRRcez4YmGqclrVrwt4+QATlvBk88pmwBYxPMfzrXfIO0WL5jx
krX9BT4wnPeE5ApRe4daYJMxXM6/ZrMyXViJjuHkYLnNha8U4mhHzkU9JRp96Ge5
arcO4ea+3TKIN23Ujy7eSeFrKvrCXDMGRFK3sAFQtZhmRrl3S+46S2AuYhhPLP27
e57ICEMAVlnr0JrKYuow/8LgToWPUfLc97vBWhy4Jjtxlvd36gRT0iXu6OojaBDO
0Rpe4pfMdv0nKENiL9RD8V75RrMg84urga422U4T3ro3WNrN/WsygDgXMHQpJO/G
mhl5g9MjTLT/oqREBHwBYWUYIsctupKCkD5IZ5EoczGQgkSQWoSmmiNisF+6xb2X
P+cGXSX5HOKfEt0PPxm3FGyewwZTwBnJoPmNJE6b16kMHGu1oPrpO/I0WRl+EKe+
40TbkZRk7RQh+EFpjLx8OQxDhofnCpC+6qwx+a6tjgAEXp2Eo1Q=
=EnvI
-----END PGP SIGNATURE-----

--i0aPqryS6w7vx+4i--

