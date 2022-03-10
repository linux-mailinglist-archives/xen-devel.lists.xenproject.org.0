Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3B4D4F71
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288495.489204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLnc-0005Y7-My; Thu, 10 Mar 2022 16:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288495.489204; Thu, 10 Mar 2022 16:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLnc-0005V2-J8; Thu, 10 Mar 2022 16:38:00 +0000
Received: by outflank-mailman (input) for mailman id 288495;
 Thu, 10 Mar 2022 16:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g47H=TV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nSLnb-0005Uw-08
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:37:59 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fac80c1-a090-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 17:37:57 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9B20532009F8;
 Thu, 10 Mar 2022 11:37:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 10 Mar 2022 11:37:54 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 11:37:51 -0500 (EST)
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
X-Inumbo-ID: 6fac80c1-a090-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IMFtNc/e43oS6YPhj
	3w0qR6jrHxuZP3OH1zJKSNC0XE=; b=ZeJ4byCWvEoaWe0HhHLdMOjATBOO0XSJc
	v/vyAaV+p4zYJAzd8TqaCozJyILDlfYOsVyjdp9K9xLfic5DAqOW0FVu8dAKyXpg
	b8ZZWYRlRVcRDCRhrxv1tQaGg0CIyWpNAR8bhBOoS1rvfIrt1/c4ufif92bzoZUs
	siIQdJETUqyXrVgAm+PTwk2ZtXrZl2Iv5gQSrnFWyPoiiH71t+BNiw/OjWLjICIK
	KzsZ9cy0Np4BHGAxf6wqHdBDF6SW38IQ/F1p7cPSdc6AmnasxfVkMQ0d9FAX67QJ
	i06DhRda87k1kEW/ykCO8lKlbERbPYRUfq29GSNW7NeKcj3qrR8iA==
X-ME-Sender: <xms:YCkqYsGfe1bK4CrVn9lqT8dBj5dDNP9L9Elbsj9pr61hIVZn3EPN1A>
    <xme:YCkqYlWHDNABp5LYsSCjmb4YPFDKxhYR3l6u0RXIUbx9XCKYX1R8itZi6n1bY7nk7
    1X-w1fALtu24g>
X-ME-Received: <xmr:YCkqYmJVqEarkRmQ-bjLivnUqqgsGcriIKS7a2ogdYfXbhUHnb7bOMCOAh8ZYA0WevFEp0OHqlYkjf1ha9pfRC4575Mb_VKcYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YSkqYuHSnUkeVzyGeXpUUwZUROxJBMOvlkXS6-FrpjHhGtQHtimKHg>
    <xmx:YSkqYiW0WOV2JUyBA4qP_C82BkPXr1f1AIDwM9T8JLV-OzJxAzCj6A>
    <xmx:YSkqYhOOoAGulrteb9i_e4pb1VgDYkmJ1NDYv0FH-LJbmhAgOq2Afg>
    <xmx:YSkqYkeeW6Wv40lXBDgmmXdnimdEtemuLDZQkvtdIZ-X1S0zyqWVEA>
Date: Thu, 10 Mar 2022 17:37:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <YiopXU65pAlnNVNI@mail-itl>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jeRcZFfk5DO+poSG"
Content-Disposition: inline
In-Reply-To: <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>


--jeRcZFfk5DO+poSG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Mar 2022 17:37:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs

On Thu, Mar 10, 2022 at 04:21:50PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 10/03/2022 16:12, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
> > > On 10.03.2022 16:47, Roger Pau Monn=C3=A9 wrote:
> > > > On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> > > > > On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > --- a/xen/drivers/char/ns16550.c
> > > > > > +++ b/xen/drivers/char/ns16550.c
> > > > > > @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, boo=
l_t skip_amt, unsigned int idx)
> > > > > >                               pci_conf_read8(PCI_SBDF(0, b, d, =
f),
> > > > > >                                              PCI_INTERRUPT_LINE=
) : 0;
> > > > > > +                if (uart->irq >=3D nr_irqs)
> > > > > > +                    uart->irq =3D 0;
> > > > >=20
> > > > > Don't you mean nr_irqs_gsi here? Also (nit) please add the missin=
g blanks
> > > > > immediately inside the parentheses.
> > > >=20
> > > > If we use nr_irqs_gsi we will need to make the check x86 only AFAIC=
T.
> > >=20
> > > Down the road (when Arm wants to select HAS_PCI) - yes. Not necessari=
ly
> > > right away. After all Arm wants to have an equivalent check here then,
> > > not merely checking against nr_irqs instead. So putting a conditional
> > > here right away would hide the need for putting in place an Arm-speci=
fic
> > > alternative.
> >=20
> > Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.
> The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. I am
> not sure we will ever see a support for PCI UART card in Xen on Arm.
>=20
> However, if it evers happens then neither nr_irqs or nr_irqs_gsi would he=
lp
> here because from the interrupt controller PoV 0xff may be a valid (GICv2
> supports up to 1024 interrupts).
>=20
> Is there any reason we can't explicitely check 0xff?

That's what my v0.1 did, but Roger suggested nr_irqs. And I agree,
because the value is later used (on x86) to access irq_desc array (via
irq_to_desc), which has nr_irqs size.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jeRcZFfk5DO+poSG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIqKV0ACgkQ24/THMrX
1yxgCwf/ffMj252XwXfMM00gL4pJ2pZmjsPdgrjwEIEX+/B9sEQVFF/+vAl4RY0x
rvodcPHWjg86JFfQadqKDlMTseo8RWNjCbjjR+jYjmyf8L9Hi1ZwOLqFgX0TG8LT
Dhe95Ba9bsh1aQ272Iw72nnqEOUKXMral7gCgp/m/cFTrtM8xwIkyWCMTNw0h58B
ulyumOAG0SAcHlbLFnOmbT5byscxqf5B2u1i3Lo/P8lrBODzKPNDK7f4IUegWmUY
NVfaI518vHbU5xxnS9FmiYmVnga0LlORG36Uu66AWtrw+0iK1AJJl0cPfCV/F31T
UQS7d0gCO+L2kOV3VCj1Y0b4qv9qEg==
=dTro
-----END PGP SIGNATURE-----

--jeRcZFfk5DO+poSG--

