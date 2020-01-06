Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9B13136B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:18:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTBA-0001kj-Ka; Mon, 06 Jan 2020 14:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioTB9-0001jt-0w
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:16:23 +0000
X-Inumbo-ID: 1896ed8a-308f-11ea-88e7-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1896ed8a-308f-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 14:16:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3F6C4747;
 Mon,  6 Jan 2020 09:16:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 09:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gS6mb9
 CvkyfX9zg2GB/mwVe2gt7E+18geqNZiGvfcF4=; b=hmqzYwAFn37Kg1jUn1EGzI
 mD0kV1oAIvHB9LMZonlnxnOjbzLkeRGsOzWdOXYswbujiQJL0a+FxCuQUpEwmF8X
 z0nqC8qJjNaVLWU4NSrshyfzBxBte3ZBctU0nMlL7xu4Ru5jpq58wFZ9TDi7rkRU
 yYu5HCF4QCj/THXWBXB8xJN8af4MF43fKR4lUXl2S2EiTrLza+mdX8PodEZmh2T2
 cxHgYdotz8z1weNVdTGH9a4TBdhZA97cW/t2uCmVMXWtKU7d3gfaGggfcusbzIiS
 2eiIX8NAqhgVphq4kRfFpuvFHGUm13jqdwG8qQBmo9moRRsLLIGxc3gfKJlQZSNw
 ==
X-ME-Sender: <xms:LEETXnrVtc7aHQvY4D8CCfQUsE-GVgicP09G8ZgBL44KPT6kziPaOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LEETXl521JoCQDHrHudcZKMDks-2fDHTWdPwisXP1QSYfa1kTS0wmQ>
 <xmx:LEETXvPGITNa6KIOBsntJ1GiybpynM0cJtwG5Fm_peB59pUVZ5vhxg>
 <xmx:LEETXvMQI0_wGiPXM2dNKEV59Vpq1YPOW9mv_Vi7I5jsUrJk6OBUow>
 <xmx:LEETXqC9qChq72hTxxnasSm_DyDAf95OBFgOQGR1EHcPDQ2PbkWuXg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 37E8830607B4;
 Mon,  6 Jan 2020 09:16:12 -0500 (EST)
Date: Mon, 6 Jan 2020 15:16:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200106141609.GI1314@mail-itl>
References: <20200104010759.GA2507@mail-itl>
 <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
 <20200106140418.GH1314@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200106140418.GH1314@mail-itl>
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3302267232974516381=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3302267232974516381==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline


--FeAIMMcddNRN4P4/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Broken PCI device passthrough, after XSA-302 fix?

On Mon, Jan 06, 2020 at 03:04:20PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Jan 06, 2020 at 12:18:31PM +0100, Jan Beulich wrote:
> > On 04.01.2020 02:07, Marek Marczykowski-G=C3=B3recki  wrote:
> > > I have a multi-function PCI device, behind a PCI bridge, that normally
> > > I assign to a single domain. But now it fails with:
> > >=20
> > > (XEN) [VT-D]d14: 0000:04:00.0 owned by d0!<G><0>assign 0000:05:00.0 t=
o dom14 failed (-22)
> >=20
> > Is this on the 1st attempt, or after the device had already been
> > assigned to some (same or other) guest? After quite a bit of
> > staring at the code I can't seem to be able to spot a difference
> > in behavior for the 1st attempt, but you not saying explicitly
> > that it would only happen on subsequent ones makes me assume you
> > run into the issue right away.
>=20
> Yes, it was the first try.
>=20
> > > This is Xen 4.8.5 + XSA patches. It started happening after some upda=
te
> > > during last few months, not really sure which one.
> >=20
> > Having a smaller window would of course help, as would ...
>=20
> The working version was just before XSAs of 2019-10-31  (which include
> XSA-302).
> But at this point, I'm not sure if no other configuration changes were
> made (see below).
>=20
> > > I guess it is because quarantine feature, so initial ownership of
> > > 0000:05:00.0 is different than the bridge it is connected to.
> > > I'm not sure if relevant for this case, but I also set
> > > pcidev->rdm_policy =3D LIBXL_RDM_RESERVE_POLICY_RELAXED.
> > >=20
> > > Booting with iommu=3Dno-quarantine helps. Note I do not use `xl
> > > pci-assignable-add` command, only bind the device to the pciback driv=
er
> > > in dom0.
> >=20
> > ... knowing whether behavior differs when using this preparatory
> > step.
>=20
> xl pci-assignable-add doesn't make a difference with XSA-306 applied.
> But I've tried xl pci-assignable-remove with interesting result:
> It succeeded for 0000:05:00.0 and 0000:05:00.2, but failed for
> 0000:05:00.1 with this message:
>=20
> (XEN) [VT-D]d0: 0000:05:00.1 owned by d32753!<G><0>deassign 0000:05:00.1
> from dom32753 failed (-22)

And now, after this operation (failed -remove) I get the following error
on domain start, even with LIBXL_RDM_RESERVE_POLICY_RELAXED properly
set:

(XEN) [VT-D]d13: 0000:05:00.1 owned by d32753!<G><0>assign 0000:05:00.1 to =
dom13 failed (-22)

I've tried doing -add and -remove in different order and every time it
fails for 0000:05:00.1, but works for other functions.
I don't see anything special about this function, compared to others.

I'll reboot the system and try again...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TQSkACgkQ24/THMrX
1yy81ggAlrSuaheerhHmz7bxhkevxfEMqF2Dtkdi0AyH6aTqdrn1W3Ec82HZwF2E
lrUbDB1hBUYSNE/R4euHuBSc4xlqdVyHafivNZXZJ2wqy6ZzvfzHwaw/TCTiLloq
un04o65avvRbUpaHJJdMiNuXnSvA45MIo1UdhjcjvyInTONSZGHR1+bw1iX0SSI/
gB2xRLGZmW+KFjGLtSF6nBPVtEDVQUW10NZRVd5QUiFJBJhIMJgT2rIWtRegCVDI
QbnTRHMKGc7aaOfigal0wnLllVjp1mddZEj1yReRD5cVVAiY6TAlQ1WQE2m4xeHI
oldJQFeImo0dzrHcIwVHIkm0CLCk/Q==
=iToh
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--


--===============3302267232974516381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3302267232974516381==--

