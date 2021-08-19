Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465A3F1D8C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168933.308511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkh5-0003Ue-Pi; Thu, 19 Aug 2021 16:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168933.308511; Thu, 19 Aug 2021 16:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkh5-0003Rk-LT; Thu, 19 Aug 2021 16:15:03 +0000
Received: by outflank-mailman (input) for mailman id 168933;
 Thu, 19 Aug 2021 16:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4yt=NK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGkh3-0003Re-T4
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:15:01 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e560052-b34a-45e6-8218-a666b1ed3a15;
 Thu, 19 Aug 2021 16:15:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6F56C3200943;
 Thu, 19 Aug 2021 12:14:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 12:15:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 12:14:56 -0400 (EDT)
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
X-Inumbo-ID: 9e560052-b34a-45e6-8218-a666b1ed3a15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6JqpLC
	vadBR5FB4jLtBN58eihY2TnRi5+aVUeW5D6Dw=; b=iPSfbi7/fhcszEO/eXAGc7
	m9ZYjGFgUE4EWTgFLgDs47ImYANLUeP5HrLwnAHXOVHThcftEtjcACNrKWl+USw8
	mjajvSzNzRx09SI3YQQ4Hl9UO3vNi+yxjs5cRm2s9yYRBh+sQq7SlZIIgH9ph+Dk
	WNNcjlSQvUYyDE68JSMHmdGTwhD+5V917zvkfqIImlZAR9aE/cO3IM9SmdSks+Ib
	rRXmQThQt+7inTpy7StPUZ/9i+NS9hXDCWjjyFOpkrdLCi3dyTdEhy4o9GtzbSDF
	L8dxYjW2cxU3zqVSxlG89HCOPhrGpI6AHvWsvTdnX3W1DaaPdBLUgdBlQHh3Eeqw
	==
X-ME-Sender: <xms:gYMeYXPpsLHrQKvxuM0Qzc9Zn21rGq5ptzPnLh31-9CtOvPiOtELKw>
    <xme:gYMeYR_UCtIl35N8655dZwdqvVoldyFFJfS-BAVUyNHtu_RWRSYqeR0Pd0lBlgn72
    CRO-SeYUQX3nQ>
X-ME-Received: <xmr:gYMeYWSDJI83VLDqR8TX-MWCUuyhGKsB9HgcNJKIgGXg45zjcRKu6FA4kjAovuECBb_yXa1z2-6qqK59tknof4ZbJOaeFLqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:gYMeYbs1q930NWlRcyH58rB4jziPshGlYYwBNl5Dd54tbWM6Jg4SoQ>
    <xmx:gYMeYfem0yIupGN5LoqtonNepvD9qoDA8T3CksgQf-pwVGc-4QJXOA>
    <xmx:gYMeYX2dupqCKyg0kMB1B0MiqZLwqg4EeZAT7WEux6Mz18CPdhLqlw>
    <xmx:goMeYQGq7CtHrWEC2ov-bz8n86acS8wUmGKf_T0SxsTZXJG0I9siTg>
Date: Thu, 19 Aug 2021 18:14:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support
Message-ID: <YR6DfiX2zBSBKPxr@mail-itl>
References: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
 <20210818121649.462413-2-marmarek@invisiblethingslab.com>
 <1be5e798-c3ee-afb0-3da1-7bf16d9f8c41@suse.com>
 <YR6AXAWBI1SLNnGn@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X2PzSpjOwF3lsqlc"
Content-Disposition: inline
In-Reply-To: <YR6AXAWBI1SLNnGn@mail-itl>


--X2PzSpjOwF3lsqlc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Aug 2021 18:14:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support

On Thu, Aug 19, 2021 at 06:01:31PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Aug 19, 2021 at 05:57:21PM +0200, Jan Beulich wrote:
> > On 18.08.2021 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > @@ -169,6 +172,29 @@ static void handle_dw_usr_busy_quirk(struct ns16=
550 *uart)
> > >      }
> > >  }
> > > =20
> > > +static void enable_exar_enhanced_bits(struct ns16550 *uart)
> >=20
> > Afaics the parameter can be pointer-to-const.

ns_read_reg()/ns_write_reg() lack const, so not really. They could gain
a const, though.

> Ok, indeed with checking just uart->param - uart_param, I can get rid of
> pci_conf_read here entirely. And so the #ifdef won't be necessary
> either.

#ifdef needs to stay, because uart_param is PCI-only. Not a big deal.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--X2PzSpjOwF3lsqlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEeg30ACgkQ24/THMrX
1yyA6gf/TCMVrCa2hI+UpE6C3G7+Usu4lMz0d8PI3y1UQAqSft5t0WZxLOisoIvR
Osam5jWVqqNV8pqeGtl06M0/qSbajDL8685NPKtJaNcvgnATDCCyapBQHDUfnD5y
C6aBHERyzwScpBDBGklOmFbXJMtg8/K+Ujm4FiN/Ya3TO/C15iWxCzJyROLFHqTp
a98hUNSLohdOGz5+w1FqaH+SF55NTT4LR7LPsL73eWGNmyLkbr04ZfB7iXq9yfE8
sT3jDr4BlW2jHir/7hJXcudGQ/5x95GPNyyxdQmlLucrn6gphn/xt+MwDWcCUuEE
hXCIKl8Oc94dQIUx/TvlRGyJGNh9Vw==
=jFpZ
-----END PGP SIGNATURE-----

--X2PzSpjOwF3lsqlc--

