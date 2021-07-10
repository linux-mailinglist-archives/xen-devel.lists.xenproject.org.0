Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D03C2C58
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jul 2021 03:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153914.284401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m21dC-0008NY-TQ; Sat, 10 Jul 2021 01:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153914.284401; Sat, 10 Jul 2021 01:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m21dC-0008Kr-QC; Sat, 10 Jul 2021 01:18:10 +0000
Received: by outflank-mailman (input) for mailman id 153914;
 Sat, 10 Jul 2021 01:18:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6jBP=MC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m21dA-0008Kl-Dm
 for xen-devel@lists.xenproject.org; Sat, 10 Jul 2021 01:18:08 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeeb5034-e11c-11eb-8630-12813bfff9fa;
 Sat, 10 Jul 2021 01:18:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DDDA5C00D3;
 Fri,  9 Jul 2021 21:18:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 09 Jul 2021 21:18:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 21:18:05 -0400 (EDT)
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
X-Inumbo-ID: aeeb5034-e11c-11eb-8630-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bZemiW
	HC6mJXf+fhe+/akDBGDyErdmDCwBUBBwrstFs=; b=v1jOmZPSyEypAaXv8ZWizy
	uj8/zR28wuNNzcFqz5dRUCE8sKP6rFwYY8c/ZSPl2ifaRRphg7HKG5NXiYQWgCwc
	H/LKqHdIyU/Vg15VhRfwxu2Ul5WQ8Ac8kXGTAjkgIW7OXzEn6xtxkHLqDpVbf2Zq
	7BJp0/oxYqKI+YFPifTqa+NoAJaX7YwUuMiZHTkBG7WN800bNi5WjmAcz/gawOQS
	/2UDltySyhtfAiLkqi5avdYbbGg+U3Ll+P5Akx4lKeYT2qzPhPA/OKAfjV07DvZW
	q3e0Z3FZT/Vkhs8peZ4T+na0eKxovG0tQqwoQaRjMZflqhG8fZ/Z8m7w1tkGLcjw
	==
X-ME-Sender: <xms:TvXoYCFSe4NyrgJzz6TBoSxqsgAXmcHA_cCmLhhzPtWxgiRYUiDNpw>
    <xme:TvXoYDW6rWMZ2AeZY4RZSutQD71AQfjhONWVJnY8C5jAA-ebjssYoU-P4UcLCDZTZ
    jDzFUna0nJX3A>
X-ME-Received: <xmr:TvXoYMI-gBzGNZ0-i51wiO-fyqQt8fo0ZKgH7FqUvl5cRgc0Cs7hZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvedvlefh
    udevlefgvddvkeeftddvudejgfethedvveelkefhleevheegfedvgfdunecuffhomhgrih
    hnpeigvghnphhrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:TvXoYMFwuLami-TOm7JV-2p9DvvMeQcJ3qdLQvpAU6AK1dYqvnE55Q>
    <xmx:TvXoYIUsBQ7JeqSdM81i7dEGMnrHjrVD4cwg7axesw4R5uJnyYqsLA>
    <xmx:TvXoYPMOtn_z3__hx7s_S5VHU6xwi52aAxJvsHk8Ub6-vtNtfzIUmg>
    <xmx:T_XoYKKBVZsRGqBIE5i2o9KXolVbCqBHgqOEt_4Fa8T7F_npwlrRrA>
Date: Sat, 10 Jul 2021 03:18:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 0/3] xen: harden blkfront against malicious backends
Message-ID: <YOj1Spa1hitL61j/@mail-itl>
References: <20210708124345.10173-1-jgross@suse.com>
 <YOcKJ6m31tHuq2kh@char.us.oracle.com>
 <0baeba93-39eb-2bae-1abd-d4e17e6e025e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ge6yG1DC6TeEMfry"
Content-Disposition: inline
In-Reply-To: <0baeba93-39eb-2bae-1abd-d4e17e6e025e@suse.com>


--Ge6yG1DC6TeEMfry
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 03:18:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 0/3] xen: harden blkfront against malicious backends

On Thu, Jul 08, 2021 at 04:39:58PM +0200, Juergen Gross wrote:
> On 08.07.21 16:22, Konrad Rzeszutek Wilk wrote:
> > On Thu, Jul 08, 2021 at 02:43:42PM +0200, Juergen Gross wrote:
> > > Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> > > user land, or in a driver domain. This means that a backend might
> > > reside in a less trusted environment than the Xen core components, so
> > > a backend should not be able to do harm to a Xen guest (it can still
> > > mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> > > other means or cause a privilege escalation in the guest).
> > >=20
> > > Unfortunately blkfront in the Linux kernel is fully trusting its
> > > backend. This series is fixing blkfront in this regard.
> > >=20
> > > It was discussed to handle this as a security problem, but the topic
> > > was discussed in public before, so it isn't a real secret.
> >=20
> > Wow. This looks like what Marek did .. in 2018!
> >=20
> > https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg02336.h=
tml
>=20
> Yes, seems to have been a similar goal.
>=20
> > Would it be worth crediting Marek?
>=20
> I'm fine mentioning his patches, but I didn't know of his patches until
> having sent out V1 of my series.

Some email issue likely? You were on explicit CC in that series.

> I'd be interested in learning why his patches haven't been taken back
> then.

Mostly it was waiting in limbo on "public: add RING_COPY_RESPONSE()"[1] pat=
ch
to the Xen tree, to be then synchronized back to Linux headers. That patch
was finally committed in March this year. I should've followed up on it,
earlier than 3 years later...

[1] https://lore.kernel.org/xen-devel/20180430215436.21062-1-marmarek@invis=
iblethingslab.com/T/#u

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Ge6yG1DC6TeEMfry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmDo9UsACgkQ24/THMrX
1yw/9gf5AU6+c7KNNXatKEEkWqWF9n+TvflptjRsFCE3FC/WAeidzxn6Rgz/mRSx
m0BR7Q6h3UhVOTTF5c/CmcVcrHOs8BZUeL0MAZuyDDYpa8bZWgfFFsW8k5//deh6
fRkX91YuB0uh2Bopgug/CujeGfvg4AbbDweI16OmECqx1sjqX6KrZmj8uHUz8A0f
AX2vTmWi1tEI9E+tJY5nNxaTIjzFEmB1aTgbbFUjbtvedzpDUhWkjCcB2oSza5+c
eiUIsuxB+Vtjbs/FOPflhSwE7mZTWeoohdhPxY9k8kRxlE7Q9FORNFMX6vSxVpLy
hVAz0mhhmdDTi252V/zLYuABcymTQQ==
=c9JX
-----END PGP SIGNATURE-----

--Ge6yG1DC6TeEMfry--

