Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3237A4C4
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 12:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125730.236676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgPp3-0000jF-ID; Tue, 11 May 2021 10:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125730.236676; Tue, 11 May 2021 10:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgPp3-0000gi-F1; Tue, 11 May 2021 10:41:05 +0000
Received: by outflank-mailman (input) for mailman id 125730;
 Tue, 11 May 2021 10:41:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y01E=KG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lgPp1-0000gc-LE
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 10:41:03 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f3d9383-1c7c-4461-85bc-aabbd7f5c2c7;
 Tue, 11 May 2021 10:41:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A27A35C0153;
 Tue, 11 May 2021 06:41:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 11 May 2021 06:41:02 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 06:41:00 -0400 (EDT)
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
X-Inumbo-ID: 7f3d9383-1c7c-4461-85bc-aabbd7f5c2c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eEzsag
	JXE9j7VxBo+AWmXBF3pphXok7LzgFqbTTuun0=; b=ixCgNh0lNwMsRtRxLx2hRB
	UzT5a7tnSj8A3K3aN2hRP6BTzJNeXdmsHc9b4a/zoQzdZ9yyypxDPRg7MfbYlZAa
	kkuU3764t850EhzWsVzrSe0OgRcTwWv79BnG1yRyBi2OXLdk6/MDCzoMBeuD+wUD
	ZICsyFSPbpssORFFWD4JbFBgr/o1lc8KIq0btOcSKVwT40PXyb/QSd3yuLvG5873
	Ur9mvx3OGFcQ7WzBmaXQMXz7fR4Y5LIKFp+wgxG+8K7tOh/FeOje8awSuez58NhD
	p26x0b6dT6DOk7vjTTTswN0A1oABoyJqkXdN/XW3GiEYJ1cBS3M/Xu3Li6Kau3AA
	==
X-ME-Sender: <xms:PV-aYMeErmFrTBjHgQ5JxQtJKvc_eaDgw9HkGyed0gH-bR8-CzcJOQ>
    <xme:PV-aYONuA6TLf10pYFLHGhBuySeoxdACKfz8qhzewyYInckw5ROBHj5NT4BvsbXBh
    zVag659bGWRsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:PV-aYNiAuvUsPNlIR7j3RB1blVNYHa87XY2YlyNHOAElDsUfvauzXQ>
    <xmx:PV-aYB9YLoz1AuB59PCjt3gdqJJtM64QMCWqxLub_dvzQ0OW4AhumA>
    <xmx:PV-aYIsjv63Vn8a5Yb_VNFRElSxwMv8uHftTF4tTsvFzNBCiWnILyQ>
    <xmx:Pl-aYB73mFHwoWWil0pPOzUd5xu8VehXbIdpUGqWjUywjQQlf1bqrA>
Date: Tue, 11 May 2021 12:40:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Michael Brown <mbrown@fensystems.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
Message-ID: <YJpfORXIgEaWlQ7E@mail-itl>
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk>
 <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p94ypmT+e7ybeaDo"
Content-Disposition: inline
In-Reply-To: <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>


--p94ypmT+e7ybeaDo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 12:40:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Michael Brown <mbrown@fensystems.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching

On Tue, May 11, 2021 at 07:06:55AM +0000, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > Sent: 10 May 2021 20:43
> > To: Michael Brown <mbrown@fensystems.co.uk>; paul@xen.org
> > Cc: paul@xen.org; xen-devel@lists.xenproject.org; netdev@vger.kernel.or=
g; wei.liu@kernel.org; Durrant,
> > Paul <pdurrant@amazon.co.uk>
> > Subject: RE: [EXTERNAL] [PATCH] xen-netback: Check for hotplug-status e=
xistence before watching
> >=20
> > On Mon, May 10, 2021 at 08:06:55PM +0100, Michael Brown wrote:
> > > If you have a suggested patch, I'm happy to test that it doesn't rein=
troduce
> > > the regression bug that was fixed by this commit.
> >=20
> > Actually, I've just tested with a simple reloading xen-netfront module.=
 It
> > seems in this case, the hotplug script is not re-executed. In fact, I
> > think it should not be re-executed at all, since the vif interface
> > remains in place (it just gets NO-CARRIER flag).
> >=20
> > This brings a question, why removing hotplug-status in the first place?
> > The interface remains correctly configured by the hotplug script after
> > all. From the commit message:
> >=20
> >     xen-netback: remove 'hotplug-status' once it has served its purpose
> >=20
> >     Removing the 'hotplug-status' node in netback_remove() is wrong; th=
e script
> >     may not have completed. Only remove the node once the watch has fir=
ed and
> >     has been unregistered.
> >=20
> > I think the intention was to remove 'hotplug-status' node _later_ in
> > case of quickly adding and removing the interface. Is that right, Paul?
>=20
> The removal was done to allow unbind/bind to function correctly. IIRC bef=
ore the original patch doing a bind would stall forever waiting for the hot=
plug status to change, which would never happen.

Hmm, in that case maybe don't remove it at all in the backend, and let
it be cleaned up by the toolstack, when it removes other backend-related
nodes?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--p94ypmT+e7ybeaDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCaXzkACgkQ24/THMrX
1yzyiQf+IwD73XUVWyRPGJyFqKFetP/eCbzHBvyKLyaXxN9I3l0kWWExbMpoXd4C
8Hsj4VvjTaA8vf9GHItovqZR0xE0Qy6YcMheLS+/Jjj5RVlcqgWa5GXwh2S+LfsA
nCkTCClugpZpmeHIuJF6GhhW9fRfFJNVL7HN+24BCvL26GNjLn5BCOCaoxmr3GnW
w0QvxdnTJ1BsJg+Dxi3/7fsdAll/p52fF2DluejJC7wvAQzRUIvIQi+r0K1f71Ue
NlFgnI+dhhCVltg/uygZQZr5ykGWA8CgKVN8/SlOtByhiRoY8hn6ciOYF1nvx419
oz3KPLCdp0x90ccPg1lk7RTHDkf3cw==
=muMR
-----END PGP SIGNATURE-----

--p94ypmT+e7ybeaDo--

