Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431A507226
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308338.524039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq91-0000Ou-4J; Tue, 19 Apr 2022 15:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308338.524039; Tue, 19 Apr 2022 15:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq91-0000N4-1O; Tue, 19 Apr 2022 15:51:59 +0000
Received: by outflank-mailman (input) for mailman id 308338;
 Tue, 19 Apr 2022 15:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfI/=U5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngq8y-0000Lk-Qx
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:51:56 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a32fde1a-bff8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 17:51:55 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AAFE5C00D2;
 Tue, 19 Apr 2022 11:51:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 19 Apr 2022 11:51:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 11:51:54 -0400 (EDT)
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
X-Inumbo-ID: a32fde1a-bff8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650383515; x=1650469915; bh=f
	JfW3aNKUP1YaiRHgeQrsvL4jbiMKjBZMM/ztfq6U7M=; b=kFMW+HXhRpX7lvUYj
	TRNUsGwMjm5zSuJ1pHFFuZQjXWnJA2MVrUCmKVUAmq1z7Q1B3whrLimroK323zLU
	HLcg5n1rXPGY2qVOHztvOyQP+yu7WkbWLdkCtT4H/94gJffxMBNbJTu4hiDP0TVi
	xJMoNFbh46FvarjbnhNsuB3ETSeOmE7nvsViwebxhndzsUNfnB+CnP25rqds5L3w
	l5J903R6dwmS8T89HOJcm4T6wJkDyA6I+Sx2gscRMMgSx41q4rkBcVADueVuWTu9
	UtKevyb84nYfQa5irm9LGyPRiDcwEA83ARdv2raH3T854jc4j/3yRfOp59c/86GG
	47+AQ==
X-ME-Sender: <xms:mtpeYiYo2AMOTKDBDQMOQyhu3bdzKeLb_P9Sksw9-RfAR3bnjtq1lw>
    <xme:mtpeYlZYGRbqOlaTrtwVk_CA_5l85KhO5VOBUgbudoxdNMhSJkVSAtYP-tS3W3J1C
    L3HPJrL6j94-Oo>
X-ME-Received: <xmr:mtpeYs840ChYyh-bPESp7R85ZD6PgmMcoc6ZIF-CLQ0OFJk4u8XNmjcoEd4i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepveefleduheekhfdtfffffedukeevtedu
    leekfffgudfhtdduhfevueefueegtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:mtpeYkqWaZltgz8ahDp54Cy3qwTIC01ffiPqe2I5OhoHkEcFCMOzIA>
    <xmx:mtpeYto9dyOuJXZjgRrr5WaoUfEftYvHVCGHg5g0M7TMOVCAAGh-Zg>
    <xmx:mtpeYiTONc3KufY-et_zsxj_BezyDE6ThL99UJkKxcMaEuZ7_i3efw>
    <xmx:m9peYvH_UzVfuY42CjmBrwi6sfXLZao4jKoJczCTp2NwogCblAz5qw>
Date: Tue, 19 Apr 2022 11:51:52 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 4/4] Add emacs file-local variables
Message-ID: <Yl7amclsnCl6aNws@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XKTcRyePo7OpsmLl"
Content-Disposition: inline
In-Reply-To: <Yl7WHv6+M+eJwQep@itl-email>


--XKTcRyePo7OpsmLl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 11:51:52 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 4/4] Add emacs file-local variables

These were very helpful for me when I was working on the code.
---
 xen/common/efi/boot.c    | 10 ++++++++++
 xen/common/efi/runtime.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 01b2409c5e..5415785bef 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1802,3 +1802,13 @@ void __init efi_init_memory(void)
     unmap_domain_page(efi_l4t);
 }
 #endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 4466d5379c..8021ecaecc 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -719,3 +719,13 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
     return rc;
 }
 #endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--XKTcRyePo7OpsmLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJe2pgACgkQsoi1X/+c
IsFk6g/8CngbYCHCGA8SU+crsh1r6B2PvhdbDrgIM2jLjR2j09xRhNDnoDSCtBV4
aSgOwd46GIjGq9ZTvoOgFelFN33gnE7Mf5l7+3QzAQrEx2tAo2e/+f0/zqNx1EXw
Kvoy5yYkcNwagONc96pl4MOLyFR9tPdbnDFyA/lg8BQW+T7WPalYLen45jvAHIZ0
EGViDyKVb0zL1dqLuW7LxbLD3cmjYOj581za50K6ijuxH/1FVKxBBY2iscHJf2R6
1661hb56fgeqPOOA2SLFjK+v34NnXRVNuBvQ1OVK3yXbROrIqHfwEZ+DrhpRv1XJ
EV4REasRY0RYoPM3V3f4CbwMoKmfQYCHrSzKrJof+556GH8FnZLfZUDLwTGUgzAz
89HygJQoNSQ6ajrYylNxIPphpnIZYWf9yMxH8//49FCxYxar0qecNv2uzX66OeDm
EcERpUxCu8TP1BRiLtqPl3F9x0q7ImiW5vEfRNTq/nsEpTNTSiG8yZtSqaqQ2fwj
wDFX+svA0d/wR6u7MgCvAEdUoJUk/OhwWZA7UNX82xruACt/Aa/SOG7fJ3w1YPCH
QdQeNa2WWK1LdWRj42pCpvm0BbVR9ud0RoFi8JZSy2jxK50bebjiXK6I3J/wk2Dm
SOLO7NdoxBBBbinplXavAxEJK9fO5DqwZ1ME/VhTWSEvZsVqH1M=
=tbQV
-----END PGP SIGNATURE-----

--XKTcRyePo7OpsmLl--

