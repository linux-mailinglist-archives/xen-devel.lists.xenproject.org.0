Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D114549C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 13:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFYk-0006nA-CV; Wed, 22 Jan 2020 12:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iuFYi-0006n4-II
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 12:56:36 +0000
X-Inumbo-ID: 9ec8f9d2-3d16-11ea-bc35-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ec8f9d2-3d16-11ea-bc35-12813bfff9fa;
 Wed, 22 Jan 2020 12:56:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3587FAB3D;
 Wed, 22 Jan 2020 12:56:34 +0000 (UTC)
Message-ID: <c9d6d77e40deeb67715008a8412c558a559e24b7.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 13:56:31 +0100
In-Reply-To: <20200108152328.27194-8-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-8-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 7/9] xen/sched: switch scheduling to bool
 where appropriate
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============7995707946359937665=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7995707946359937665==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LZ+CYI+W34JQlOOsn6PI"


--=-LZ+CYI+W34JQlOOsn6PI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-08 at 16:23 +0100, Juergen Gross wrote:
> Scheduling code has several places using int or bool_t instead of
> bool.
> Switch those.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - rename bool "pos" to "first" (Dario Faggioli)
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-LZ+CYI+W34JQlOOsn6PI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4oRn8ACgkQFkJ4iaW4
c+4T+A/9F43j+pUoOuTnbJBZl6gBkxVZwooigZE18CeoJS7zpRcPpYEzbYW9xIcm
IUOzuPrbi3knHj7sfyY9+oAn5f8X56AO7IEEuoL/RyHsnq9CixPnUOsxD/sMe9SF
AKhSazRQJbUuKhMDkRXXBl0kwO0oovcqb5SGls5GfNyBH4GxuDc7q77TSU5mmnC2
7aqbBRu+3dQlOxKCCgKMNaykYpdM1B9ZMpZY9/4KAOx4LO1uTYZvHRfizwBdU6WY
hZzN07ijR/4YqYhU4O220IYWVs7142TQFPxrTvJrR++cxxsV4WTM1eEQrlIrq0LM
J7g0mUPuQWLMgH/ICYznx7YRW4cqb5wv8Rj4JS47auP4xTUoZe6Usb+QFLTln26T
ooi7S6OUyQdHe3hZhaDS1sc8AqmMprJ/kHEg0KZF0PsoAxlR9bEpLV7YBetIG+hN
9X24ofTkvBofaR1sVOgxyvHt06qXqC6f23xAHcD22/5i41txu/RgsuU4u0GbdtAV
6mdg9HG23lOn69RerbBlAuXuEkVJZhkOwx2UYygYyCiT788EalBJwJbYCsL8LHcO
UIM+eEk4VYX0TnMO/XXVHCQye3aeZV+PXrPYI2TdZ2CXJcJN2nbrKz/JRA9r9Np3
Re/p8KvQc+DfKUQxHgMtIJE5THKJC/DPdRrTvvoLWpSMMGlEqwo=
=ZpGR
-----END PGP SIGNATURE-----

--=-LZ+CYI+W34JQlOOsn6PI--



--===============7995707946359937665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7995707946359937665==--


