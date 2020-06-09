Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452F1F3BE9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jie7S-0007Ov-Uk; Tue, 09 Jun 2020 13:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jie7Q-0007Oq-QR
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:16:45 +0000
X-Inumbo-ID: 75eec348-aa53-11ea-bb8b-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.160])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75eec348-aa53-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591708602;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=oPJSOALdwkaDDWPOwJBGFgVmYK2D83SYyOKMMIxz3As=;
 b=cfy1Je8+jqA442LLpKCTw9FbcaLBMUWITZjWBiF2i2xdPdLBoM1sYTRoXEkmqElzA6
 GkRaFDN1VJ5uXwmGlM8duYu3gtE7cbzcjqlf1tQTaljtsp+QDare/WqGwyuEt1P3uh+N
 2SWdQHbt3q7rmjgZ8wocBJDnNKOKEhde4dtxv+6nQrkOt8C4XYugXZdPynNiy5DJNeQ1
 nq3FsU0gZ1sM4w3wHTIubc556H8yuiN0TyDglLoB4tgE4D3IAYZ1NfsiIYg1caGVKd8Z
 LNmBZoYs8y1sGqMGrfxoZcKF7ajrpCnnOYnnAIFwvPX7jQdg4zg36j6hKPX1yFMLPSQr
 H9ZQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w59DGcKtw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 15:16:38 +0200 (CEST)
Date: Tue, 9 Jun 2020 15:16:36 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
Message-ID: <20200609151636.57c98545.olaf@aepfle.de>
In-Reply-To: <CAKf6xptNnyEvOu-skpf0Hh_n4d-9LpYKX_5Z7vmA5uoe4oF7Hw@mail.gmail.com>
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
 <24286.6790.983312.672969@mariner.uk.xensource.com>
 <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
 <20200608161111.26c2cdd4.olaf@aepfle.de>
 <CAKf6xptNnyEvOu-skpf0Hh_n4d-9LpYKX_5Z7vmA5uoe4oF7Hw@mail.gmail.com>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_kVOEFAmLuUnK68C/YJsd./"; protocol="application/pgp-signature"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/_kVOEFAmLuUnK68C/YJsd./
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 08:33:12 -0400
schrieb Jason Andryuk <jandryuk@gmail.com>:

> What version of gcc are you using?  I was using 9.x and it didn't warn fr=
om what I can remember.

This is gcc10 from current Tumbleweed. For libxl strcpy will certainly work=
 because the length check is done prior the copying of data.

Olaf

--Sig_/_kVOEFAmLuUnK68C/YJsd./
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fi7QACgkQ86SN7mm1
DoB+ZQ//atBDH2NRPMw0r7kqih1NGwaP/84F/nTlaSlyOQycM6krw/m62f7NnaTh
i1HD58081UWXxH3MgkzVc1Cvr/ByJGIGyiSvZwemnaEr21OeIIODxspJvdx7N6e0
/6U26GCRnqNuff87TzCcWLyr1tlpyXjPiGLPyAxzYTgfkMfzkV3MVhcECWWvw4nt
I9IyXkz7S8788/I33tnxaoZzii0P+NHNhZPNzQU/11TXkHiUShzKSVrWfsqriTI9
6uWfV7k7aHHpoLwnN2MOR0SPV1uzWM8RJdTVemOJMttHC4OMMe4VQ/pOzyrflB2j
3u+pJ3x08/4r3ePIUEhS0zP0QUh7RTxuqJ5VYLhvpw9W1vCPq0PpHmRkcsknn5rN
lOGRA4WnaH8poWjUooKYf3S+MDPmt7w81ScweRLe5iM0+bViGGhQRUaOVt8rYeWQ
wulZZ7qsUQaN8TWmSCOPHNybX9e+qq2afQeUeHB0pXichyKLxZeYD/Yn6G8Y9eJ6
TmCsKUvAzkEXl/eEVa4OXg8xerN7l7vaQabsIrifUhRj2+luQa9kBGmI2Qn+ZXKA
jS/pP3HwI/h73POsp3ycz/qOfI3mLv85oo38SXccLnqDNLr7tAJnU3PJw5dSi7Op
FJZuTNJCbl+0QNXEYon/+cDtA1WtNWK2j0VQ6X2UwjdHguEZLeo=
=lGly
-----END PGP SIGNATURE-----

--Sig_/_kVOEFAmLuUnK68C/YJsd./--

