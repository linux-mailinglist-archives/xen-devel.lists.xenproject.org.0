Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9784313AF0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82996.153601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ANC-0003Gw-7G; Mon, 08 Feb 2021 17:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82996.153601; Mon, 08 Feb 2021 17:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ANC-0003GX-3r; Mon, 08 Feb 2021 17:30:54 +0000
Received: by outflank-mailman (input) for mailman id 82996;
 Mon, 08 Feb 2021 17:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9ANA-0003GS-DB
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:30:52 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f832fe2e-54fd-4dfe-b6f7-21d2790017f1;
 Mon, 08 Feb 2021 17:30:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18HUj5SM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 18:30:45 +0100 (CET)
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
X-Inumbo-ID: f832fe2e-54fd-4dfe-b6f7-21d2790017f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612805450;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=BiiWbli1BkYRtu3wqvFm3m7Y+oPANItkF1Kk3tR1ghM=;
	b=Ys3EP6DuZhwF3g99Gy3q892kZd1u9qZ2b9FTnUNztxew+B+2tk9T8bob4qfXNKGn8J
	6C6hHkiZcJ7QqwqembznAVsr/oCY8VqlSd3UC/iYVnuGEBhSHLNNhI64bryPJNyq49SR
	Neho/XaoFn/21tT0KXPSojSftmypSILf0kiGvce7LKCZrIFyTp9GaXDVZG+xF2ILzW4C
	Ag7nXhvuzhMb0sQUnTKDHUWTprc6XlSE0tGfa4eAMH4N+LV97TcRezFDbf2XeViNsCWL
	j2MFV6KftIGTeOiPP0KCW0Hu4gwDon+9cCeGO31KLcoMmU+jUz251EJY9Zi+I5IeWncJ
	YTvA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 18:30:36 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 07/39] xl: optionally print timestamps during
 xl migrate
Message-ID: <20210208183036.3f95bb0f.olaf@aepfle.de>
In-Reply-To: <24609.25950.629059.164010@mariner.uk.xensource.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-8-olaf@aepfle.de>
	<24609.25950.629059.164010@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6wpClQSmYSn0yNXf.PL.WKm"; protocol="application/pgp-signature"

--Sig_/6wpClQSmYSn0yNXf.PL.WKm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 16:22:54 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> I wonder if I can get a quick second option from someone on the API
> question.  Using up a single letter option is something I don't want
> to just rush into.

Maybe put "-T" or "-t" into xl.c:main() instead, so that every command prin=
ts timestamp+pid?

For everything beside "migrate" it will only be useful along with a couple =
of "-v" to enable global debug output.


Olaf

--Sig_/6wpClQSmYSn0yNXf.PL.WKm
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhdTwACgkQ86SN7mm1
DoDczxAAhKSTE9tPYEqw+A6W1rhZrL8wpmLV9xoiT0mXLQ8mOuv1YiWBQVaMTMBV
G1zceTi7rJT6D6ODc4tsmgWP8ATtDITwO//pB+dA3+KeG2EJhADaawyjCsF8OzfK
IsT1eoTsETwAmX+YTHeuCDa7PMSlG5xa/OQ/jxg6XsF3HiFWCKoOMXfePFvtTodj
Vbklky8QO3NIzV/VQl0s1K+SrB7yTHA4BGLNImd4DBWiwd02j6sCOvQL0FbedYg7
lAA+rYMv2mJkL4bwC6MjiJ091kP7SFZxdzoQZqWnH4PE3YLMzI2vutsfU68g7udb
KJ8ZFyJCB9WoABIBrRG+VOyVDKTZBRj5tXNznhrBJD43UgT9vSwEtJ3YqDoEU2zU
LMXMc5cARjxnwdHKaHYkfeD7tYTdCO5DWqZ9TOTRv+Z9SnaNuXEJSOmwIZqgT7h2
xxjyic29srpoNpGWQ+m51/kC1SEOtmMwFlxe8t3nQD2SUQ66D0hQQ3DTHOp5Qi7Y
vsTeCYDajmcBa+wOFhMrFDrjSbGYdxKkNodULnWrsdMZKe+JSwutZ7mjXs4nbnzr
zFdcikxRgfkygm7EDyOBP0lFrhA/6HsN7jwooF6e5YtkmZh/2i8oN3XBE99NQdMP
LaQ+Zw/vIzYl1dZZ149PLTClxk0FTg5Xws1V3/Hv2v12r1jU2z8=
=9jwz
-----END PGP SIGNATURE-----

--Sig_/6wpClQSmYSn0yNXf.PL.WKm--

