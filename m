Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A90144954
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 02:29:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu4ng-0002SS-CY; Wed, 22 Jan 2020 01:27:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1mKO=3L=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu4nf-0002SN-4f
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 01:27:19 +0000
X-Inumbo-ID: 54274b1e-3cb6-11ea-bbc4-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54274b1e-3cb6-11ea-bbc4-12813bfff9fa;
 Wed, 22 Jan 2020 01:27:18 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A803221B6;
 Tue, 21 Jan 2020 20:27:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 20:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+OAFTp
 KEH6fpiVzQNKeJZkaXmAeyWiRnqRCSiuaEgj0=; b=ZbHqzyc+uIjOYLQX2IhwTo
 dTstV7w8d5j/pCrryiP0J2QOIED+8c5RvDeGJ3UQwGQ01WjKoCNE7IB3ACB3v6SR
 9SVX+exPbopfOi68r1WZgI8VfyRZ2teghO6BJkkruOzFNfMt9YkIzu14x72+myMT
 sohJY3rgTGQdhDbwfyfl0Qyav7xqv0QkKRVtbDHOYfs8cvNB8Wy4R7v816QqjBHY
 yD/6wgjqyxnpxbDb6qQ6TeinCdEi/tR56iKjOwYeSXxNL+jc64hrqm1uFSJIGbYn
 bK5RVlbWWruLk5QAg7XHv669RnuNtAF4Wioc6KUA0Xq3TcZTedgE3ehc1ndVbXow
 ==
X-ME-Sender: <xms:9aQnXiUdhKE5FQaFAnzjXed9RaONMj0asCWhbOGdpAWigxrqev1Dyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudelgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
 ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
 enucfkphepledurdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9aQnXjI6B07M7bHikjcKb_xT_yAR3OINpAZ_5BCY7QbIkw4C9AsVNg>
 <xmx:9aQnXjgzVfpUnuEJHvlOLJFtA-EagFcvA62goZenioRz8e3RsqerEQ>
 <xmx:9aQnXgKwpiyeTnKKyjSjm2G7vALNJiWSW6K4MCMXGk8OXsXc8cXrPw>
 <xmx:9qQnXsLzN49UVMTGPTUjBUI3k3artQAIf2mYpAWcKW9tsqPr-IzI0g>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 595483060B2C;
 Tue, 21 Jan 2020 20:27:17 -0500 (EST)
Date: Wed, 22 Jan 2020 02:27:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200122012713.GB2995@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1284035258.1445298.1579543677315@mail.yahoo.com>
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: "rnikola@vt.edu" <rnikola@vt.edu>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2954982005326357829=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2954982005326357829==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] HVM Driver Domain

On Mon, Jan 20, 2020 at 06:07:57PM +0000, tosher 1 wrote:
> Hi all,
>=20
> I was doing some experiments on the Xen network Driver Domain using Ubunt=
u 18.04.=C2=A0 I was able to see the driver domain works fine when I run it=
 in PV mode. However, I wasn't able to make the driver domain work when I r=
un it in HVM mode. I get the following error when I want my DomU to use HVM=
 driver domain for network backend.
>=20
> libxl: error: libxl_nic.c:652:libxl__device_nic_set_devids: Domain 25:Una=
ble to set nic defaults for nic 0
>=20
> Other than this, I didn't get any log messages from dmesg, xl dmesg comma=
nds, and files from /var/log/xen/ directory regarding this failure. Therefo=
re, I was wondering if it is even possible to create an HVM Driver Domain. =
Please let me know what you think.

It's definitely possible, as we use it extensively in Qubes, including
for network device backend.
Can you give more details about your setup? Which Xen version, what your
domU configuration looks like (especially vif setting)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4npPIACgkQ24/THMrX
1yx11Qf+KIStZO29EAirrP7nFs44yJ+qEinSGGDQQY1wyH0F+NKA6Uhm4gRyzyTf
stKb2orhyctUi0eLI6zdfQaolXLjjZQPXtinL4Yilaf+h6IoSGkwgDt/hGh7g7Yt
NTHch3DYbtlJdU5n/1Zrj9oWP53CUJD7O0Ul/Qu67V//Rf1MXQT2HqtHtNPKeHV4
/+J+MgrlBLP7QjURN+dtnpjT8vwsoF/dXYliXSBn9kVBFyM6T8BNkeVUfFhtSv+/
k/pGUcRe9dcA0ZNjiEH+usucJzZ8uokjJ9HN9ceU+VbOlotxWkyFb/tsSdUpDt9w
73aS507Ja8DFaOw9jHh32KwEPbH+Zg==
=Etto
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--


--===============2954982005326357829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2954982005326357829==--

