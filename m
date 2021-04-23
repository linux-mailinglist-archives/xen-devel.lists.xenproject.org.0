Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA335368E64
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 10:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115938.221245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqnE-0000Mn-Ql; Fri, 23 Apr 2021 08:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115938.221245; Fri, 23 Apr 2021 08:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqnE-0000MO-NU; Fri, 23 Apr 2021 08:04:04 +0000
Received: by outflank-mailman (input) for mailman id 115938;
 Fri, 23 Apr 2021 08:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwNy=JU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZqnD-0000MJ-Uf
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 08:04:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bf3fbbb-5c38-43f7-8e94-3a885b0d8d18;
 Fri, 23 Apr 2021 08:04:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DACBDAF16;
 Fri, 23 Apr 2021 08:04:01 +0000 (UTC)
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
X-Inumbo-ID: 4bf3fbbb-5c38-43f7-8e94-3a885b0d8d18
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619165042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HkRlvaYTqjK3GrkRds200WV8JDhuRaotVBC6y/2NlWs=;
	b=DfFUGDPJ05zE9F048eQFJ2HcmiZYSDHQH32l3mNZ6vJnPjHfLRxXEDCditZSn5lzzbxS4y
	O4DcwftOID4UZFzTYbw5Btv3CV0s41wiJ1Ty0CLhIMiowdhgLAiBo+XVDQPllZIu4N6Dlm
	2n9DHlkQ623OUxa4lf3qtTM9T6yxZCw=
Subject: Re: [PATCH v3] xen-blkback: fix compatibility bug with single page
 rings
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>
References: <20210202175659.18452-1-paul@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1327bf3a-f5cf-6e1f-1a0e-e55aeabf787d@suse.com>
Date: Fri, 23 Apr 2021 10:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210202175659.18452-1-paul@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HiSLAGeXxpHtgrXTnsn1bi68Vp1T9MZiA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HiSLAGeXxpHtgrXTnsn1bi68Vp1T9MZiA
Content-Type: multipart/mixed; boundary="KYOMrkLS20NrNcftsjlupQXkXXuIEx1jr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>
Message-ID: <1327bf3a-f5cf-6e1f-1a0e-e55aeabf787d@suse.com>
Subject: Re: [PATCH v3] xen-blkback: fix compatibility bug with single page
 rings
References: <20210202175659.18452-1-paul@xen.org>
In-Reply-To: <20210202175659.18452-1-paul@xen.org>

--KYOMrkLS20NrNcftsjlupQXkXXuIEx1jr
Content-Type: multipart/mixed;
 boundary="------------28833C7213E99D38DDDDA630"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------28833C7213E99D38DDDDA630
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.02.21 18:56, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to av=
oid
> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), th=
e
> behaviour of xen-blkback when connecting to a frontend was:
>=20
> - read 'ring-page-order'
> - if not present then expect a single page ring specified by 'ring-ref'=

> - else expect a ring specified by 'ring-refX' where X is between 0 and
>    1 << ring-page-order
>=20
> This was correct behaviour, but was broken by the afforementioned commi=
t to
> become:
>=20
> - read 'ring-page-order'
> - if not present then expect a single page ring (i.e. ring-page-order =3D=
 0)
> - expect a ring specified by 'ring-refX' where X is between 0 and
>    1 << ring-page-order
> - if that didn't work then see if there's a single page ring specified =
by
>    'ring-ref'
>=20
> This incorrect behaviour works most of the time but fails when a fronte=
nd
> that sets 'ring-page-order' is unloaded and replaced by one that does n=
ot
> because, instead of reading 'ring-ref', xen-blkback will read the stale=

> 'ring-ref0' left around by the previous frontend will try to map the wr=
ong
> grant reference.
>=20
> This patch restores the original behaviour.
>=20
> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid incon=
sistent xenstore 'ring-page-order' set by malicious blkfront")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Dongli Zhang <dongli.zhang@oracle.com>
> Reviewed-by: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>

Pushed to xen/tip.git for-linus-5.13


Juergen

--------------28833C7213E99D38DDDDA630
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

--------------28833C7213E99D38DDDDA630--

--KYOMrkLS20NrNcftsjlupQXkXXuIEx1jr--

--HiSLAGeXxpHtgrXTnsn1bi68Vp1T9MZiA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCCf3AFAwAAAAAACgkQsN6d1ii/Ey9D
LggAiqRlKq5tD+f7ISaZt7G6MbBridODJTOpvzT99wC5fNYKhUCztJbjnWRkcmX6nx+mYPcNvRcW
dJYlxWpFOpPEklUalT5Ovjtcv0ySVDFPNbymx6kI72PpeSmgil4cq1x+o2MeVR13Z0sn8kEfxYXt
o2XX6N+Q8F4aM7+X+ZiI2EoWoc7ZwjGL260dtJZQlTc3rf8ojVHJASVDxVY41JMvEhxpOgJIcUio
pDZMbdminWY3zO6ozl3QYpcYwlkd111vimzYHDnn7j1ez8ED/IsvprntyVJ0AlEBxqdgaPTbtdE+
nu6bsP1MTXO6ZdK+gUNMafQiYVPRBrq3OIdTox9gYw==
=bs1D
-----END PGP SIGNATURE-----

--HiSLAGeXxpHtgrXTnsn1bi68Vp1T9MZiA--

