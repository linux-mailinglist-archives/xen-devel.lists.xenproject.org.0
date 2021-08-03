Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5A3DEEA7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163459.299424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAu30-0008Af-S9; Tue, 03 Aug 2021 13:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163459.299424; Tue, 03 Aug 2021 13:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAu30-00087r-PA; Tue, 03 Aug 2021 13:01:30 +0000
Received: by outflank-mailman (input) for mailman id 163459;
 Tue, 03 Aug 2021 13:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mAu2z-00087l-Jc
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:01:29 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cbc7696-5ac8-4a6a-af95-6322bcde5104;
 Tue, 03 Aug 2021 13:01:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 78F0A5C00BC;
 Tue,  3 Aug 2021 09:01:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 03 Aug 2021 09:01:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 09:01:26 -0400 (EDT)
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
X-Inumbo-ID: 9cbc7696-5ac8-4a6a-af95-6322bcde5104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XZ2shu
	MxeDViepznMR+SxYu09mNwilsAtfmjFXhWDZ4=; b=TCbeXK1P9h4ZEe9bTtHH80
	ddwmxSMHplnPeoA6oBqDgGwUmUXlmYlObaFpFKOnJPt9lA1vV2UP8fvaQHvGYVVR
	dez1EN5eGbD3/iFk3Qfd0Dmf8A04i+BNXiCXqazh8EMPdwY8fHMgFz+1/qLwkVpN
	v6G/ANtOPBjIJbA+8HKBFpr6EWJiy0gxq0GRoiNo/n7VirNJMGbRGrV5r3xiqIUU
	muAjv/brKvzPMiuDy7a1jnmDBkKSZ2iPbgi8vcRcevsHG99F0IduG9FRZridfeqn
	TumS75pQzkd6F+u6pPO9p3coKIZrIhByDlYoq92oPepV3nEIM60iHcQYxOhVg5IQ
	==
X-ME-Sender: <xms:Jz4JYWfi6cx_c6zhT3IvSv29J1mIp2QQ-uFwdxNqeT1cnOz-fo7F0g>
    <xme:Jz4JYQMM6LGwnrgagxTuiCpn5cCgNIEA9-cR2s3DTfhXFq-AcCpOuZrZrEvz_Gkn0
    am0zrmvCIInpQ>
X-ME-Received: <xmr:Jz4JYXgnvN4_c7PQ94WMbhrILqZXLcnPzi6RNv51z19yeWteFsRzMp9f6IS0tFSpcmWOJBO-_Wo7a8qXee4u0e03qvISpdIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Jz4JYT8KFpm8UBUANqwHdBvLpHrJjZ7rl1IpgDvM8fGYp431BjfspA>
    <xmx:Jz4JYSu77kueg_DzSXuvGSsPS92G5IuvS4VpYsV6ZGPVuD0iz5HgJA>
    <xmx:Jz4JYaHvWCfyXHYzt3MlKzKN4mVTG-_UURFkH8P3-xYAPM5wHehBNQ>
    <xmx:KD4JYXV-piNXJMvAc2N0XgSILJ9qxU_47d3jH5x7A3rbWthrbmOQNw>
Date: Tue, 3 Aug 2021 15:01:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <YQk+I2FglGrnuyPw@mail-itl>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl>
 <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9nyJt4zKgrMHMyd5"
Content-Disposition: inline
In-Reply-To: <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>


--9nyJt4zKgrMHMyd5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Aug 2021 15:01:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings

On Tue, Aug 03, 2021 at 02:29:01PM +0200, Jan Beulich wrote:
> On 03.08.2021 14:21, Marek Marczykowski-G=C3=B3recki wrote:
> > If we would have an option (in
> > toolstack, or Xen) to force interrupt remapping, then indeed when it's
> > broken, PCI passthrough should be refused (or maybe even system should
> > refuse to boot if we'd have something like iommu=3Dintremap=3Drequire).=
 But
> > none of those actually exists.
>=20
> "iommu=3Dforce" actually does prevent boot from completing when
> interrupt remapping is available, but then gets turned off for
> some reason. See iommu_setup()'s
>=20
>     bool_t force_intremap =3D force_iommu && iommu_intremap;

Ok, then, just setting iommu_intremap=3Dfalse should do the right thing,
if platform_quirks_init() is called somewhere between the above line,
and actual enforcement of iommu=3Dforce few lines later. I couldn't
quickly find if that is the case - is it?

Anyway, this still doesn't give the toolstack, or the admin sufficient
control, because there is no way to express "use PCI passthrough only if
IOMMU _and_ interrupt remapping is in use". Even with iommu=3Dforce,
because intremap could simply be missing on the platform. So, to be
sure, the admin still need to inspect the boot log to fish that
information out - could do that in the "intremap broken" case as well.

So, iommu=3Dforce should either always require intremap too (IMO less
preferable), or there should be separate intremap=3Dforce, that prevents
the boot if intremap cannot be used for any reason. Even better, if the
toolstack could figure it out, and apply the admin policy on per-domain
basis, but that's a broader change (that IMO should not be a part of a
bugfix).

> > And disabling the whole IOMMU in some
> > cases of unusable intremap, but not the others, is not exactly useful
> > thing to do (it breaks some cases, but still doesn't allow to reason
> > about intremap in toolstack).
> >=20
> > So, I propose to disable just iommu_intremap if it's broken as part of
> > this bug fix. But, independently (and _not_ as a pre-requisite) do
> > either:
> >  - let the toolstack know if intremap is used, or
>=20
> I don't follow why you even emphasize the "not" on this being a prereq.
> I consider it a plain bug (with possibly a security angle) that PCI
> pass-through may be permitted by the tool stack in the absence of
> interrupt remapping, without an explicit admin request to enable this
> (even) less secure mode of operation. Not making this a prereq would
> mean to widen the scope of the bug.

As explained above - the scope here doesn't really matter. Admin
currently (with or without this commit) cannot rely on intremap being
used, even with iommu=3Dforce. For that, admin needs to inspect the boot
log. And when done, inspecting the boot log will catch both cases -
intremap missing and intremap broken. But, disabling the whole IOMMU if
intremap is broken, doesn't even allow to make a conscious choice to
choose to use it. This breaks the (very much valid) configuration of
running a _trusted_ HVM guest with PCI passthorugh, on some platforms.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9nyJt4zKgrMHMyd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEJPiMACgkQ24/THMrX
1ywafQf9GwHWIUOBGFSuVzxw652VTMZI8mmgzkQMe5ezYyIDQrPBFR1RZVCpA82z
PQyjDfKTNIxPA6v0P/Ss2ZXALe6OJi3Mn1Vsl14w6LYoUAUpPxUBa57c/UH/hu3/
BQuK57OZhIkAsECyDPbRWyf8AHjxumRhxilIV7KFinIYR1pNtbgS8326Dif5uGSJ
zjCuQSnqdFgbrW72nN81m1jFBnLoE12dCA7lvy6CghPtcpaQPzmDhiwZ5hMafWYN
RTG+XHDAFS8OvnICP5G6dikFEXItpHEM/cjeTC22mr6fOLtl2boo+i01knFOqRLg
8AX3xqHdzLaYM7ZfQs5TI92KJlDsPQ==
=jA2X
-----END PGP SIGNATURE-----

--9nyJt4zKgrMHMyd5--

