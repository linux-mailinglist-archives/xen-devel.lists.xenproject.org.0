Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80313FC1
	for <lists+xen-devel@lfdr.de>; Sun,  5 May 2019 15:30:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNHBO-0004MR-NG; Sun, 05 May 2019 13:27:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNHBN-0004ML-6D
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 13:27:57 +0000
X-Inumbo-ID: 912096ba-6f39-11e9-b948-33085154e0f1
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 912096ba-6f39-11e9-b948-33085154e0f1;
 Sun, 05 May 2019 13:27:45 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 629EE21D
 for <xen-devel@lists.xenproject.org>; Sun,  5 May 2019 09:27:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 05 May 2019 09:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Nem5WqYlEHUMiup88yKxO0CT8sa4i
 stVJ+4hoVZwzLQ=; b=M0FvPc7RenQqCBLOeGo/N1B7+LvI0rCVbsVtycVyXeU0Y
 jYKO75qjh5xw+PmKQoP9/5CItxEPf7Q1i7hz82hiDsbp3aSVj84bHMCEPxMnYSz1
 7sb+bm9Ohs61ce+EERTxazg9HcFER1PX+Q6Jit0F8dWy3/DrqRIetNbmKBjYl8Bf
 3g6+1wzFTSMaiTvA6wXlyRp/LUmx0yh9X7gch3KdPQhHM4L2XuxL8jFfDxPp+SDC
 Rg501ZBiw/Fe4NNcQRagJ43Ys+Hz1NjQaTfTEI2HL0xP1d5X3F6ZtWpfnO2PXLDK
 AUHphcKFJ+KTazY2mUdL8dAgVnwqBbo4RHjsLMNkA==
X-ME-Sender: <xms:z-TOXEF3x1qVddOVRn1lOAVEk88eZ1_oa7s4hEUceQ8bPk5bRB4omA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeehgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggufgesghdtreertd
 erjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghr
 mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptd
X-ME-Proxy: <xmx:z-TOXP9r873jXcqt6i3zfF5UQmQBmBOSet_h-ao91BmssCBudNCKUQ>
 <xmx:z-TOXNrD2Z6Gp51JHm7_7zzg0JoY-cBBGTdIMegP-7IN4acRON7N8w>
 <xmx:z-TOXHYzLJELvAPg8PeDqM-Upk54ACjvZ3CCfkVeeBjSBzfAuYXBjQ>
 <xmx:0OTOXAx_zdwFj1TxsMGWhif5Rfp6DQu7CyW6QS8TTKijd6z5V-N8jA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 586FEE44B5
 for <xen-devel@lists.xenproject.org>; Sun,  5 May 2019 09:27:43 -0400 (EDT)
Date: Sun, 5 May 2019 15:27:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20190505132740.GT1728@mail-itl>
MIME-Version: 1.0
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: [Xen-devel] {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
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
Content-Type: multipart/mixed; boundary="===============3077111936154259749=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3077111936154259749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Content-Disposition: inline


--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: {xen,dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small

Hi,

I have a machine that allocate vesa LFB above 4GB, as reported by UEFI
GOP. At 0x4000000000 to be specific.
vga_console_info.u.vesa_lfb.lfb_base is a 32bit field, so it gets
truncated, leading to all kind of memory corruptions when something
writes there.
If that would be only about Xen, that wouldn't be that bad, but
unfortunately exactly the same structure is used as an interface for
dom0 start info (at least PV one).
My only idea is to introduce yet another entry in *_vga_console_info.u
union (efi_lfb64?) with a 64bit lfb_base field. And mark it in
video_type (XEN_VGATYPE_EFI_LFB64?). But I'm not sure how non-patched
Linux (or other supported OSes) would respond to this. xen_init_vga() in
Linux doesn't seem to bail on unknown video_type, so it may be fragile.

Any better ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzO5MwACgkQ24/THMrX
1yyWFwf/cajomXTfDGFNaosEYL0lcjpjnx1jBd9aqGKB+6/IU74xtd8ICYygy5V2
tQfAMYNP8WE+wMe8UnxqFUVH6yQH7diu3MYrOvvUaO69z28bjh7r14skPNyYonMS
yUpZwMumiuEeFwLm111LGdQKmHbWTwMon45KSY9TDOqxULJtWg+tO/kLBdfpLgVC
Yl5fY0xWXzchNXy383xh38giaKV89WQQQNZ9He+2miA7zxZQ2Zqbw5/Va/tJz61n
KtSzHagjEgsi5bMquvpG+w6/236pDhyrUc+5mU6ZiQUZh6xWWaouxJ/hkoKuJUuz
io41fdVh2urcD9VuV8cQMGDdMBoVrA==
=weM5
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--


--===============3077111936154259749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3077111936154259749==--

