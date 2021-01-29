Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE5730867A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 08:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77740.140992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OJD-0001Bi-VI; Fri, 29 Jan 2021 07:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77740.140992; Fri, 29 Jan 2021 07:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OJD-0001BL-RE; Fri, 29 Jan 2021 07:35:11 +0000
Received: by outflank-mailman (input) for mailman id 77740;
 Fri, 29 Jan 2021 07:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j1X=HA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l5OJB-0001BG-Nt
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 07:35:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e94c1306-46b8-4030-9b95-5d1484d3ea0e;
 Fri, 29 Jan 2021 07:35:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65E32ABDA;
 Fri, 29 Jan 2021 07:35:07 +0000 (UTC)
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
X-Inumbo-ID: e94c1306-46b8-4030-9b95-5d1484d3ea0e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611905707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zAq51H83aYnizsU5uKH4Xo3JZYjQqCAFMXuwsnbMpLQ=;
	b=egkOuZgO/1U3ZcJB0aoekc8YSPYrBM6Dbx4wpJ7qyPhKX7f9X3H2cqMyawp7VD5rpT7YDZ
	URDzYzj3ypDwVGagHUmRlb6Wjj7WevT/XncPuMIRgZh+8067dnTdjTLZ9dAXKQn7fdCkXZ
	665Pk57zhHySUtiPYi9FUeK8y3atlLE=
Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page
 rings
To: Dongli Zhang <dongli.zhang@oracle.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20210128130441.11744-1-paul@xen.org>
 <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com>
Date: Fri, 29 Jan 2021 08:35:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KTNhVyFFfyx2e8FCQZ7SGPr0cJJ2X0WH9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KTNhVyFFfyx2e8FCQZ7SGPr0cJJ2X0WH9
Content-Type: multipart/mixed; boundary="v0ECwaP7zIbuMUDrGMvLowgnhMmWanZZI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dongli Zhang <dongli.zhang@oracle.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com>
Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page
 rings
References: <20210128130441.11744-1-paul@xen.org>
 <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>
In-Reply-To: <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com>

--v0ECwaP7zIbuMUDrGMvLowgnhMmWanZZI
Content-Type: multipart/mixed;
 boundary="------------23E2E4DE08DE09AA38981101"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------23E2E4DE08DE09AA38981101
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.01.21 07:20, Dongli Zhang wrote:
>=20
>=20
> On 1/28/21 5:04 AM, Paul Durrant wrote:
>> From: Paul Durrant <pdurrant@amazon.com>
>>
>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to a=
void
>> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), t=
he
>> behaviour of xen-blkback when connecting to a frontend was:
>>
>> - read 'ring-page-order'
>> - if not present then expect a single page ring specified by 'ring-ref=
'
>> - else expect a ring specified by 'ring-refX' where X is between 0 and=

>>    1 << ring-page-order
>>
>> This was correct behaviour, but was broken by the afforementioned comm=
it to
>> become:
>>
>> - read 'ring-page-order'
>> - if not present then expect a single page ring (i.e. ring-page-order =
=3D 0)
>> - expect a ring specified by 'ring-refX' where X is between 0 and
>>    1 << ring-page-order
>> - if that didn't work then see if there's a single page ring specified=
 by
>>    'ring-ref'
>>
>> This incorrect behaviour works most of the time but fails when a front=
end
>> that sets 'ring-page-order' is unloaded and replaced by one that does =
not
>> because, instead of reading 'ring-ref', xen-blkback will read the stal=
e
>> 'ring-ref0' left around by the previous frontend will try to map the w=
rong
>> grant reference.
>>
>> This patch restores the original behaviour.
>>
>> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid inco=
nsistent xenstore 'ring-page-order' set by malicious blkfront")
>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>> ---
>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
>> Cc: Jens Axboe <axboe@kernel.dk>
>> Cc: Dongli Zhang <dongli.zhang@oracle.com>
>>
>> v2:
>>   - Remove now-spurious error path special-case when nr_grefs =3D=3D 1=

>> ---
>>   drivers/block/xen-blkback/common.h |  1 +
>>   drivers/block/xen-blkback/xenbus.c | 38 +++++++++++++---------------=
--
>>   2 files changed, 17 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-bl=
kback/common.h
>> index b0c71d3a81a0..524a79f10de6 100644
>> --- a/drivers/block/xen-blkback/common.h
>> +++ b/drivers/block/xen-blkback/common.h
>> @@ -313,6 +313,7 @@ struct xen_blkif {
>>  =20
>>   	struct work_struct	free_work;
>>   	unsigned int 		nr_ring_pages;
>> +	bool                    multi_ref;
>=20
> Is it really necessary to introduce 'multi_ref' here or we may just re-=
use
> 'nr_ring_pages'?
>=20
> According to blkfront code, 'ring-page-order' is set only when it is no=
t zero,
> that is, only when (info->nr_ring_pages > 1).

Did you look into all other OS's (Windows, OpenBSD, FreebSD, NetBSD,
Solaris, Netware, other proprietary systems) implementations to verify
that claim?

I don't think so. So better safe than sorry.


Juergen

--------------23E2E4DE08DE09AA38981101
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------23E2E4DE08DE09AA38981101--

--v0ECwaP7zIbuMUDrGMvLowgnhMmWanZZI--

--KTNhVyFFfyx2e8FCQZ7SGPr0cJJ2X0WH9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmATuqoFAwAAAAAACgkQsN6d1ii/Ey80
kwf/e41zDqm+jP5oJsLO4FvTwwwFeSs6ARV+zlLQCldBq5oB1HPuzNpjQsE704m/eUEZzMZy2/7W
Z1pKAwvSLzPQyyx7Rw8pJKJuNio7oIAiCKAiupU3rJBmorI3CCLlbpwfdFGkuKJ8GxZs193BL+WC
3dNKyBC4aFT3khnmT5y/9PF08Ms9YYVOYPq+6KOM0MbsseD9d4E9LwsC1wzWG9EUA5Ckh8wIZ3XR
VO1561Q2S36zukXwzbvsGOk9JmD/1kjjR26wsC0JAYU5JKIJxAeeR9V1ZXXrcLjbmwC8KPF+mhOP
/9Obe9R6O6mT4jKwbmwqJBYjBBJvMsSkKdry2YZZRg==
=KyR6
-----END PGP SIGNATURE-----

--KTNhVyFFfyx2e8FCQZ7SGPr0cJJ2X0WH9--

