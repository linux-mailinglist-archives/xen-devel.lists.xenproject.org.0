Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65134387B2F
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129285.242696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0n6-0005qY-KI; Tue, 18 May 2021 14:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129285.242696; Tue, 18 May 2021 14:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0n6-0005ng-HG; Tue, 18 May 2021 14:33:48 +0000
Received: by outflank-mailman (input) for mailman id 129285;
 Tue, 18 May 2021 14:33:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj0n5-0005na-4X
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:33:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528c92dc-a590-409a-be68-fbff54e7dded;
 Tue, 18 May 2021 14:33:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9C92B14B;
 Tue, 18 May 2021 14:33:44 +0000 (UTC)
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
X-Inumbo-ID: 528c92dc-a590-409a-be68-fbff54e7dded
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621348424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F2Tf6kI7UeHgpgT+OGr2H+OVhbgDckz6+Wy28MEwB+A=;
	b=aHHSS2cDAEWxgVraQPYn8uccQD1UEHQNvC9dDmrJtZZV9TlSnrDUsRoTBGTzopqNcwBctn
	SBA/3QQBqMzVDg7tzMGErAEnCtbjcaXAPsNO7qJPDj/BF7ZgkNyd2wSRNefjIeAaN2E7U9
	Gn7e2DfsxRzLtqIUv2LfjpBW9d+872E=
Message-ID: <9160502180e3c36a52cb841520615bc7fe91b42b.camel@suse.com>
Subject: Re: [PATCH 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 16:33:43 +0200
In-Reply-To: <YKO/BcUAtjSgc2pV@Air-de-Roger>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
	 <162133945335.25010.4601866854997664898.stgit@Wayrath>
	 <YKO/BcUAtjSgc2pV@Air-de-Roger>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-O66TOK2Q3vQOAWcOaALn"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-O66TOK2Q3vQOAWcOaALn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-05-18 at 15:20 +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 18, 2021 at 02:04:13PM +0200, Dario Faggioli wrote:
> > From: Dario Faggioli <dario@Solace.fritz.box>
> >=20
Mmm... this email address does not really exist, and it's a mistake
that it ended up here. :-/

> > Fix the build inside our openSUSE Tumbleweed container by using
> > the proper python development packages (and adding zstd headers).
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > ---
> > Cc: Doug Goldstein <cardoe@cardoe.com>
> > Cc: Roger Pau Monne <roger.pau@citrix.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > =C2=A0.../build/suse/opensuse-tumbleweed.dockerfile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 ++---
> > =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > index 8ff7b9b5ce..5b99cb8a53 100644
> > --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> >=20
> > @@ -56,10 +57,8 @@ RUN zypper install -y --no-recommends \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pandoc \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg-config \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python-devel \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3 \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-devel \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python38-devel \
>=20
> When I tested python3-devel was translated into python38-devel,=C2=A0
>
Oh, really? And when was it that you tested it, if I can ask?

> which
> I think is better as we don't need to modify the docker file for
> every
> new Python version?
>=20
That would definitely be better. Right now, I don't see any
python3-devel package. If python3-devel can still be used (and it
somehow translates to the proper -devel package), then sure we should
use it. I'm not sure how that would happen, but maybe it's just me
being unaware of some packaging magic.

Let me put "python3-devel" there and test locally again, so we know if
it actually works.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-O66TOK2Q3vQOAWcOaALn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCj0EcACgkQFkJ4iaW4
c+6cShAAglO8B5fyx/MA+yWiQlyVfzamxpEE9BNKP7mIzr3yoMWPj2Hd1mxdxfJS
FQ5iNLSf9KWnMW95jQgZfWwxaT3B+BhNw6lNemNFtF9gRl3y3aW25xbLiezCFCun
W9rbKa/mfScH1xisMtpnkUKEnpddfipHZohFzp/o4oLHomxUGpB0C8OXoWNZXJ2f
WDH+ijKjGUyIfecYt4pTGrYxXIb7aFZ86vm2j48L0NNpdKNwediyas20A+tB1mZV
sSVPCG+PblUZCfp7u06gD1gQnxLpOYkUz7n2tugYup4DG0F9gmbLk3w6vJ2/4UKK
pH+UWkj/LLVijp1AhhI5QvF5tM8X66e2A2lioU0m5drL1lc6V+5nQmCBPdNFCScE
+DdaTWPBBt+yDofaY086QyDhOan7IoQYtBxzD+6xlAr6492VwteOeuXKBc1PWNPx
FMFOf4WQeJTCYwcm1pnw3gyzpEl+eMk1SYDV6PnlSgaJSuqnMrARQLhhEdkZw/66
WF+VfmrIFdkov5l3Z8JQ/crq4MdiajHxxxl5+Hdgv08OUo5yOKL+EZsoIrsHUaXz
U/L9cdsGQrBHK3WzmY9QkMU+dsQNKPYrWeOArhIfJ8EFQFVIAmy8xeeJJfX5F7IR
gDMcsqXNAexxvFG2tQo+711UVfjxUDSO0pl6utvc10BDF3KtDnw=
=WOLs
-----END PGP SIGNATURE-----

--=-O66TOK2Q3vQOAWcOaALn--


