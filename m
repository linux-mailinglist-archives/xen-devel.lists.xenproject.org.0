Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F4304220
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75191.135331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Q7J-0004pJ-I8; Tue, 26 Jan 2021 15:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75191.135331; Tue, 26 Jan 2021 15:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Q7J-0004ou-EK; Tue, 26 Jan 2021 15:18:53 +0000
Received: by outflank-mailman (input) for mailman id 75191;
 Tue, 26 Jan 2021 15:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zal3=G5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l4Q7I-0004om-2c
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:18:52 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21848482-eff4-43d5-bab3-957c1971b02a;
 Tue, 26 Jan 2021 15:18:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 85F8E5C0193;
 Tue, 26 Jan 2021 10:18:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 26 Jan 2021 10:18:50 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 877D61080069;
 Tue, 26 Jan 2021 10:18:48 -0500 (EST)
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
X-Inumbo-ID: 21848482-eff4-43d5-bab3-957c1971b02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=us25kM
	QiUj0TA8uRt1DxVmPFLL3rkNcahgV7qfZ5DN8=; b=jvKqGUFXLyxGzrzaCKHAA5
	Stk9Tbzxp5uiRiCnsROpLSXje4w1zaSlRTitGQ6oa+voWtpqvjCpETNi1/s1gYqi
	nVYnsbZWog4ACEBV737lVCv+FXAHLjQQgn1AHkAVO8Bn2aID4n4vjy1KafvWIoti
	QjbEBin7s47HdAC/5cLc+fkaoXg2YNE6ujeHobQBc4cuG6k3rgsquIBopJPFezpD
	EpwLOYm0XtfgO+0MZPDpblBO3ktrkXFW7Hhc71k+4T1EexyseKE5xnp1rGNMDCTL
	k7mnb1PxKOPSsTqqkgnfMAUTijzg7GOeRdIzTP6GfxyUo7kLGAG/FAk9fny8gpWQ
	==
X-ME-Sender: <xms:2TIQYGIK9qe3S3RC5l15CREZAb_jpZ1AXqnk3dhIpGRML6mN1wooag>
    <xme:2TIQYOKTZGf1Hj2gqykdDFheTE2pYAn71y8nFNe9BdcDVZSCTmK4F_uJfQMozz25d
    zDPBd0a8-madw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:2TIQYGtbaKq7PGmGYHTOgJljLwu6EycJKekQ4dvLKz8UDsGxUIbPbA>
    <xmx:2TIQYLZ6GKYWW0PKqtVf5y2HKDZNo0eS5CFMqHx4bmvAS-BUNE05wA>
    <xmx:2TIQYNaHt-au2JDTR1XpadFVecNZkolIKDwm7OePu2BdnScKqiQWzw>
    <xmx:2jIQYCPMYrF4KpJwhJSObjS2pKcHbT_CZkuD1468fnOT-iYar8Sv8g>
Date: Tue, 26 Jan 2021 16:18:44 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Message-ID: <20210126151844.GA2109@mail-itl>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
 <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
 <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
 <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
 <24592.5760.197643.853055@mariner.uk.xensource.com>
 <e216b834-793a-0ace-49ab-c21a4febde3a@suse.com>
 <F7910701-ECBD-42AB-B36F-DFAC57FC72A4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <F7910701-ECBD-42AB-B36F-DFAC57FC72A4@arm.com>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED

On Tue, Jan 26, 2021 at 01:20:14PM +0000, Bertrand Marquis wrote:
>=20
>=20
> > On 26 Jan 2021, at 13:19, Jan Beulich <jbeulich@suse.com> wrote:
> >=20
> > On 26.01.2021 14:17, Ian Jackson wrote:
> >> Jan Beulich writes ("Re: [PATCH v4 1/2] xen: EXPERT clean-up and intro=
duce UNSUPPORTED"):
> >>> On 26.01.2021 12:17, Bertrand Marquis wrote:
> >>>> Maybe something we could explain more clearly in the UNSUPPORTED/EXP=
ERT
> >>>> config parameters instead ?
> >>>> We could also make that more clear in the help of such parameters di=
rectly.
> >>>>=20
> >>>> I do not see how we could make that more clear directly in the promp=
t (as
> >>>> making it too long is not a good solution).
> >>>=20
> >>> My main request is that such tags be added only if there's
> >>> absolutely no ambiguity. Anything else (requiring longer
> >>> explanations in many cases) should be expressed in the help
> >>> text of the option, or in yet other ways (a referral to
> >>> SUPPORT.md comes to mind).
> >>=20
> >> Is
> >>=20
> >>>>>>> +	bool "Harden the branch predictor against aliasing attacks (dis=
abling UNSUPPORTED)" if UNSUPPORTED
> >>=20
> >> too long ?
> >=20
> > It may be tolerable, but it is getting longish imo.
>=20
> I am also not quite sure this is making things clearer.

IMO it the original version strongly suggested that _enabling_ the
option is unsupported (and quite confusing why it was enabled by
default). When browsing the menu, it isn't really clear what is the
default value, and even if it would be, it's totally not obvious that the
meaning of "(UNSUPPORTED)" depends on default option value.

So, yes, I think "(disabling UNSUPPORTED)" is significantly better for
such cases.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAQMtQACgkQ24/THMrX
1yxIMggAhgZZYLc+yPVoPw0o3NrRA8FOoyZJ/Rsjyl55rMaZsTD6Gjdj/hZPXlH7
93x0LvqYJjGUcoEe04wZK1V+NgE8srwLvNRDw5dh3N9a2wfo1Hg+fgD8BXU+qWHY
Vx8ELAKvQr0TQdQ0+UF5Vsej8hepz/cQsRI6RicsTtPKF2h6e0/gaOU4QWnPhmG1
KPDFjIrkmjX7/KTbXecCI2OZjsLnhcJnp9beNFGml8bG6bSCma+N8nug6TMEFXiq
+7RpUw9CPL2P6SCcd4dVo8ba9ViLVAK8PNGn9FVevu+nITDBtGXTn1zPAXDhbsAK
imV3JZ0mgUeqDuRICVe62KqBPcBo+Q==
=rZSJ
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

