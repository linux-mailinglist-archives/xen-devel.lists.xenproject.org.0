Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD10A157463
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:18:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j17xj-0000Oi-8E; Mon, 10 Feb 2020 12:14:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2F+1=36=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1j17xh-0000Oc-7w
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:14:49 +0000
X-Inumbo-ID: eecd09c2-4bfe-11ea-b4b3-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eecd09c2-4bfe-11ea-b4b3-12813bfff9fa;
 Mon, 10 Feb 2020 12:14:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BAA1521DC4;
 Mon, 10 Feb 2020 07:14:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 10 Feb 2020 07:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XVm6BS
 +bXo9l2LZfU83jaQtTVipCcQ5ADa3ZltKPx0w=; b=NI5xCo9NbOLfEt3k4kNT9o
 u0n3cUJZ6nZoUpkUM+0eAU/AFdymayWVl/g1rk270zuqG11cxTUPkpfz+MxqKVg+
 5+COhE5kbzsSPe2daUb3jRWodxSEOY2q5jlrSfcJTzZE+u3z8Ahyn9gamawGCnL9
 mrFUzY+rhKXKlCm/gW+UsZk5zv1I5k8x78UncMVePiLYOzCTRXhWiBOI/6gE6Vkv
 ajBcMYRq287sDxAEip6+2XnQi7MD9+w9kOs3Obgf+Lhi7H+GTiZx5OSmUGvUrfWc
 QjttmpEfGUGRLaCd+osTYYRxW2KTNFvzhrG+ldge+iy9kgy6d5v0GWFY7Prg+meg
 ==
X-ME-Sender: <xms:OElBXk3Wd92yVqiliWao9Ezw7Wktxew6VH47jgKg1DumxvltF384KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdr
 ohhrghenucfkphepjeejrddvgeefrddukeefrddvtdefnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
 lhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:OElBXsAqGN8RB0VDBfBR_Y7ltl1bYHK7zrHH83P3jLPeEwEzDCaoiw>
 <xmx:OElBXojRmxFQw0V8q9V5biq5kBNq7dG1-3RrMKZzxwoI2VvadSj41g>
 <xmx:OElBXmP1Nr_bd0VvlgTmSt-mmjgGRcolNcLGtZp2nC_VPf7wCXE-jQ>
 <xmx:OElBXpLOkfNHbHXYXtRzpVJKH1JjHvGCnbPtz1mu25FZWn_PlCLlkA>
Received: from mail-itl (unknown [77.243.183.203])
 by mail.messagingengine.com (Postfix) with ESMTPA id 590A83280059;
 Mon, 10 Feb 2020 07:14:47 -0500 (EST)
Date: Mon, 10 Feb 2020 13:14:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Claudia <claudia1@disroot.org>
Message-ID: <20200210121443.GQ7869@mail-itl>
References: <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
 <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
MIME-Version: 1.0
In-Reply-To: <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, zachm1996@gmail.com,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============8199367590215342507=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8199367590215342507==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vzUQzca511KWT6Hk"
Content-Disposition: inline


--vzUQzca511KWT6Hk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch

On Mon, Feb 10, 2020 at 11:17:34AM +0000, Andrew Cooper wrote:
> On 10/02/2020 08:55, Jan Beulich wrote:
> > On 10.02.2020 00:06, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>
> >> Multiple Qubes users have reported issues with resuming from S3 on AMD
> >> systems (Ryzen 2500U, Ryzen Pro 3700U, maybe more). The error message
> >> is:
> >>
> >> (XEN) CPU0: cap[ 1] is 7ed8320b (expected f6d8320b)
> >>
> >> If I read it right, this is:
> >>   - OSXSAVE: 0 -> 1
> >>   - HYPERVISOR: 1 -> 0
> >>
> >> Commenting out the panic on a failed recheck_cpu_features() in power.c
> >> makes the system work after resume, reportedly stable. But that doesn't
> >> sounds like a good idea generally.
> >>
> >> Is this difference a Xen fault (some missing MSR / other register
> >> restore on resume)? Or BIOS vendor / AMD, that could be worked around =
in
> >> Xen?
> > The transition of the HYPERVISOR bit is definitely a Xen issue,
> > with Andrew having sent a patch already (iirc).
>=20
> https://lore.kernel.org/xen-devel/20200127202121.2961-1-andrew.cooper3@ci=
trix.com/
>=20
> Code is correct.=C2=A0 Commit message needs rework, including in light of
> this discovery.=C2=A0 (I may eventually split it into two patches.)

Claudia, do you want to test with this patch?

> > The OSXSAVE part is a little more surprising,
>=20
> Not to me.=C2=A0 The checks only care if feature bits have gone missing, =
not
> if new ones have appeared.
>=20
> mmu_cr4_features includes OSXSAVE (from much later on boot than features
> get cached), so the s3 path observing the gain of OSXSAVE will have been
> happening ever since the checks were introduced (even on Intel.)

Is "x86: store cr4 during suspend/resume" patch from Roger related to
this?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--vzUQzca511KWT6Hk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5BSTQACgkQ24/THMrX
1ywJNAf/YSiKiRPgvRTH5bqANSObTKyGVZmKITpo5XXmw8Gk36Im3HsCZ/9Vd2KN
tWalgd9RwHiboDbN/jV8QWZsJR/MlBzVALeSAQvpUwdXHoc25TFfSncththIDoas
Cg1bRe2QQSwoZOXiejLVneaXdEZsgiinGdF7yWaoY6rx6tKG4kRUjmeNi3lE0euy
CkJWImQGcNyx9rXOGAJPqb0q9g08zmyBs2FrZ8Rjt6LORmvh91B/WzMevclQB70f
23cqaigzTKz5vq4eXehhIfN5sXtCn3eScoP2+fzQ2N3SxGbuYvGTytyV4EibkFx4
7ECYdQt0UZLytkJMR1idAKbq19zvZA==
=Wpv6
-----END PGP SIGNATURE-----

--vzUQzca511KWT6Hk--


--===============8199367590215342507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8199367590215342507==--

