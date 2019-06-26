Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57D56FEC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 19:51:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgC2k-0002O3-SH; Wed, 26 Jun 2019 17:49:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NxzR=UZ=redhat.com=mreitz@srs-us1.protection.inumbo.net>)
 id 1hgC2j-0002Ny-D4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 17:49:13 +0000
X-Inumbo-ID: b46a2cb8-983a-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b46a2cb8-983a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 17:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFBE1307D922;
 Wed, 26 Jun 2019 17:49:05 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 485EB1001B05;
 Wed, 26 Jun 2019 17:48:57 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190409164038.25484-1-paul.durrant@citrix.com>
 <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
 <20190626171947.GF13449@perard.uk.xensource.com>
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
Message-ID: <1518aab5-83d3-fb0e-cb33-7b9d2d996497@redhat.com>
Date: Wed, 26 Jun 2019 19:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626171947.GF13449@perard.uk.xensource.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 26 Jun 2019 17:49:11 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============5012131930729452858=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5012131930729452858==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PxkiPkpTf9HppIvddhgSOmWKke5pHdjzR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PxkiPkpTf9HppIvddhgSOmWKke5pHdjzR
Content-Type: multipart/mixed; boundary="LiTUtQe8dZ9voZ3bXKAItQQ4f5mf3jYce";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Paul Durrant <paul.durrant@citrix.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Message-ID: <1518aab5-83d3-fb0e-cb33-7b9d2d996497@redhat.com>
Subject: Re: [PATCH] xen-block: support feature-large-sector-size
References: <20190409164038.25484-1-paul.durrant@citrix.com>
 <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
 <20190626171947.GF13449@perard.uk.xensource.com>
In-Reply-To: <20190626171947.GF13449@perard.uk.xensource.com>

--LiTUtQe8dZ9voZ3bXKAItQQ4f5mf3jYce
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26.06.19 19:19, Anthony PERARD wrote:
> On Wed, Jun 26, 2019 at 06:48:50PM +0200, Max Reitz wrote:
>> On 09.04.19 18:40, Paul Durrant wrote:
>>> A recent Xen commit [1] clarified the semantics of sector based quant=
ities
>>> used in the blkif protocol such that it is now safe to create a xen-b=
lock
>>> device with a logical_block_size !=3D 512, as long as the device only=

>>> connects to a frontend advertizing 'feature-large-block-size'.
>>>
>>> This patch modifies xen-block accordingly. It also uses a stack varia=
ble
>>> for the BlockBackend in xen_block_realize() to avoid repeated derefer=
encing
>>> of the BlockConf pointer, and changes the parameters of
>>> xen_block_dataplane_create() so that the BlockBackend pointer and sec=
tor
>>> size are passed expicitly rather than implicitly via the BlockConf.
>>>
>>> These modifications have been tested against a recent Windows PV XENV=
BD
>>> driver [2] using a xen-disk device with a 4kB logical block size.
>>>
>>> [1] http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D67e1c05=
0e36b2c9900cca83618e56189effbad98
>>> [2] https://winpvdrvbuild.xenproject.org:8080/job/XENVBD-master/126
>>>
>>> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
>>> ---
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Anthony Perard <anthony.perard@citrix.com>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: Max Reitz <mreitz@redhat.com>
>>> ---
>>>  hw/block/dataplane/xen-block.c | 25 ++++++++++++----------
>>>  hw/block/dataplane/xen-block.h |  3 ++-
>>>  hw/block/xen-block.c           | 38 +++++++++++++++++++++-----------=
--
>>>  3 files changed, 40 insertions(+), 26 deletions(-)
>>
>> Thanks, added =E2=80=9Cby frontend=E2=80=9D to the error message and a=
pplied to my block
>> branch:
>>
>> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
>=20
> :(, I've just sent a pull request with that patch:
> https://patchew.org/QEMU/20190624153257.20163-1-anthony.perard@citrix.c=
om/20190624153257.20163-2-anthony.perard@citrix.com/

That=E2=80=99s just as well, then. :-)

> I guess I need to start sending an email every time I've added a patch
> to my queue.

Well, it certainly won=E2=80=99t hurt.  Although in this cases it=E2=80=99=
s just a bit
of an unfortunate coincidence that I looked at this patch now when Peter
seems to be away (otherwise I=E2=80=99d have seen it in master).

Max


--LiTUtQe8dZ9voZ3bXKAItQQ4f5mf3jYce--

--PxkiPkpTf9HppIvddhgSOmWKke5pHdjzR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0TsAcACgkQ9AfbAGHV
z0BcNwf/Ql4IZr5iOViyJxBWQxDKppLZ8rdF/Ht5i5JFJjmB3Ow4RHCqcxC6h60Q
fee6fEWqhbqMWnSvxAs+/HWS0aTZAm2epWLipp3TBDH1aKpT+Zlno1OdJs91qd0D
4rjkgwgk7fX1q0I+J7KoCqJFsgkAjS7sLCCAFXzUHEjybw9+2y66Ou9Nrlz8rcU+
dJNko8PvJEoqoHEYPCEhjIyv9ueBXNv4xTFYE2AbxWgBY3jTk1NC1RmdTe/IA23N
Ki10DEOB1RLQmua22+eT6H7Q4TgNT3BZo3Tr3qS6IEwbUjcsaysrd0zGuXNROtii
qsSAjOO8K8Z0Zil4MpDmuUuzT9oCeQ==
=HFZl
-----END PGP SIGNATURE-----

--PxkiPkpTf9HppIvddhgSOmWKke5pHdjzR--


--===============5012131930729452858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5012131930729452858==--

