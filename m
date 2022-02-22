Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F34BF81A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 13:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276767.473050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMUNg-0001FG-Af; Tue, 22 Feb 2022 12:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276767.473050; Tue, 22 Feb 2022 12:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMUNg-0001D0-7T; Tue, 22 Feb 2022 12:35:00 +0000
Received: by outflank-mailman (input) for mailman id 276767;
 Tue, 22 Feb 2022 12:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nMUNe-0001Cu-JM
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 12:34:58 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda59c64-93db-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 13:34:40 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1B5CE3202138;
 Tue, 22 Feb 2022 07:34:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 07:34:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 07:34:45 -0500 (EST)
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
X-Inumbo-ID: cda59c64-93db-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1cwBl3Dlc+eSuBKBr
	9u3an3V7I9uGGazK91w8bC07/A=; b=R8OYf1GCUkPqtX1I1HhuOeXepXZoq7VM7
	ledvyUv7l8aBz5SFWCIHJ7EJ56FVq1y/lFIwby+IDlVZJtcxSVJM13DPVUmixCPY
	1akR89XeewRQYnk/MkeR2gmou0cFBw54kYjdz4C+HVEYyUNwYccc40syFZ5IQqj1
	0YZZDZyRbn7JWPZeKqyZnz5Tx2LuFePn4DhQxsCyjRm8xLZRamWE1JU1pDO+wNP7
	Iz05gmph9WvRNgJ2Br7bvXA1ks29MAazzruHxOvR/Eh9RO2WUwL/XPk9fA9afLd9
	K8nK6ADOhwCVko6bG89ovRFACN8oZENuWIbSd4CezsI/ffmyQLHbQ==
X-ME-Sender: <xms:Z9gUYjyeO3jsuOzVO8_vdkmfCceBm4K_gkrDsduoCVZjhOBGc81bkA>
    <xme:Z9gUYrRj0vBJPAlB4EmsveA1VPlTjeBEzwFqqA7iApgydQS6IoNozp3JHwGB_Q0dJ
    4NNR8VC2-azfA>
X-ME-Received: <xmr:Z9gUYtWDeIhZuPMlaBGO3VKssPp3YmzhBtPaKKV9XpM4TEo1z2txFbb7EnhQ1BLXuRBmGf9RQVQFCOQitR4xdnHvCzBsDZIo1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Z9gUYtjrAOUeRjeYgLesisLLIbUFOt6GnOPd_KiZDjAu2aZTC8_5xg>
    <xmx:Z9gUYlA_rEyYgQwpAuVMKjb8HtEMwqjF1rd9hwXZR4w6y8xM39ylnQ>
    <xmx:Z9gUYmJx36QZf8PiHII1ENQeUGMAeFP2n65bxcpjGi568aWKmHqL0A>
    <xmx:Z9gUYn0K_dyFh44nejx3-kFj-Posy9A6lVsDJTiy2LYSHYobG0Mi5g>
Date: Tue, 22 Feb 2022 13:34:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Message-ID: <YhTYYven0PMcHM4P@mail-itl>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NKhGOpqXO9szl3YX"
Content-Disposition: inline
In-Reply-To: <YhTUe7K5/rlek4AA@invisiblethingslab.com>


--NKhGOpqXO9szl3YX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Feb 2022 13:34:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy

On Tue, Feb 22, 2022 at 01:18:03PM +0100, Wojtek Porczyk wrote:
> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
> > I think it=E2=80=99s too much effort to ask developers to try to find t=
he actual
> > minimum version of each individual dependency as things evolve.
>=20
> By "find the actual minimum version", do you mean to get to know the vers=
ion
> number, or install that version on developer's machine?

I think it's something else (closer to the second one): finding what
version is required for features actually used in the code.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NKhGOpqXO9szl3YX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIU2GMACgkQ24/THMrX
1yyNkAgAkI9gSWNLDTecG/HHJgZWgerwIptOlv7bOsxawbH4Z/07Gkzuv9kpcyRE
Lr2sa8E+CERvR9ys9n88LZOoGT6+iwOrpCYTksT9XjQFWlt7JIR4uMElLb+Kf4CQ
sgTAcQGHgckEarGmO2/34Z9sOlLQh3e06jl0fqkGZ7UKK0t1MSTs1RNV7iNuEkMI
sB1jkIcR2sFf50zegnBddlBaPXDc6wXAIkcRcpzBCiX9WjESthnNLibjvx3fFRYX
4ykWXsYCt04NET9Lcb62CKr24LNci4TRXmiM0lPaickbN9sGSbtLWTo4BL2L3rri
F301jzEN9fcntEcLhFqnKtY7yG8zKg==
=qQ6a
-----END PGP SIGNATURE-----

--NKhGOpqXO9szl3YX--

