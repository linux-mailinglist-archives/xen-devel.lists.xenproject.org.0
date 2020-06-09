Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B31F3CA1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jieMY-0000uU-Vu; Tue, 09 Jun 2020 13:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jieMX-0000uP-03
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:32:21 +0000
X-Inumbo-ID: a3ba859f-aa55-11ea-b321-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3ba859f-aa55-11ea-b321-12813bfff9fa;
 Tue, 09 Jun 2020 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591709538;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=EIPVp1UjZQBZIv2MTxF6ag3w3xk7J65OYCsPIblT4P4=;
 b=cKJZST/SpHH64GtfeXX3JGC8IitV2OEbSJPlBCJF+4+CSsDtQGff3TRfinORaqDOUI
 PwOl6G1epfMeRjGKNLwDIc+X0Wio9kIbUuF08l57QWsRYPvDmX0NHQgChRFdTjk2qmfK
 do09JbyepYESPye1RLbpK+qXtp19rDBhyUOEBKzLLsISiRXsjoXfBBfYt/+AfD8x0Dyc
 a91fhffkKH3dLpfZ8Q45OnTH5rqcIfIOiXp5+mA+wzls9NJMVleVf83+oPtIRMndZQ6r
 bFFAXqcCwrlYdAqY2t8VbzYXzA/7P6A0cbvHapOp/Pn98Jhq0IUFfTr9Pi67Yau+lR99
 cWKQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w59DWEKyU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 15:32:14 +0200 (CEST)
Date: Tue, 9 Jun 2020 15:32:12 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200609153212.3b6d7e3d.olaf@aepfle.de>
In-Reply-To: <24287.36374.917457.787627@mariner.uk.xensource.com>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <24287.36374.917457.787627@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T7jqiNx=3yOVd/E7gFPf/w8"; protocol="application/pgp-signature"
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/T7jqiNx=3yOVd/E7gFPf/w8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 14:26:46 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

>   +    uint8_t payload[];

This compiles, but will access memory behind the union{};, which is most li=
kely not what the intention is.

Olaf

--Sig_/T7jqiNx=3yOVd/E7gFPf/w8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fj1wACgkQ86SN7mm1
DoBMbg/+Kl51VOKYH+iub+INbzuCr55LUTKr6mZitlfHqVfaMhdSORpio3pwFLrN
kD/a70taF9it2Y3C2RBOZzz58Idx3cpKfY8cff2ZdPkHztymG/U7Ax3e2zgzidjg
5gtfqF1MaOkCjmTKcAwtj3d2fdv0+wJ/jfLPXkYH50mu3hRZNayNeeOmmAELmH0L
vo3OfQIxPR1o/z8528PuvcqGm+xVesyVwvpJow4zKuxAD0PJJkq+dPFj779dPXrF
e99U6AYny2s25T2+LfW8Wo8c4QQj4xfLpMHfxgC7J4Rtmso+0y/zNyce1WPaJDa9
zY7M+dToEJJMEEZHl8KZEqULsqD4Mgi7aMyuts05QOcpmqQgA7v589qUJ5ie/Anm
jPUCyDocI5hiWiOcz85YVqfgD1ARkSBcMXDQiGyS70zjClbQbFh/aqYWqwN0JHWL
yG1cOOiWSsF7uxu77H3lVoSjIgkE+7GLF67HE7De5wI2OC3kv/hiqyXIpJy3nUnT
xrNMxCFKl6JtGzLKC2owHdP27PM1FN+7Yu8ovKEBRdschknFhvr91mJFqJNUWsVN
XylFm4vG3HHDAJpMF9yxBg1laxmsjt4DBm2XzMwOWtLQ9rnqEJWKgtSbnunrFpCw
vrYeWkw2Jerd5C1RCIlnvRUIM2Gq8MQpV84Da8mm0effz33qLKY=
=whqZ
-----END PGP SIGNATURE-----

--Sig_/T7jqiNx=3yOVd/E7gFPf/w8--

