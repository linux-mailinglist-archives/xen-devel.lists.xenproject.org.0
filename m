Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7E316298
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83507.155588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9m2t-0007OP-80; Wed, 10 Feb 2021 09:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83507.155588; Wed, 10 Feb 2021 09:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9m2t-0007O0-4f; Wed, 10 Feb 2021 09:44:27 +0000
Received: by outflank-mailman (input) for mailman id 83507;
 Wed, 10 Feb 2021 09:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oq3b=HM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9m2q-0007Nc-V8
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:44:25 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b371855c-e2e3-426f-b947-004003b55654;
 Wed, 10 Feb 2021 09:44:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x1A9iK4O0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Feb 2021 10:44:20 +0100 (CET)
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
X-Inumbo-ID: b371855c-e2e3-426f-b947-004003b55654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612950262;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=aGi4uWZnydphFEovvX9Pq2z+hJHWZl0IERtuQfxUvmE=;
	b=iRtiPViGlYEa1WnD57aKKEgTsNpsSWQON68PTGb2nEdaPukR0ylA0JRZkvhVfV/VM6
	pFCkjpXzVwuTs4fs64mqcecw/wFaVSuluVbwgID/rebdzFBoREo2HCe8q571W3Z4iFNp
	TkTrmyJDz+RG8UwoqJfVWqiYRO549ZU9aQVv82KR9cboiudcjb5Ad414hDd1Ojs8Nu4d
	X4+ksHwTxZEZ0FF/wH3jys99fLJYNmFnb3DzSuitKN33MXcoMLyLYuTsALds4ZlLkJnz
	be72Fg6xIN8izn5dSkIm2825Ggi9iAx0IWoI/u2FlUjcOzJgmInHuDJ/aTvLx0FhlnMd
	fZ1w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Wed, 10 Feb 2021 10:44:13 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 4/4] xl: disable --debug option for xl migrate
Message-ID: <20210210104413.4f44b49c.olaf@aepfle.de>
In-Reply-To: <20210210100606.45de7991.olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-5-olaf@aepfle.de>
	<24610.49788.493621.307069@mariner.uk.xensource.com>
	<20210210100606.45de7991.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/56ALD4faR3Dabw_C1DvHNpn"; protocol="application/pgp-signature"

--Sig_/56ALD4faR3Dabw_C1DvHNpn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Feb 2021 10:06:06 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> -    if ( ctx->save.debug && ctx->stream_type !=3D XC_STREAM_PLAIN )
> +    if ( ctx->save.debug )

This will do the verification, and finds many errors:

2021-02-10 02:37:03 MST [2149] xc: error: verify pfn 0xfda9 failed (type 0)=
: Internal error

As Andrew said elsewhere, something writes into the memory of the idle, but=
 suspended domU. Likely the netback, since it can not know that the domU wi=
ll never come back.

No idea if verify_frames would have ways to figure out what purpose a given=
 pfn really has.


Olaf

--Sig_/56ALD4faR3Dabw_C1DvHNpn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAjqu0ACgkQ86SN7mm1
DoAqQhAAmZrW8prkkaHo/xwy+I7WQyDz/1GibFp3PCk1Ttv2MGFiwAHiWzgFBCb0
NJQRzb9PqZbNNTKUYIZLJrWh3MPL3gV2zmKH8R8KtepZdeXjyy3slqFaeL8Nb/pS
QI3vyz0bb/uJXEPKaotCfC4dNak0TQ/dRfm8/RWwFgTvRFiXxuwsEP91gK2VxNLK
ddVh8+zvJBzBWcCZUpM9wb3znHMqe/uFrOyVWGPbcLLEp9QX2fzHCYXwJkNpxcT6
tEizaAmJWzbAsQhZVx3Y2GBzjhtXOQHQHhyAoqFPJljDcV2SqxuMgLf/UWEJWeIR
iiXXcie1fSGsSL89ws+8zZEEcjCpZI9qt1mZx6pe8RqM2ngORvrP8/ko9Eeyc4sx
UsRNY5PlZXTK576AFvAtbcL5X2lfe/YPF/TgQDSGelQZj0tOuQ62sp/R6szehSc2
cmu7k9n7YZIIgASZckn7ACLccZMFMfDuK73g75ZbyoWhkLXBgO+hJK0lgMxKelHf
pSkntk6UloDyEvUdhbCR/Hxt5Rw98OcmHW5/QubR+DOpHMWjCIJLFvMqAY0aIdjx
i46VKBK50/UxEClH00gIfU46mnO5CEDM/c5SSSRwKWtmK+ZVFcLRKn2WH3RcOfVd
QC6LP7pTGpaLuO9YoFZgvZ9peTStMIX0qBTCBtOBss3fSETer/c=
=OITQ
-----END PGP SIGNATURE-----

--Sig_/56ALD4faR3Dabw_C1DvHNpn--

