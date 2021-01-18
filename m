Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6312F9ACE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 08:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69408.124174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PJT-0002yO-TI; Mon, 18 Jan 2021 07:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69408.124174; Mon, 18 Jan 2021 07:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PJT-0002y3-QB; Mon, 18 Jan 2021 07:50:59 +0000
Received: by outflank-mailman (input) for mailman id 69408;
 Mon, 18 Jan 2021 07:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1PJS-0002xy-Ao
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 07:50:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dce7ddf-3936-4150-8c0d-85131dc71260;
 Mon, 18 Jan 2021 07:50:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 619F9ABDA;
 Mon, 18 Jan 2021 07:50:56 +0000 (UTC)
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
X-Inumbo-ID: 0dce7ddf-3936-4150-8c0d-85131dc71260
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610956256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iYY6y0yheVtMHPKzYiyBKJ4ONLF3wEWaQ6BFnR/OQjE=;
	b=O/Flfll8fLuxwqjdkKDn+iQ+fABlZ8XsSzzkBb89vbrnFy+S42WQvGTDjBtauC487ppmAt
	expGdF8u1rhbpX8fLDz2U1uWJYYY6zDIkNVBOHScoMUfzmu20x/Sx6bsZrO9Wf5MgY/O3y
	DfYUb3JRRdU9WY4tZa66CaCeO9bE7I8=
Subject: Re: [PATCH v2 1/8] tools/xenstore: add live update command to
 xenstore-control
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <jgrall@amazon.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
 <89d027f191af20c39dbf9d37dfcd602c2669511d.1610748224.git.edvin.torok@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <31626f43-150d-327c-8ca2-e7fd184af678@suse.com>
Date: Mon, 18 Jan 2021 08:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <89d027f191af20c39dbf9d37dfcd602c2669511d.1610748224.git.edvin.torok@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5LcSO1JOOFgnj2pRJGw2lgPF1z0qMdvP6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5LcSO1JOOFgnj2pRJGw2lgPF1z0qMdvP6
Content-Type: multipart/mixed; boundary="wR6g8Ijwv6ca3vPMIPDfEHtB6eA9wWUvd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <jgrall@amazon.com>
Message-ID: <31626f43-150d-327c-8ca2-e7fd184af678@suse.com>
Subject: Re: [PATCH v2 1/8] tools/xenstore: add live update command to
 xenstore-control
References: <cover.1610748224.git.edvin.torok@citrix.com>
 <89d027f191af20c39dbf9d37dfcd602c2669511d.1610748224.git.edvin.torok@citrix.com>
In-Reply-To: <89d027f191af20c39dbf9d37dfcd602c2669511d.1610748224.git.edvin.torok@citrix.com>

--wR6g8Ijwv6ca3vPMIPDfEHtB6eA9wWUvd
Content-Type: multipart/mixed;
 boundary="------------3B9D372610DF1428369D0433"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3B9D372610DF1428369D0433
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.01.21 23:28, Edwin T=C3=B6r=C3=B6k wrote:
> From: Juergen Gross <jgross@suse.com>
>=20
> Add the "live-update" command to xenstore-control enabling updating
> xenstored to a new version in a running Xen system.
>=20
> With -c <arg> it is possible to pass a different command line to the
> new instance of xenstored. This will replace the command line used
> for the invocation of the just running xenstored instance.
>=20
> The running xenstored (or xenstore-stubdom) needs to support live
> updating, of course.
>=20
> For now just add a small dummy handler to C xenstore denying any
> live update action.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Instead of merging multiple patches of mine into a single one and
sending it here with my S-o-b I'd prefer a simple caveat for your
series to depend on my C-xenstore series.

This additionally reduces the risk to miss any modifications in
my series done in a later iteration than the one you have taken.


Juergen

--------------3B9D372610DF1428369D0433
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

--------------3B9D372610DF1428369D0433--

--wR6g8Ijwv6ca3vPMIPDfEHtB6eA9wWUvd--

--5LcSO1JOOFgnj2pRJGw2lgPF1z0qMdvP6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAFPd8FAwAAAAAACgkQsN6d1ii/Ey/m
sAgAmg7pxklU+dXQ27Av3L6LCd8LL/18KWtXSMzi19312AyVneoJmjUa0RoQQjSkDsxVQdY+5G5j
7ud3TO8ec/BGbntecG/oh0G3DfQzeLO+wj5AOELdJvci/JL1iCyQdmNhXeutQztieT8Us9oKgL9t
O9ENAa+dEKEdms6eXavpWsom7fKGfcyObrembfeZG4xsqKGjjjqhUlWdU9D9Zorjomwieq7itHi/
6HDTQ3Gnho+4cgMgIUMOogRCjw4Nb/MiWW76Z8dF6rKSt4KauhqfPFgOUwutkx4aaPJWiWDpxoEQ
P0Sm4OuQeBFEoULUYNmEHIWAzByLQ0q//bOkIFP5Cw==
=bZVm
-----END PGP SIGNATURE-----

--5LcSO1JOOFgnj2pRJGw2lgPF1z0qMdvP6--

