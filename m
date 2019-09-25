Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB5BE0C9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:05:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8oH-000382-ED; Wed, 25 Sep 2019 15:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD8oF-00037q-Ds
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:02:27 +0000
X-Inumbo-ID: 7bf8b7f4-dfa5-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7bf8b7f4-dfa5-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:02:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D82BCB657;
 Wed, 25 Sep 2019 15:02:24 +0000 (UTC)
Message-ID: <40b365e4e16ef9828d7c7c73cdac7ed0527c0ead.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 17:02:23 +0200
In-Reply-To: <20190914085251.18816-18-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-18-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 17/47] xen/sched: make credit2 scheduler
 vcpu agnostic.
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1761717055735663394=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1761717055735663394==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-9BeUCI7Y2yQGMBBGnsm5"


--=-9BeUCI7Y2yQGMBBGnsm5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Switch credit2 scheduler completely from vcpu to sched_unit usage.
>=20
> As we are touching lots of lines remove some white space at the end
> of
> the line, too.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I did spot another 'item' that wants to be turned into...

> diff --git a/xen/common/sched_credit2.c b/xen/common/sched_credit2.c
> index a6083289f6..0d1ba97dbc 100644
> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> =20
> @@ -510,20 +510,20 @@ struct csched2_pcpu {
>  };
> =20
>  /*
> - * Virtual CPU
> + * Schedule Item
>   */
>
... 'unit'.  :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-9BeUCI7Y2yQGMBBGnsm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LgYAACgkQFkJ4iaW4
c+5e6Q//fk56oI1qze6SgivPfMiXK8G3mlTPvxfWKp959VT4mDv58mVYTNRuLVs3
/OMlO5rN2r8rw6pJIdr/6T7PZzsiQb5FvRfsMW1HS5qbAt5oG2RAHZACFtUZpGJH
jdhSo9WAuQIyt/4oA5zX8avtEomNcyJ3POoprYwlBXTG97J6ZYNlhNCwOBLa0KbR
Fw5GuFtdvJtASRvTT8NE4A/8WnhsyOvcEqXz4pZOHoLsXl/9tPtvlrElbzdV8xdz
m0Cyf/Gjno4+rhA16qxSfKFVyphvrINIaKPGRJfBI3c4oJ0Aw6IIqhv2ZHt0dMSD
eSDnvqo9dcnndpN1IIyBM9bRi4XQ9VuE9UlKrP2UOX5b0LKDIvLiKtP8DYRaf5O2
cdL6hn6MQAfSfUzYJyyD0ggGC7HlnpqeJYLGpvobyLSGeIoKNra8GILiKswkQwfI
UB1umbjGD4/Oo2IuUqRLQlQNchOgC+tGkLGhiH9B2y9mdgR61CBS2HZDPueTovYp
wUrkt8XLS+54Bu1tl9YXFXagWuseTFcLfrNXm6FbJik2E30EjpjcrQysMUAIMXpG
GFmZ9WOeIKVmGURgBXdkfON3q7dhKt/bs0Tbmkeea8qswUdgpaS1KQKrpi+PHCcX
abf3IU2e076ir1fjtEiefxJKkFgxcISm1PF0yx2XeBSTcnNYHWY=
=AHD+
-----END PGP SIGNATURE-----

--=-9BeUCI7Y2yQGMBBGnsm5--



--===============1761717055735663394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1761717055735663394==--


