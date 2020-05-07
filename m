Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF381C96BD
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 18:44:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWjck-00046g-S7; Thu, 07 May 2020 16:43:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slKb=6V=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jWjck-00046a-4J
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 16:43:50 +0000
X-Inumbo-ID: ed0577a6-9081-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed0577a6-9081-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 16:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF37FABE2;
 Thu,  7 May 2020 16:43:50 +0000 (UTC)
Message-ID: <17751c12cdc39acdfaba3a0416ce2b36025a03cc.camel@suse.com>
Subject: Re: [PATCH RESEND 1/2] xen/Kconfig: define EXPERT a bool rather
 than a string
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 07 May 2020 18:43:45 +0200
In-Reply-To: <20200430142548.23751-2-julien@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-2-julien@xen.org>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-I/JwIHgu+OPLjEEgn4hQ"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-I/JwIHgu+OPLjEEgn4hQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 15:25 +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit f80fe2b34f08 "xen: Update Kconfig to Linux v5.4" EXPERT
> can only have two values (enabled or disabled). So switch from a
> string
> to a bool.
>=20
> Take the opportunity to replace all "EXPERT =3D y" to "EXPERT".
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/Kconfig                     |  3 +--
>  xen/Kconfig.debug               |  2 +-
>  xen/arch/arm/Kconfig            | 10 +++++-----
>  xen/arch/x86/Kconfig            |  6 +++---
>  xen/common/Kconfig              | 14 +++++++-------
>  xen/common/sched/Kconfig        |  2 +-
>
I think I'm being copied to this patch due to the hunk that changes
this file above.

Such hunk is:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

FWIW, I agree with the basic idea of the patch series too.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-I/JwIHgu+OPLjEEgn4hQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl60OsEACgkQFkJ4iaW4
c+4kiBAAp2nTBavhsadoZOh2zPgIW5jF8yiohBJ6dxUZi6SMnLA0BZu+t9ratJv5
P8fvaLqIN9ZnhLqgWOUazxK3GmdUSkVJ8XJ1nrUoyCKxlt0K7qbhnUxX1H0uYLfP
zwhJM7mHOIf0srBpLQ2EQ+Z4AM1zaZ0/LkLqGEkK/Z7zqWQ21KGWWAdvrRbTGSXy
EmQaFFRrvVzc2StNpQ84HcEg7U96fJIwXdFHAn9mkf9Wla9LXYWa/CLy0vu//ppW
vmnILpw8jlx5ZxEY+2JgUeb1/YzjmdrdiPcK0HktRRJhOpxrLcG9Ai7uwIBjYKKn
SfFVKf1goOY/j39X1QG+UpCv4iRZobJQsnAd70Cb9VHETg71a5fVlCqeMWkiV27S
Y8efJauJugIvO51mT8nc70Q3x3fXlH0AVkbyxMqK9tFWOmyBBMK2mCfSVx2RJ+Ve
qAW4+tpReJGVuC/ZufA0V4e1vRxCG9DRoYtzC24+Dq+8tXzCMNSxSNf7nIVR83BQ
tXcquawn+XkiUIc19GASrKV85nRs3d6giUdoWky9VB4vZ18kLzim7+ogNrvmnok4
QKC9yXi56NXCI3RVrL+5h5wnbSJNUn6ze/q3oiDyD3WT8lwPOEkxtFcgKrCeiYRv
+lWzyAGVqpEoIucmmA92fuja9J21vbhNOj9Lf+SdMp1xFx3bvos=
=Z+2q
-----END PGP SIGNATURE-----

--=-I/JwIHgu+OPLjEEgn4hQ--


