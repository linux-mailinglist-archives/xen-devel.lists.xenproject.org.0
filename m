Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFDC2CF272
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 17:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44962.80424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klENs-0000Cp-Kr; Fri, 04 Dec 2020 16:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44962.80424; Fri, 04 Dec 2020 16:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klENs-0000CQ-He; Fri, 04 Dec 2020 16:56:40 +0000
Received: by outflank-mailman (input) for mailman id 44962;
 Fri, 04 Dec 2020 16:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6t4/=FI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1klENr-0000CL-1a
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 16:56:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdd6546f-b220-449a-ac11-e220d4a7b2be;
 Fri, 04 Dec 2020 16:56:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DB09ACBA;
 Fri,  4 Dec 2020 16:56:37 +0000 (UTC)
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
X-Inumbo-ID: cdd6546f-b220-449a-ac11-e220d4a7b2be
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607100997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRdRUxehcl4ZfniJoAzlXcTcyM8p7bZ7J7D2+BOTM3A=;
	b=fjiYY2loQBSO+gUsGktexv/ZTlU/l1Pn3gbmQ1B66ONRV3ZzFRhhxfax/coSgZZM/mB6Gy
	2pIq4OFXHPDzwBHZznfsKc399pMaPIQ8EITLQABxZriRp0i9wEvzDIGK8ap778eLfvuGuX
	/kn5mT0z0zJeiAbQCnxUJWZ2AwbOwM4=
Message-ID: <fcb451af99564c595e5bd8d3a13aa9c2d39f670b.camel@suse.com>
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal
 list interface
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 04 Dec 2020 17:56:36 +0100
In-Reply-To: <20201201082128.15239-6-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
	 <20201201082128.15239-6-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Y4odgjyWSGvy9y5OHjc7"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-Y4odgjyWSGvy9y5OHjc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-01 at 09:21 +0100, Juergen Gross wrote:
> Instead of open coding something like a linked list just use the
> available functionality from list.h.
>=20
Yep, much better.

> While adding the required new include to private.h sort the includes.
>=20
> Signed-off-by: From: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

We've discussed about the issue of creating too many cpupools  later in
the thread already. If, as stated there, a comment or (much better,
IMO) a mention about that in the changelog is added, the R-o-b still
stands.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Y4odgjyWSGvy9y5OHjc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/KakQACgkQFkJ4iaW4
c+5UIxAA6ZloExN3e4Iq9ew0cL/CEPKQ8fom44a30YnsXmStU2ARoLPlt2qJ+QwV
4by4e1YYvwWDBKJXIWA0TlLzAZodXcPPJ/N9GcGUQuvZw8829psyfLfc6e+MAH+T
Hj2zKpbJG8/PbReRG3hh8HUq0U+pAZ1xfdIXyR2sLsfSj4sUOv2efTl/6LiVVp42
2joGpLFmqvlbfV0TpvpvEeyLFmkwtQn/LjN/oBUWCUEM7GcI7EOtEgH/cvGlckXr
LiuKGb3q0Qd0x44hpWv45kzjz1rB8R636LrqQsz79bs1Bej2grV4oK/QI94FKWoU
mlHRwFddQvm2LWkfuMPkEgIAqRjdluBonGPz9dfKj2sI29bb6rgzjEPl6sDSwSRZ
Cdvg+JsX4tpxGuwbyAHN2gew1/ruaemj4fG+I2O2K7VM520IjDtQasJvNvDoLgX8
F84wvgpBfF1W0ugsr7kby7Lh///BzSgbpk1KLEGZy140SBwjgrgfwagLW/3fW57N
qQKtg2ecCLBr7pMm7FryR4CaMMlDbWxb7CO0MUrw+x1+bGa65mQQPNunNYzYmmke
XwwCMbCLtSmoUlrVfR+qfrS4YWIatjFnlb6vbqBQoxxHi65LwJp0gXRpU5T1VoiB
YoPb0XHUKqGAg0mgXkNNEsMdiwLaai8a3Z+DJ/hpY86uvQJwVEI=
=/d0r
-----END PGP SIGNATURE-----

--=-Y4odgjyWSGvy9y5OHjc7--


