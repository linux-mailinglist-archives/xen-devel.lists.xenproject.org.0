Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFE56F22
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 18:51:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgB6f-0005yU-Gx; Wed, 26 Jun 2019 16:49:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NxzR=UZ=redhat.com=mreitz@srs-us1.protection.inumbo.net>)
 id 1hgB6d-0005yP-N5
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 16:49:11 +0000
X-Inumbo-ID: 524bed75-9832-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 524bed75-9832-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 16:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF0F03087BA9;
 Wed, 26 Jun 2019 16:48:56 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49BFC5D71B;
 Wed, 26 Jun 2019 16:48:52 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
References: <20190409164038.25484-1-paul.durrant@citrix.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
Date: Wed, 26 Jun 2019 18:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190409164038.25484-1-paul.durrant@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 26 Jun 2019 16:48:56 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH] xen-block: support feature-large-sector-size
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
Cc: Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/mixed; boundary="===============2274571413853639213=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2274571413853639213==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Gkto9IzkowkEhtkBIrgnpE898N3naoJWl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gkto9IzkowkEhtkBIrgnpE898N3naoJWl
Content-Type: multipart/mixed; boundary="34ln4BYdbpqUgT9slu05HeqY57DapPBKo";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Paul Durrant <paul.durrant@citrix.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Message-ID: <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
Subject: Re: [PATCH] xen-block: support feature-large-sector-size
References: <20190409164038.25484-1-paul.durrant@citrix.com>
In-Reply-To: <20190409164038.25484-1-paul.durrant@citrix.com>

--34ln4BYdbpqUgT9slu05HeqY57DapPBKo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.04.19 18:40, Paul Durrant wrote:
> A recent Xen commit [1] clarified the semantics of sector based quantit=
ies
> used in the blkif protocol such that it is now safe to create a xen-blo=
ck
> device with a logical_block_size !=3D 512, as long as the device only
> connects to a frontend advertizing 'feature-large-block-size'.
>=20
> This patch modifies xen-block accordingly. It also uses a stack variabl=
e
> for the BlockBackend in xen_block_realize() to avoid repeated dereferen=
cing
> of the BlockConf pointer, and changes the parameters of
> xen_block_dataplane_create() so that the BlockBackend pointer and secto=
r
> size are passed expicitly rather than implicitly via the BlockConf.
>=20
> These modifications have been tested against a recent Windows PV XENVBD=

> driver [2] using a xen-disk device with a 4kB logical block size.
>=20
> [1] http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D67e1c050e=
36b2c9900cca83618e56189effbad98
> [2] https://winpvdrvbuild.xenproject.org:8080/job/XENVBD-master/126
>=20
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> ---
>  hw/block/dataplane/xen-block.c | 25 ++++++++++++----------
>  hw/block/dataplane/xen-block.h |  3 ++-
>  hw/block/xen-block.c           | 38 +++++++++++++++++++++-------------=

>  3 files changed, 40 insertions(+), 26 deletions(-)

Thanks, added =E2=80=9Cby frontend=E2=80=9D to the error message and appl=
ied to my block
branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--34ln4BYdbpqUgT9slu05HeqY57DapPBKo--

--Gkto9IzkowkEhtkBIrgnpE898N3naoJWl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0TofIACgkQ9AfbAGHV
z0Bf9QgAv7dRDnGrCMs54H1GLYFL/hhEQ1eHYI323wSBAeSelvLDXMp9VDh4UBKY
pBkBi4UyjaIUm1aZlgHvzWFNjUYUjojUDcr7wyW7vys33G7R2qoQYFBzalw1LqP/
MBf8ujwA7dzAdCyaQw4Ae129i7b8Jp6YcyzL+484EPSsP4M9LLrZW8EjjnyJh0cx
83j8/6Kw0vnZZq8qXnCMQYR2zCRsu5+fhklO9JNQE54xD7l/2w2rQWkUPOQDzHcQ
guWOPRmEcAUUB1stJxzUMjcJFARmpg3ZWfMDVDFp2lGdGCzTYgvPeIhYB53fTdeb
nJ8zYZSoIf/6JDp5fK8ZHSzb3Czgsw==
=KOOG
-----END PGP SIGNATURE-----

--Gkto9IzkowkEhtkBIrgnpE898N3naoJWl--


--===============2274571413853639213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2274571413853639213==--

