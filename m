Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0083262EBB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:53:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzab-0002by-Hc; Wed, 09 Sep 2020 12:52:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFzaa-0002bt-OO
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:52:41 +0000
X-Inumbo-ID: 0f2e2fd7-91f4-4a2a-aee7-6e8f5dc4461e
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f2e2fd7-91f4-4a2a-aee7-6e8f5dc4461e;
 Wed, 09 Sep 2020 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599655958;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=SC9Wx6/G9IUj6yWgXqg1tcyo2FClJxS9wEiuAxAlPh8=;
 b=CUUbjmZXxyjuA35koLSMWaicLK4om7D+Dd6Jl9et+JRaTR2iPw3pQCbzKNkFg5WKQN
 nvag4K60b6ym9AajndJEttXBQRVUQE6HsDF4fQwYg+1/tkZkfPv4zWThmI3EWBqrKUrX
 1VYQatqx32xukAZPVmdve4stvM8k5DS6WsBqR9teLKbcYQIFIj5df/ODhNeH2jlQrc3Q
 IrPNpZiP4fzsFDAqOWCWRsyYBBkWvzf19JtpDMVWJewkaZH7CNQlI1N97dTW36EjavCZ
 5fKNAvJ6Dx0PtA1TMPilOI53axao4+8A0k7mBZOkOnTMmBZlziaARyg5eMw+0iQYYfuh
 1yEw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWO///A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89CqTM4D
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 14:52:29 +0200 (CEST)
Date: Wed, 9 Sep 2020 14:52:15 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
Message-ID: <20200909145215.530ca814.olaf@aepfle.de>
In-Reply-To: <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iZ6a.rs4w47M5lWKHUv.AuE"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/iZ6a.rs4w47M5lWKHUv.AuE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 Sep 2020 13:43:10 +0100
schrieb Julien Grall <julien@xen.org>:

> So can you expand how this is an unusual combination?

'ip' is the tool of choice since a couple of years. What 'git grep' shows i=
s just compat code.

Olaf

--Sig_/iZ6a.rs4w47M5lWKHUv.AuE
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9Yz/8ACgkQ86SN7mm1
DoBDKg/8DbmT+UDs0oEQFRX/kHhCFU1nXRDvizD4Ye8GpUhLGk1pxCCBfxJh0ndp
M/bBVeoBb+cfH39DUlVIi9BkCoGE/qI2Bwqlr6V9uhH7FKXf3R+YmQgYHHiigdJ6
8+fVsW2YAUdcRkYhVOF/AblmoXUmRIzbANyrR2s04LGCNWvjPprz7S3zyXGvcs+S
c3sQUvVvb943M4UHCZe9P/OcTAfAy9j1xCJuGsQQqRGU2J//SE3GXbBZJM9phyc2
kyIo9TjX55NW8ibnFb0dYP5aai+Bj8sZZgTzV4qVrY/BjnpJMWX5CjGM4BcuRKQP
1fsm+CEVbC2fkcDtl2CbbfWgU7muwLPcGIaZ8EsTFnxW6+VKpeg8k/8PjTYjkGh5
k4Gdgyib/92SDMRqVvVSHwLYIms7Hq9vXqsfdmycwRo35bkQvHjx26zbdSdNLUto
+WKYWjX0sawtmDomonQmi+yG8GwldltHEMI3ZI5mjZISdTkMteJy/kmuWG4r49Ft
K+eox66P89VxOgbU6RlOeerKd4rX6tpL+FHupe1lhKiqR9feWwZl+lVadSH+CroK
V50YRzc3LrhO12q88crUpWXjroirkJPJV1dsPB4Mh/wXdvMQalX4c6lq4DYaq8cJ
KrexplqBHpXKATkFciD+dFW+3b28JTS+drvbP6GOpnsYRNBTXKM=
=ezB2
-----END PGP SIGNATURE-----

--Sig_/iZ6a.rs4w47M5lWKHUv.AuE--

