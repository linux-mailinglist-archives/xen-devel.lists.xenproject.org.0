Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061D380ACB
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 15:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127364.239353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYIT-00056k-F3; Fri, 14 May 2021 13:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127364.239353; Fri, 14 May 2021 13:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYIT-00054P-C6; Fri, 14 May 2021 13:56:09 +0000
Received: by outflank-mailman (input) for mailman id 127364;
 Fri, 14 May 2021 13:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhYIR-00054J-96
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 13:56:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 161ba445-aa20-48e8-b9ef-cae014c0dcbc;
 Fri, 14 May 2021 13:56:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C029AC47;
 Fri, 14 May 2021 13:56:04 +0000 (UTC)
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
X-Inumbo-ID: 161ba445-aa20-48e8-b9ef-cae014c0dcbc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621000564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ogAYC34f/q7VMRbs3ZtWRqAlocqeIndtCfA4GK6PXnU=;
	b=PV+zv1nGbB7gW6V1V+iooWmMtNw2Am+yRWbCNRZLjxXaD0SEqscckKZ4LoTyURLd+SkwRS
	QWVLMcvBiFrvOc0RoKZ6pvKi2UYrxzW3dSmMDMbPX4Py7hAZ+aUJiFmeSVG9U3B85RxMBM
	8x4qJlB39isly3Eq1kcpHYk0ajHWE2k=
Subject: Re: [PATCH v2 0/3] swiotlb-xen init fixes
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, hch@lst.de
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1cbce1dc-bf1f-2448-f839-47a4e06f43f0@suse.com>
Date: Fri, 14 May 2021 15:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yHdcDRAVbxfU5I8D2hPUiwkn1l2CwsVnE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yHdcDRAVbxfU5I8D2hPUiwkn1l2CwsVnE
Content-Type: multipart/mixed; boundary="aaQUglZ92RYiMKAAjAHv2FbcOlIBdsWJI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, hch@lst.de
Message-ID: <1cbce1dc-bf1f-2448-f839-47a4e06f43f0@suse.com>
Subject: Re: [PATCH v2 0/3] swiotlb-xen init fixes
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>

--aaQUglZ92RYiMKAAjAHv2FbcOlIBdsWJI
Content-Type: multipart/mixed;
 boundary="------------83F0EB9215915B02E79026A1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------83F0EB9215915B02E79026A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.05.21 22:18, Stefano Stabellini wrote:
> Hi all,
>=20
> This short patch series comes with a preparation patch and 2 unrelated
> fixes to swiotlb-xen initialization.
>=20
>=20
> Christoph Hellwig (1):
>        arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required
>=20
> Stefano Stabellini (2):
>        xen/arm: move xen_swiotlb_detect to arm/swiotlb-xen.h
>        xen/swiotlb: check if the swiotlb has already been initialized
>=20
>   arch/arm/xen/mm.c             | 20 +++++++-------------
>   arch/arm64/mm/init.c          |  3 ++-
>   drivers/xen/swiotlb-xen.c     |  5 +++++
>   include/xen/arm/swiotlb-xen.h | 15 ++++++++++++++-
>   4 files changed, 28 insertions(+), 15 deletions(-)
>=20

Series pushed to xen/tip.git for-linus-5.13b


Juergen

--------------83F0EB9215915B02E79026A1
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

--------------83F0EB9215915B02E79026A1--

--aaQUglZ92RYiMKAAjAHv2FbcOlIBdsWJI--

--yHdcDRAVbxfU5I8D2hPUiwkn1l2CwsVnE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCegXMFAwAAAAAACgkQsN6d1ii/Ey8f
uQf/WkB4isD+ugClXbVzv7vjbJIe7xf8jNseT0HV4SJgSR8QbnIpkHDnD6De5SCEHR5+SN7zbWzO
Zg8qhc0clN6nBUxijEb6iSVGNxxPqoRCNTcqtuDdk1DbYLSpic/IeoS7IjtJ3aXzq5wITAc2zZ42
DwiMEOTZrkL4FgNb5Cx1Wt6lUAe7lhpCcHcXtHAr/5FlvzwQVBJsD04Kf2RHOUFaL5RT0d9TVsH1
vN/iIqo34jOBXsNEd3PBMLx9/q9iGhQm0E68b4iDXppdZKcMQYCUpxBckn2vsKatIDatr/BImwl7
rWWkFzA7uDGP92N+KT17iPHnMbsmqA8Vm77O+dKETg==
=RoaB
-----END PGP SIGNATURE-----

--yHdcDRAVbxfU5I8D2hPUiwkn1l2CwsVnE--

