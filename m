Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37631C96C4
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 18:45:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWjeB-0004D8-BG; Thu, 07 May 2020 16:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slKb=6V=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jWje9-0004D3-OX
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 16:45:17 +0000
X-Inumbo-ID: 215c21bc-9082-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 215c21bc-9082-11ea-b9cf-bc764e2007e4;
 Thu, 07 May 2020 16:45:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E35E6ABCE;
 Thu,  7 May 2020 16:45:18 +0000 (UTC)
Message-ID: <a554266eacebffea74889d71b67dd207dcd4c574.camel@suse.com>
Subject: Re: [PATCH v4] sched: print information about scheduling granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 07 May 2020 18:45:14 +0200
In-Reply-To: <20200506100024.17387-1-sergey.dyasli@citrix.com>
References: <20200506100024.17387-1-sergey.dyasli@citrix.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-VUUsSBVlpTEsqI+1+SMP"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-VUUsSBVlpTEsqI+1+SMP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-06 at 11:00 +0100, Sergey Dyasli wrote:
> Currently it might be not obvious which scheduling mode (e.g. core-
> scheduling) is being used by the scheduler. Alleviate this by
> printing
> additional information about the selected granularity per-cpupool.
>=20
> Note: per-cpupool granularity selection is not implemented yet. Every
>       cpupool gets its granularity from the single global value.
>=20
> Take this opportunity to introduce struct sched_gran_name array and
> refactor sched_select_granularity().
>=20
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-VUUsSBVlpTEsqI+1+SMP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl60OxoACgkQFkJ4iaW4
c+7oLQ/+MMty1zl0XXjkcJXzIQf52YCUgeBgpW0xFSryEsHy5L3w3q6f1bq7PY+J
LY9wLnd7qumSqnwZpnVY5MSpaNXXrDH6WmU88TKz2x7rGeoyqYkNvjWAUjdivQO7
3iW0bojerXY9FMYbt7ILkWeQ1EKCf4hX3vzGcKVDyffL55U51OYqch00RUBHaUK2
0gjX/o7zFlZeQyRggtJnDucAuW+7QwhymdJTHLqgbNAQbz/+RZodabxWyaSE0WOc
rlQ52qyznenMdYv22N5eub0zejH1XKm1OW41tP0EKwBdC9sP6QFj0ED0+mAwvw7S
rM1jhStlBiu7hUvj30+uVQCq6g6wBYmVYLWOJdcYgJ0hiQVUlceY6Dv6/4IVKR2d
/SFw27K5bKSsdoSBYWsKecMqMlWP8i+BJdUNKuXZ18Y0+HzDC5cXGUkxBZNDDFLn
sTGppGe28JX9vLEz493u/VowR37p8Mz3/aU4jjULiI0gUn1rb96/LTxWDxbHUmPC
PQgIChqKN59dXMiBSeRVrIJhRPXVQV4ujPqtOAauRxmPIQy0CECFN48+WlJzCP+V
QW429IOzujtvpDoJspYKKxp/WHUwa95CEpuTjaLpnptv6sseVtp1eI//A4NdEU3y
LgA3R+++waTn1jf6IFLAi8i3xrT8cQC+r/XJ6T30hH+YKW/dkfQ=
=Z/9k
-----END PGP SIGNATURE-----

--=-VUUsSBVlpTEsqI+1+SMP--


