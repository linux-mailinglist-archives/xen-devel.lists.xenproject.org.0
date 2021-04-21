Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE9366904
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114320.217856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9ve-0007Ht-Ji; Wed, 21 Apr 2021 10:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114320.217856; Wed, 21 Apr 2021 10:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9ve-0007HT-G1; Wed, 21 Apr 2021 10:17:54 +0000
Received: by outflank-mailman (input) for mailman id 114320;
 Wed, 21 Apr 2021 10:17:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=37lK=JS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZ9vc-0007HN-9E
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:17:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67d1812d-dd23-4e41-a910-b91413a6ed57;
 Wed, 21 Apr 2021 10:17:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EDF6ACB1;
 Wed, 21 Apr 2021 10:17:50 +0000 (UTC)
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
X-Inumbo-ID: 67d1812d-dd23-4e41-a910-b91413a6ed57
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619000270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=juTGJege9oQI7pMEOBZu8vAIBiOTIVKlZajVVKVVQIo=;
	b=VGjM4DRWfc8HhQYAbDPt2ST2LyV7PrcIUKo05UjmqqUCy3F53hTRn9SKvGHEvvsT0/QhlL
	nkBK3e189SXSH0r0JCKuJ3H+96cs/ba8O8BlLsqukzruPMVq7Tm9vnD88RGXOO9+r26nmk
	c3ZCjpgrKmtRmZ0BrtuJnThlICMeElo=
Subject: Re: [PATCH v2 2/6] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-3-jgross@suse.com>
 <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6f3853d8-6900-cf27-bd2b-750b6ee2cfb1@suse.com>
Date: Wed, 21 Apr 2021 12:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vomOWatmLoWq03bOlxSDBsHtUYCH9DPeU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vomOWatmLoWq03bOlxSDBsHtUYCH9DPeU
Content-Type: multipart/mixed; boundary="BU8QJ4I1Uc3HIMZrhWLUkAmbIbDDZXDL3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Message-ID: <6f3853d8-6900-cf27-bd2b-750b6ee2cfb1@suse.com>
Subject: Re: [PATCH v2 2/6] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-3-jgross@suse.com>
 <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>
In-Reply-To: <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>

--BU8QJ4I1Uc3HIMZrhWLUkAmbIbDDZXDL3
Content-Type: multipart/mixed;
 boundary="------------1642F077A5970873B88775C4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1642F077A5970873B88775C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.04.21 12:13, Wei Liu wrote:
> On Mon, Apr 12, 2021 at 05:22:32PM +0200, Juergen Gross wrote:
>> The core of a pv linux guest produced via "xl dump-core" is not usable=

>> as since kernel 4.14 only the linear p2m table is kept if Xen indicate=
s
>> it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
>> supporting the 3-level p2m tree only.
>>
>> Fix that by copying the functionality of map_p2m() from libxenguest to=

>> libxenctrl.
>>
>=20
> So there are now two copies of the same logic? Is it possible to reduce=

> it to only one?

Yes. See the intro mail of the series.

I wanted to fix the issue first, before doing the major cleanup work.


Juergen

--------------1642F077A5970873B88775C4
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

--------------1642F077A5970873B88775C4--

--BU8QJ4I1Uc3HIMZrhWLUkAmbIbDDZXDL3--

--vomOWatmLoWq03bOlxSDBsHtUYCH9DPeU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmB/+80FAwAAAAAACgkQsN6d1ii/Ey9m
OQf+NE/AT8sP3vnQN21zf+jnsHYefgyFzaL+h5Q0a2IbAUImyvI5R5HOUi2QcJ54v8qVV/riNw+j
GQGnRbhbaxKuPbR8vowNcHZO9mxMxAY3mUbH+ftvjjUXgh94ARTTs6NtnIrRUvND3QLES6pEy2Ej
woChX+2VnEKGnMRqba1SFwGZNuR1CzXyB9jylKe8alGHWhz2Qb/V1mqo18jgcVYC899Wbj5dt0EU
X4NuiqriR2chU87agqfjzkrUp+IkbUwkC1RR8N0CNSatKWUGcAfD3k05Gt+NQqBejiE0pMtSm0m7
wAOp4LZp4UXSuCSffnICGYwsCLtjB7D2DGe/H6L7CA==
=aESp
-----END PGP SIGNATURE-----

--vomOWatmLoWq03bOlxSDBsHtUYCH9DPeU--

