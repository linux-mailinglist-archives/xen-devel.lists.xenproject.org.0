Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB5BCA05
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:19:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClbS-0006pb-Gg; Tue, 24 Sep 2019 14:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClbP-0006oa-QP
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:15:40 +0000
X-Inumbo-ID: c86bdc04-ded5-11e9-97fb-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::3])
 by localhost (Halon) with ESMTPS
 id c86bdc04-ded5-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569334538;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=zOh1VxshJWTZkrZDbigGd8WA1LDeCif8bkjDEedYEP8=;
 b=tlSM1f88itcda14HB/3epn9boKSWhI2hNk3uHpJMpYp4hSj60jQ2eKsEq5zqTjEJhQ
 dEC+mtqxtbZhA0TzzIyO8JBn2SuVrzlvO534XWOYfjFq39d3rWHI0nKkruKHKomcn/Oo
 hY41A5IPAmlCn2pgHHKCKQiNZ/ZKRvjZXBSaV+a7h/xTgJlrpxALJ5DJH6fVSJArKA4I
 HBs+F/MiHINoBFBQ1pT8ktZ7r9y0VWDqCl7qMi+INTF1+4AoUf+YKg8RV37uk1uKz9YD
 e0UprzSPqiq7FMGwxIfwHUmaAApCtyv69VIUcZcNMYg8a6viMAUHrO0TRT1eGWq9bX6i
 7uvQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC44eztn93Z9OGdNZlANh"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OEFZ1qH
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:15:35 +0200 (CEST)
Date: Tue, 24 Sep 2019 16:15:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190924161528.7e4e6a5c.olaf@aepfle.de>
In-Reply-To: <23946.9142.652599.628334@mariner.uk.xensource.com>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
 <23946.9142.652599.628334@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============8144548789142563219=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8144548789142563219==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+0gNm8x4TVPKqhLos4BbpTy"; protocol="application/pgp-signature"

--Sig_/+0gNm8x4TVPKqhLos4BbpTy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 24 Sep 2019 15:09:58 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> Err, no ?

It will happen for sure:
https://github.com/thkukuk/atomic-updates_and_etc/blob/master/README.md
https://en.opensuse.org/openSUSE:Packaging_UsrEtc

Olaf

--Sig_/+0gNm8x4TVPKqhLos4BbpTy
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl2KJQAACgkQ86SN7mm1
DoBF7Q/8DrveCQ2O2drxP2Y4Ko/ThK9kcKY1psFvdycTUoj37jgC/czSBHbufxIM
XwiJonVEY/vxBvRpKZk2aIp6stuWZcCYZVoUrpRugqndA5x9IeNg6CYqLfUCEhuO
y5F2XAuLPsmVwt8xyJ2rsj6uZ0fRfk9uRBHav3P02z0ogXrN6eUokz/bumZt4amM
cSH7QdqDFAWmZZjDokX/amWGz0bzut8xt6fy9De0xjZ93BkLbEc084nq6kBt4p1P
yt5Rm17LRvH9+mJEEZKUZthXoEv7f5vmsF+7MIPFK33mZzJn/ihsXaHmLMa9ZqM1
oCI9dSaWdVQyIiAYx+xSUnXmvxiSMba43EQIURKj7yaVdC2ys6XjrsKvdS4mvqSH
0y/Mr5JqezO29UmblvV37upYYv6ibAC4O4x3LCaIwiSjMgRtQsqJzTiJn3cyZqBW
0/PpjagaO/7HLGTEoz1iijykblFW1VIM0KbtZLVBHMPfUsoHVepPjZ5VZtjg7Lou
VFaq0GYJVEsmyAnBBCOsv9H3lUg3eTKm5iYnaYPZnM5Q53FKFcfgkW7XyBWZDB5+
STa74X+JpBIAsvegcv4HUr0rBLlCUUTGXhlQJXaZT+uncZ69yFAnG11zb+dgTA0G
sWrApG8tuRdNESqW99tDsLdYPrNajX0oZ1chZnmRsvX6WcuZ74M=
=gjqv
-----END PGP SIGNATURE-----

--Sig_/+0gNm8x4TVPKqhLos4BbpTy--


--===============8144548789142563219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8144548789142563219==--

