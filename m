Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655523ED06C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 10:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167236.305232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFY9V-0001hw-EG; Mon, 16 Aug 2021 08:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167236.305232; Mon, 16 Aug 2021 08:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFY9V-0001fs-Ar; Mon, 16 Aug 2021 08:39:25 +0000
Received: by outflank-mailman (input) for mailman id 167236;
 Mon, 16 Aug 2021 08:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRT6=NH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFY9T-0001fm-L2
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 08:39:23 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73fc38db-fe6d-11eb-a44c-12813bfff9fa;
 Mon, 16 Aug 2021 08:39:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 789463200916;
 Mon, 16 Aug 2021 04:39:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 04:39:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 04:39:18 -0400 (EDT)
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
X-Inumbo-ID: 73fc38db-fe6d-11eb-a44c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3gXrD6
	LgLtaee33DjFPkQncOgPc+H6UrzlJByicUzZc=; b=WdBhNybgRnQTxNW707rBk/
	mmw6eXm9Q8WRdM++iQFL3hBdzumoZ50PRU9LNiBTmjjxsI+rzsXaGK2DDzfLk3ry
	wUTclq9snUOqP478UdgaXlNmVijmmQWYS5Ls5tHQod91yudZ0Bt0fVn0zKyvvNrN
	EUfLYqu9Q8C4lbyaRzIFPitCO8sHgRJcNx+fg3XfzxO+Lgyj9eMH3nap8U5vtaJE
	/PAMBLKsb+ZfQKdsOpAmhi2EttiWPPgFvmKKaobDgIBSP1eF37T9E3bO1Z2Qhs1c
	YeJFrdVlEkqDmFRteBF+pp0qYt066ffL4EfXEtiJL6OOINNLIyT3tZ9jf/q8CfnQ
	==
X-ME-Sender: <xms:NyQaYb6q1mSSMvP48kFnQEmkjL2-xa5zCNNGyCaysSBSR1y_l1M0Mg>
    <xme:NyQaYQ6D6z83mpp_mIDR-Qktk3x5EkF_r89jiO9U0Ye28ezJB1rCsz99aLG_jND2C
    GtXGFra-ogKFg>
X-ME-Received: <xmr:NyQaYSe5TbvpaoOEz0HQO-3J3Q7oLesMGmdfzNucSEEw3F9FclRlyMawpwi05oUhs9oei7EZ3d9yL-Me5okMTX69Ei8YMMzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:NyQaYcJLSFsscga_0SyuAaar2ETVkvQEhu-JEQ_tbBr26qRPi3RCYQ>
    <xmx:NyQaYfJR9CBFVE4Mh65PjKYdl6GAZ-YJw53ODjyqNJUOmyZgUFug4w>
    <xmx:NyQaYVzspHG-5n5DrbZSRBqx-x5j_RD_ZBhbIF1pCtluRek2CymGPA>
    <xmx:OCQaYViRazI1723SH7t54nfu3fc6v83yrMTS7ws85OPep5SIDaXA0Q>
Date: Mon, 16 Aug 2021 10:39:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
Message-ID: <YRokMeJ2bMLAZFD4@mail-itl>
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
 <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wim6xTOmTFBaY54I"
Content-Disposition: inline
In-Reply-To: <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com>


--wim6xTOmTFBaY54I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Aug 2021 10:39:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support

On Mon, Aug 16, 2021 at 09:55:16AM +0200, Jan Beulich wrote:
> On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
> > Besides standard UART setup, this device needs enabling
> > (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardware
> > control flow (MCR[2]) is ignored. Add appropriate quirk to the
> > ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
> > new function act on Exar cards only (based on vendor ID).
>=20
> While on IRC you did say you have a datasheet or alike for the specific
> card you have in use, may I ask that you clarify why the logic is
> applicable to all (past, present, and future) Exar cards?

The spec I looked is specifically about 2-port variant (XR17V352), but
there are also 4 and 8 port variants (XR17V354 and XR17V358) and the
Linux driver applies this change there as well. But indeed applying it
to all the future cards may not be the smartest thing to do.

The Linux driver checks Exar specific register to identify the device,
instead of using PCI product ID, for some reason - I guess they use the
same chip in different devices?
Would you like thing like that (after checking vendor id), or turn it on
just for this product id I have?

> > @@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns1655=
0 *uart)
> >      }
> >  }
> > =20
> > +static void enable_exar_enhanced_bits(struct ns16550 *uart)
> > +{
> > +#ifdef NS16550_PCI
> > +    if ( uart->bar &&
> > +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
> > +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI_V=
ENDOR_ID_EXAR )
> > +    {
> > +        /* Exar cards ignores setting MCR[2] (hardware flow control) u=
nless
> > +         * "Enhanced control bits" is enabled.
> > +         */
>=20
> Style nit: /* belongs on its own line as per ./CODING_STYLE.
>=20
> > +        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);
>=20
> Wouldn't this better be a read-modify-write operation?

Honestly, I'm simply mirroring Linux driver behavior here. But also,
all the bits in EFR are 0 after device reset, so it should work fine.

> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
> > @@ -121,6 +121,10 @@
> >  /* Frequency of external clock source. This definition assumes PC plat=
form. */
> >  #define UART_CLOCK_HZ     1843200
> > =20
> > +/* Exar specific */
> > +#define UART_XR_EFR       0x09
> > +#define UART_EFR_ECB      0x10
>=20
> Please move the former into the group after the "/* Register offsets */"
> comment and extend the comment on the latter to establish a link to
> UART_XR_EFR.

ok

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--wim6xTOmTFBaY54I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEaJDAACgkQ24/THMrX
1yxUtgf/eVN8uX8ALzRuVdE+gXm622sJtFgKmw+m53t3Ajc0/FGadGhEB+FxJc9n
Rv3oX4bLrgR4rbhpLbSKy1ExPVn9lhb3PVqb8Cd04X33uQ7PXEsJSheWRsot0lqu
3LpXmZhmBKgNGoQHwW2Xxm0tb5vVgkAXzOkja6eRjn6PeVN0onVSsYa4gkskQ8o/
jrqyoK0pf2IESfS+4b31Y6x23ElM/s6TAbPunCAya2suSDQF1IsjFPTYw2B851ro
lsl2paxzzruqdIsVEts3cTtpDKGyyG7tvs6JkcOB0raWoahg4oXlrFtTHBqQT3Hg
x5MQFxAQchWTKgd/gpr8O7BHmX5cvg==
=Ezw1
-----END PGP SIGNATURE-----

--wim6xTOmTFBaY54I--

