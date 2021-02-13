Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1031ABF0
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 14:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84597.158672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAvKC-0004Fg-Ci; Sat, 13 Feb 2021 13:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84597.158672; Sat, 13 Feb 2021 13:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAvKC-0004FH-9b; Sat, 13 Feb 2021 13:51:04 +0000
Received: by outflank-mailman (input) for mailman id 84597;
 Sat, 13 Feb 2021 13:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+3A=HP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lAvKA-0004FC-Q6
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 13:51:03 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3277022c-ac15-4d4f-8869-88b01d3b5c9c;
 Sat, 13 Feb 2021 13:51:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C4A65C00CE;
 Sat, 13 Feb 2021 08:51:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 13 Feb 2021 08:51:01 -0500
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCC11240057;
 Sat, 13 Feb 2021 08:50:59 -0500 (EST)
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
X-Inumbo-ID: 3277022c-ac15-4d4f-8869-88b01d3b5c9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OmsRd5
	fT8lTKWh0LAKPh0yMk5Y9O+be3M4lCrp7Ghx4=; b=HRdQxaFnWYnGqFNihk5cxD
	ORl+1Rct0JkXz53veGmMAvNElsUv3E1GNIelFfEgbfUNXhS53BcMXIpCYq+TZfU5
	3C5bpKwyxlGkfZaFxjPB8oHGE/cOnyz/nta6hotPQjiVzX8bb0xL9fxCM9QcbGSX
	06SZ/wexXWLW+HnCGj76Vm/X8qi7MRV8qkzmekBH4DQ9QYvQ7HsDhNK1C2Sdq/zI
	geP3wPsz92wgxqsYjVJmlpV80ybECsX2i2DWriqOeHQlZrec4sbbbmYxf5fuRwCP
	8dzqLGNMGWtgIPzMTSJNzU2Xadp4OVFlPewODOMMIOFY1IYy52kP3XhcIdU14wdQ
	==
X-ME-Sender: <xms:RNknYL4OcxhjVlgwE3FsoHM9-gioUDG1lKBB9JRsS5J5lNKCyKl29g>
    <xme:RNknYA4XWmtFmtqj6oRxhaxDtZ7wbr7i83Nrspw7XD1X85_YACDLhm_De0L40bwxn
    3AvatiGls1gGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieefgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hm
X-ME-Proxy: <xmx:RNknYCe9WgLVRQxzMWqX99UIi67xTSfPayA4-ocMo0kEcbS37V-ypQ>
    <xmx:RNknYML_av1Tyodzhxx1jzP8sSncP3xwIJSUh1-xn5aFTXOQjn2iqQ>
    <xmx:RNknYPL1ckcRgnSOvms8gSeESy2iVoryF-8dPy9ucKJyZkkLZI1SJw>
    <xmx:RdknYMFTmO2UAkNaL-gPCS2qBjDpdQua29hERAWa9fm8QLYDbkxcuw>
Date: Sat, 13 Feb 2021 14:50:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
Message-ID: <20210213135056.GA6191@mail-itl>
References: <20210213020540.27894-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20210213020540.27894-1-sstabellini@kernel.org>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed

On Fri, Feb 12, 2021 at 06:05:40PM -0800, Stefano Stabellini wrote:
> If rombios, seabios and ovmf are all disabled, don't attempt to build
> hvmloader.

What if you choose to not build any of rombios, seabios, ovmf, but use
system one instead? Wouldn't that exclude hvmloader too?

This heuristic seems like a bit too much, maybe instead add an explicit
option to skip hvmloader?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAn2UAACgkQ24/THMrX
1yzU9Af9Gmygp9ELtsgMuobBJp2H6cb6ILXlKKt9l2CK3zNDXntu7nNggntcn/us
O1/1iUCrH3rv0tqf9PxAKTLizKiWK1n7jMQWmhEazTOSKz1z1cgS4LhfTfCxS5gz
nuE6VNrpLqTyEcDl7/k98NW+5UvFVfcTxvL/wlzpAHVR6R4NtQQGS9DFXRUr2sxI
93HfkERFeMLpDnMKflAHUhi7P1ZFcmL4rr6LqoDsBYUhA36uQWZuMwhesl536pl7
djrMvLcAXMGUh9pbiQzv0z0ksVmsOltPZekG8gHDg7FbJAeYMRY0Oe6nBHNUAxxK
00OnttGWp1F999V91M94j56ImetkGA==
=rKuN
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

