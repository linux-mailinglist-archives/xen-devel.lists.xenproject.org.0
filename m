Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BA3F1D69
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168922.308488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkU8-0001HY-9w; Thu, 19 Aug 2021 16:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168922.308488; Thu, 19 Aug 2021 16:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkU8-0001FB-6n; Thu, 19 Aug 2021 16:01:40 +0000
Received: by outflank-mailman (input) for mailman id 168922;
 Thu, 19 Aug 2021 16:01:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4yt=NK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGkU7-0001F5-AX
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:01:39 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbada5c5-0106-11ec-a63b-12813bfff9fa;
 Thu, 19 Aug 2021 16:01:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BE84632009A6;
 Thu, 19 Aug 2021 12:01:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 12:01:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 12:01:34 -0400 (EDT)
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
X-Inumbo-ID: bbada5c5-0106-11ec-a63b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dy01h4
	k1X8PMpBxnG2CJblDVIVGZEsmuDHXZ2qBVuSs=; b=FQ0ExT6vnjKDOALOlCK3B8
	P8uLagat9mcURyBgbMyuwptevMYg42SBcpX1IkqnafWTzOIcUGJ6B+jq3L171Jd0
	tX88SlD5cJ41MW8iNB8L1ylt4cd4tdbvsjOSgC7eESOlKFeVHl7E9ZIzkccdz0wo
	/arT8Huk2O2OBHvc9nMWJx6KFwhzc6dC/wI7DBwi1NAZliAVN/jzPV3386UTSHNz
	I+DKF+EBkvmyTm0ftiCQqPpDA2f0IfESCq7qTrX0IgNEm9G6n3si9/K68nriO827
	xEZKliVlFj1DrWXooJR2lvFKN44G6rg1z5WxkSJ3bv5cm/VtQ3lMfEboI6zIwZQQ
	==
X-ME-Sender: <xms:X4AeYXwkA2G5bfmoAUFBQVqR3iJXX98ywd7QwhWs1qTNvKcxSY_12w>
    <xme:X4AeYfQMZJNe7nOLxrdRvXfs3zkSvgCMmG_iNM5thCJwHU6p6zi2He3q_SbPc1wBA
    AFu96hzkf-g_g>
X-ME-Received: <xmr:X4AeYRUUjSVwrhn6zUaeNE6jb6EMSKSa9ZtPv4f_OCHhe3ZEIUJvYvUsfyoLp03XVplI-PlYlmY3q6dIXMznhgLQrZvLbloI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:X4AeYRjXW7udnZr0vaY2Fo2ekxjv6aejhw5yDrvO4VV3LszYdPleaA>
    <xmx:X4AeYZDpvZ_xB19HonsgRg0-UQnmrF9gunxlq6rPfsqGcTPK7mrEFQ>
    <xmx:X4AeYaJuWlW5HBDOEGOgPemgiK3ODFKCjMej13DqPsS_uz0TxT5NhA>
    <xmx:YIAeYc4cL8JzsC0XMYGfaCAYMC25fiAqud_pq_73bDDLK8Vz6Wu51Q>
Date: Thu, 19 Aug 2021 18:01:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support
Message-ID: <YR6AXAWBI1SLNnGn@mail-itl>
References: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
 <20210818121649.462413-2-marmarek@invisiblethingslab.com>
 <1be5e798-c3ee-afb0-3da1-7bf16d9f8c41@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aiWOjA+FJwpNhBhN"
Content-Disposition: inline
In-Reply-To: <1be5e798-c3ee-afb0-3da1-7bf16d9f8c41@suse.com>


--aiWOjA+FJwpNhBhN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Aug 2021 18:01:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support

On Thu, Aug 19, 2021 at 05:57:21PM +0200, Jan Beulich wrote:
> On 18.08.2021 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -169,6 +172,29 @@ static void handle_dw_usr_busy_quirk(struct ns1655=
0 *uart)
> >      }
> >  }
> > =20
> > +static void enable_exar_enhanced_bits(struct ns16550 *uart)
>=20
> Afaics the parameter can be pointer-to-const.
>=20
> > +{
> > +#ifdef NS16550_PCI
> > +    if ( uart->bar &&
> > +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
> > +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI_V=
ENDOR_ID_EXAR )
> > +    {
> > +        u8 devid =3D ns_read_reg(uart, UART_XR_DVID);
> > +        u8 efr;
> > +        /*
> > +         * Exar XR17V35x cards ignore setting MCR[2] (hardware flow co=
ntrol)
> > +         * unless "Enhanced control bits" is enabled.
> > +         * The below checks for a 2, 4 or 8 port UART, following Linux=
 driver.
> > +         */
> > +        if ( devid =3D=3D 0x82 || devid =3D=3D 0x84 || devid =3D=3D 0x=
88 ) {
>=20
> Hmm, now I'm in trouble as to a question you did ask earlier (once
> on irc and I think also once in email): You asked whether to use
> the PCI device ID _or_ the DVID register. Now you're using both,
> albeit in a way not really making the access here safe: You assume
> that you can access the byte at offset 0x8d on all Exar devices. I
> don't know whether there is anything written anywhere telling you
> this is safe. With the earlier vendor/device ID match, it would feel
> safer to me if you replaced vendor ID and DVID checks here by a
> check of uart->param: While you must not deref that pointer, you can
> still check that it points at one of the three new entries you add
> to uart_param[]. Perhaps via "switch ( uart->param - uart_param )".

Ok, indeed with checking just uart->param - uart_param, I can get rid of
pci_conf_read here entirely. And so the #ifdef won't be necessary
either.

> Also there are a number of style nits:
> - opening braces go on their own lines (except after "do"),
> - blank lines are wanted between declarations and statements,
> - we try to move away from u<N> and want new code to use uint<N>_t,
> - with "devid" declared in the narrowest possible scope, please do
>   so also for "efr" (albeit this logic may get rearranged enough to
>   make this point moot).
>=20
> Jan
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aiWOjA+FJwpNhBhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEegFsACgkQ24/THMrX
1ywm0Af/XsYnQF1PBWjoYnDlovV1jGyIm7rjqn4tf33VdVmM62NdiHR8X/RL7D3D
1UC4iPTdBZt6cGsqralQ/EC4sXbuVVmZDcv82/v9F2duphCPqa/NvzLs0qC0BsMT
YzcogfCRjj1o0q8XnhNj7wPDJiNHvDwnJhKmoN3Ux20MBwTIOlDzo3SCYssIwi06
0zMlmDJNZqErXutBEO9423E3KwXEJiDMlOjGzUYBNH3AQe7NChJ2qTP0BCoYLBVZ
91TGdOEtkOOUXZR0tdPozIxmi2RzH+RKsEQWe7sxYDFviSr+FFQMLuP9S/7/pf/C
wZNRAtgmszq/LAGLUlNr63OaxYqxCQ==
=5T3k
-----END PGP SIGNATURE-----

--aiWOjA+FJwpNhBhN--

