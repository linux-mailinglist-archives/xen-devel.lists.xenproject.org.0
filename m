Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C43135D3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 15:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82904.153343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97zM-0003Bs-Gq; Mon, 08 Feb 2021 14:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82904.153343; Mon, 08 Feb 2021 14:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97zM-0003BT-DS; Mon, 08 Feb 2021 14:58:08 +0000
Received: by outflank-mailman (input) for mailman id 82904;
 Mon, 08 Feb 2021 14:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l97zL-0003BO-IQ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 14:58:07 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff95827-0690-4ffb-897b-1f6f6cc2f306;
 Mon, 08 Feb 2021 14:58:06 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18Evr4hN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 15:57:53 +0100 (CET)
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
X-Inumbo-ID: eff95827-0690-4ffb-897b-1f6f6cc2f306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612796285;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=mfSlXIZTGVpc5iACREmWyB5fQ/z7qNNmgCd71Ynykfc=;
	b=a6HfzJlL5x4BDp6OBWAfYhi1Phj1eJgFWq+pu4Ip0tcdtWV+DnCymeJR8B2U97X0OA
	5JN+oKaWpfwqjUy4FLH2JDNeOjO1OFRBVn6HWjG0A+CjhVq/dse9wzlOQ7w5WvoR5yPp
	i3mI7k9vlFpPCPw/kHRtbbLVLPLH8mU8/D+M0uzSpLi3w0NFRgy9LngWe5bZBR1PCjK2
	eOtjWm8XAEmAelgF/R29r/1h3hoEWGzPqIs0146luq3qOuw310gwSY+KwXZKcfW9eSaM
	8xRmEDQA/huukzZMLWqztjmo9naqDQ+6gnGJAungaEVRIXHbMZBouHVtUfhXxyIdKl3y
	ioWg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 15:57:46 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] tools: create libxensaverestore
Message-ID: <20210208155746.2021dde7.olaf@aepfle.de>
In-Reply-To: <20210111164646.13543-1-olaf@aepfle.de>
References: <20210111164646.13543-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JocnwV.HTemQKXHGukqnAwJ"; protocol="application/pgp-signature"

--Sig_/JocnwV.HTemQKXHGukqnAwJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Jan 2021 17:46:46 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> Move all save/restore related code from libxenguest.so into a separate li=
brary libxensaverestore.so.

Was this considered, in general, or for 4.15?


Olaf

--Sig_/JocnwV.HTemQKXHGukqnAwJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhUWoACgkQ86SN7mm1
DoAUGxAAopAD1IRXfDFbLe4TRa+R5pf+fhJqcj6jbKDwb+phc/d2yqJjhbdlCqFz
SvH72oLBMW90du1ePXNJYagc+6JpMgx1yofFFTJ8Af7INKaXcuZTXUXTOt1F+jnV
u/gdwO00khBP6CYnnCKzrnTnHYgZPQIq08KE5XicoAknEo0o7erOhl2xK3DFCiY9
EAC8GT2GIQxeBX7+rT9u6Db29roWYKYPpX2ie92ophx6VpSg9ajfoIyyOPvMAIJ8
jAJUcpLKbONJYyolPSBzT9qKyCOcWuOS2FlzYd383BXKSHrjqsl3LLT4OTdcuYmf
GsfT3b1k4kTRV+5UdGxDuzA+s1OS2BKR7agt1OhCmOpvGKWozaBZUKiPbmEeG8uf
7LiFZvOvlMvxXdRN67HsmBfOfnEfHuWiNdTjvZHn4UIHDl7mTZjknxvak5n4UUPr
zgUhHzxRPF2u3gd61SfQpxuaLKeLR/3CPqJNJgGdtMdQK5iJrInTmdm14mKgeUKe
KulCjUhxuQobjan4mqvqVdEhiAz6J+jLxzqyR/dqUSuWoQrRIb0jiBL/GIcHtMhm
VtCNk4h+mo7NlwaxXWWmwogr4K4A5zfqR938Um+7r55cqH/spWS3mbpAfUe5I1cn
AozgziL8BDBoQH2DP5jcBs7Xgc8R+AcxCTQT4Q7tch3TEWLGDF0=
=0eNw
-----END PGP SIGNATURE-----

--Sig_/JocnwV.HTemQKXHGukqnAwJ--

