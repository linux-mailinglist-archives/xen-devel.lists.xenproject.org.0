Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C02743ED
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:16:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj56-0002yz-C8; Tue, 22 Sep 2020 14:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Js2O=C7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kKj54-0002yu-L0
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:15:43 +0000
X-Inumbo-ID: f2427c6d-e2ff-4e53-b9cc-7ffb2982ea4e
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.216])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2427c6d-e2ff-4e53-b9cc-7ffb2982ea4e;
 Tue, 22 Sep 2020 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600784140;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=0X91Dd5vwO2V1TPQGT83AVfccXZmmlJhlohYr+Aoql8=;
 b=lxfPdj0vXZx5jtRlayxKKmzlb2UApzhuSocxAnUmWAv3K9cJMNL0/7+HVH03VpH/ZT
 aojpnk0rysZAOeFcAA/TdjE/3pCwRrNiuPJtpmu0UFU0kIKdl+4wy/Ejbq4yU2UxLtFv
 7Mm+SimJeF6zKQ+rvUp2nYmRlwISkkGBezdBU7EIUrvwefk4ObL/HaShNBuzH2eYTjHB
 N8jTv2ukF1VolPFHZqRkTfNGP9JJ9UYKX1VxggNbg57ztBkY9BdCG5ghxbJokVPxpRzx
 ykQV7uccqYVG+ty+lYUBIAm69W6669rdIXQC40mNHoa53pz6lLL7Pmv6C68HFXddfdvE
 fJqA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+n+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w8MEFdElW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 22 Sep 2020 16:15:39 +0200 (CEST)
Date: Tue, 22 Sep 2020 16:15:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: races in toolstack build
Message-ID: <20200922161524.79c01229.olaf@aepfle.de>
In-Reply-To: <fa2ba088-f95d-ce85-b991-793eb4d98f92@suse.com>
References: <20200922141700.4627df0d.olaf@aepfle.de>
 <fa2ba088-f95d-ce85-b991-793eb4d98f92@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uunx4E0Xyv=TK/m6qXBbp6/"; protocol="application/pgp-signature"
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

--Sig_/uunx4E0Xyv=TK/m6qXBbp6/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 22 Sep 2020 15:51:00 +0200
schrieb J=C3=BCrgen Gro=C3=9F <jgross@suse.com>:

> Is this really a normal upstream build, or do you have any additional
> patches applied?

Nothing relevant.
https://github.com/olafhering/xen/compare/olafhering:olh-base-staging...olh=
-fixes-staging

Maybe the build VMs have filesystem issues?

Olaf

--Sig_/uunx4E0Xyv=TK/m6qXBbp6/
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9qBvwACgkQ86SN7mm1
DoCJRw//UE02ljbgSTWzO5Dk3uNbsvbDKqpFTOVH+brYdx8UmTJRRvkx0TZfBc7l
74THuuKqYWEEXAAOheLGT9Z1vef7eRKwm+nhQAzgYVM4pGUHuZuN8VJjP/HhxRa9
IRFWw6e4r3qfm84xmVACyEwjF447AfVJ2N+iStBhPdQDvamaIqt8gCL06I6d03s/
kMYeYw402EiurwtxRpakJNqzHluq6leJ/dpJeGb8bAn3HwW3SzKw5RmbQmq1RPdY
dF8/5PNL2HCfynz82026Xe/BjuKHGqF4ZSmZSocUg0ndiUYqpZtqaW2G4hAEgNbS
L+o872K/cR5vTYP4UKi36GbNfOcaUgdBPdnhTFso1ONuDXf5MhDDe4VszKE0dUcl
ay84IDIpQj4CBXI75vHOHx+qXQIQDjr9pk2WK57uv2ClLRW8P8teeRnvJSpGEPma
KPXjZXFywpK8VJxsu41k33ITTAZIlS2WYxym6NutHcV4bd39n/icME5l6qkAsc8G
uMEjM4k684ToPxPgTf+IatQvA/HJIDVHnqcmOEzgStSZrBWfalz+jwQVj7jFimpn
gI2IhXLNtb4jLLTsD4AXtVzP7GqUaOLAqgfNpNPmu0sLZ/ETpP5WBzxHbs1Sf0pf
7saK/OAmyNlNJZ2LuFKTAsbX9/cukPqwY0iGw0Q+Zuuzgh1o+Qw=
=X8y8
-----END PGP SIGNATURE-----

--Sig_/uunx4E0Xyv=TK/m6qXBbp6/--

