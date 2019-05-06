Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45E14F9D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfFa-0005B1-A6; Mon, 06 May 2019 15:09:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt3T=TG=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hNfFX-0005Aw-Qc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:09:52 +0000
X-Inumbo-ID: fe48d829-7010-11e9-843c-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fe48d829-7010-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557155389;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8Ddpff26m+o6SJii8NsYjlELxMhj6rAzLVK64b6BBCA=;
 b=Zs732K0cjMcMO90U0sIQMig6j+oLY4vRjlfkNzuNyRK01HflVFi3MeAU+OruBEIfNd
 R1LMUZhYhrYsxzIgMPVo3F8Lp4yeGLpFFmTtRv8uC+nrFOIiHJVpWRXXeeGeCYAH1ZfL
 f0UyWXpYkJY98yHY9DXBThlBqaltfXKUttwKIsLiY8k9y9humdGzmG/LpTu9yu3mZ8OF
 kBO+gC0iKGOTvuu2xbaq8xeN0+MtJrNGQ5pxX2NuAxX+usYuOG/KYTrRbSZXzpQqYepe
 KUTsip58dlPWpg0oWJQ7Wcjqvn8ZLfSJEHjmwr670uQFejouCq2GWS1NSdFFjN7BtJuX
 BFEQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuaMMK"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v46F9LTzL
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 6 May 2019 17:09:21 +0200 (CEST)
Date: Mon, 6 May 2019 17:09:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190506170919.6035d4d9.olaf@aepfle.de>
In-Reply-To: <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/5] drivers/video: Drop framebuffer size
 constraints
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============2989303213712202922=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2989303213712202922==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/EPC7HSK/YS7rienJN6rsw9+"; protocol="application/pgp-signature"

--Sig_/EPC7HSK/YS7rienJN6rsw9+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon,  6 May 2019 16:50:19 +0200
schrieb Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>:

> The limit 1900x1200 do not match real world devices (1900 looks like a
> typo, should be 1920). But in practice the limits are arbitrary and do
> not serve any real purpose. As discussed in "Increase framebuffer size
> to todays standards" thread, drop them completely.

ACK for the idea.

Olaf

--Sig_/EPC7HSK/YS7rienJN6rsw9+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNBOHwAKCRBdQqD6ppg2
fqxSAKDVkuA80W3PBX+Gyiezp627IZcpYACdFia4Uau1ggjdqBedMW8tERGtsqU=
=WOkV
-----END PGP SIGNATURE-----

--Sig_/EPC7HSK/YS7rienJN6rsw9+--


--===============2989303213712202922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2989303213712202922==--

