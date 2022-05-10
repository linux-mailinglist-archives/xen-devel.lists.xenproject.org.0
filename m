Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA03521FE6
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325827.548587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noS5z-00061V-Hk; Tue, 10 May 2022 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325827.548587; Tue, 10 May 2022 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noS5z-0005yf-EY; Tue, 10 May 2022 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 325827;
 Tue, 10 May 2022 15:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgyf=VS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1noS5y-0005yJ-Ak
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:48:18 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac52ef9-d078-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 17:48:17 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EF3C85C00EE;
 Tue, 10 May 2022 11:48:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 10 May 2022 11:48:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 11:48:13 -0400 (EDT)
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
X-Inumbo-ID: 9ac52ef9-d078-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652197694; x=
	1652284094; bh=lcJtNWW1XlCbNiro7UWx15PiLnn2igC5kde/c5Qe+bE=; b=c
	xHp20Y/O6jN51F4dUWTZbfHybcqx6DLdrYDkzs9S9NgYKh31zEWTIrMJsLxbGysr
	smY8KAO40ntMDPbPtcdhfpvKek/hexeksMrESpT3ugOUI2tNPFOfXCSs+bOupqy+
	aK/XE+it8/HimntXNTVrUPzSsxBCJWpRIitNiJT/v+ECBNSgWxR9vwACg/4umAnp
	oHTnIrF/8/G/2D9zwTrA4mCHK6kc0FsWkgDS0Kste0KHtpFKEDIUZBB3W5TE6X9H
	E9wY8H6IZZIkettNNFw37QMWXkCrBh6gg0gtnzjUNFlh9aetthQmOFbi/QIGGhwB
	NH7hkHhPhqscfKZJiWnhA==
X-ME-Sender: <xms:Pol6YgqA6k7pC1ofbsFds7Pj4At4Af-nsUvV3vQ_Sab6rpyttU7yhw>
    <xme:Pol6YmqcD0YGSlfBasuPrusSzlMZUqnlGXMwIBedFLYWzLhY-69spMNY-WKsxpXT6
    cfdZuBX6YWNwQ>
X-ME-Received: <xmr:Pol6YlMtRfAZDX-phzuDyMxEVkxi-WiHoeXBsBIHt0XZBlqIYcqfNpRDe2dVRsij6K_3uLgtCNhHcY990MzFkUnn6CNj2hYkxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Pol6Yn5KlHv0fgGUt0fj2cmyYsosM1KysbsNKaGwLbfAwVz744jKFg>
    <xmx:Pol6Yv6vfAWAHVfN6vuGhMGgtmA1R_VfpYCbNlhdw2cRAFgzjuyG_w>
    <xmx:Pol6Yni_Q1_KtjJQW8jyuDzPg3IOuAlFkn8J9hNVHKIw4pa8_EF3DQ>
    <xmx:Pol6YlQTEPmPn5CVssibmfwBjy8jQA7QGQVKkho7dzDwjPYhqrqw-Q>
Date: Tue, 10 May 2022 17:48:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi
Message-ID: <YnqJOkuY0LuLAzEX@mail-itl>
References: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
 <4ed4e4c3-6b71-8299-69f4-7910583fd9cb@citrix.com>
 <YnqIxGFrz9yWb5rV@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="smSIamfy3bQvh3xu"
Content-Disposition: inline
In-Reply-To: <YnqIxGFrz9yWb5rV@Air-de-Roger>


--smSIamfy3bQvh3xu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 May 2022 17:48:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi

On Tue, May 10, 2022 at 05:46:12PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 10, 2022 at 02:30:41PM +0000, Andrew Cooper wrote:
> > On 10/05/2022 12:55, Marek Marczykowski-G=C3=B3recki wrote:
> > > Intel LPSS has INTERRUPT_LINE set to 0xff by default, that can't
> > > possibly work. While a proper IRQ configuration may be useful,
> > > validating value retrieved from the hardware is still necessary. If it
> > > fails, use the device in poll mode, instead of crashing down the line
> > > (at smp_initr_init()). Currently it's
> > > x86-specific, as the surrounding code is guarded with CONFIG_X86 anyw=
ay.
> > >
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >=20
> > This isn't invalid per say.=C2=A0 It explicitly means unknown/no connec=
tion
> > and is used in practice to mean "never generate line interrupts, even
> > when MSI is disabled".=C2=A0 It's part of PCI 3.0 if the internet is to=
 be
> > believed, but ISTR is mandatory for SRIOV devices where the use of line
> > interrupts is prohibited by the spec.
> >=20
> > Also, there are systems where nr_irq_gsi is greater than 0xff.
> >=20
> > I'd recommend handling 0xff specially as "no legacy irq", and not
> > involving nr_irq_gsi at all.
>=20
> I've finally found the reference for it in (one) PCI specification.
> It's in the PCI Local Bus Specification Revision 3.0 (from 2004) as a
> footnote, so for the reference I'm going to paste it here:
>=20
> Interrupt Line
>=20
> The Interrupt Line register is an eight-bit register used to
> communicate interrupt line routing information. The register is
> read/write and must be implemented by any device (or device function)
> that uses an interrupt pin. POST software will write the routing
> information into this register as it initializes and configures the
> system.  The value in this register tells which input of the system
> interrupt controller(s) the device's interrupt pin is connected to.
> The device itself does not use this value, rather it is used by device
> drivers and operating systems. Device drivers and operating systems
> can use this information to determine priority and vector information.
> Values in this register are system architecture specific. [43]
>=20
> [...]
>=20
> [43] For x86 based PCs, the values in this register correspond to IRQ
> numbers (0-15) of the standard dual 8259 configuration. The value 255
> is defined as meaning "unknown" or "no connection" to the interrupt
> controller. Values between 15 and 254 are reserved.
>=20
> That note however is completely missed on the newer PCI Express
> specifications.
>=20
> Marek, can you please adjust the code as suggested by Andrew and add
> the reference to the commit message?

Sure.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--smSIamfy3bQvh3xu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJ6iToACgkQ24/THMrX
1ywG1Af9EBuQCZ1VWgMk5NGASJuM6Azy7n6wdSlKrVoTzm+MXHkQ5ZuRSc8uAyuu
ERE6q6w/0xgVkGOkNw58SUIYtQD2Fy9aFvrIdtw79E35CEDu+1kMMBzPgOzNnOsg
NDE3RvYXsFuqx09x8pW8hSUXNSM+ZlXFz8lTd2Y8wc8jVBqcUWL5LrwTQgwj+hIQ
0EM7cViuRmx5ShUQT9PTmQYlaHe4EJMl3Onqo2R1gaeJ0zo9+S5stZ5NyKQ4yriv
VHQ+GyuvHEgL0TGn2AZf0WSxpBV6n2ZE0cUYZfvULpDOg+Onh+xHWyLiAa+Wwj/G
ZxkbfR3h/JwFq0x68vLcK0RXrezA8A==
=+dmy
-----END PGP SIGNATURE-----

--smSIamfy3bQvh3xu--

