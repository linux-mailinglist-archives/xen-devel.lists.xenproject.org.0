Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924152F9ACF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 08:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69411.124187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PKO-00034D-7l; Mon, 18 Jan 2021 07:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69411.124187; Mon, 18 Jan 2021 07:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PKO-00033o-4F; Mon, 18 Jan 2021 07:51:56 +0000
Received: by outflank-mailman (input) for mailman id 69411;
 Mon, 18 Jan 2021 07:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1PKM-00033i-MV
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 07:51:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 545749fe-7f3b-4782-9fcb-d079f96c8160;
 Mon, 18 Jan 2021 07:51:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79A49ABDA;
 Mon, 18 Jan 2021 07:51:52 +0000 (UTC)
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
X-Inumbo-ID: 545749fe-7f3b-4782-9fcb-d079f96c8160
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610956312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNaYx4ZcsmXIJBXS2IDzyUwQgZ8h/GwSuaIht1S0yEA=;
	b=hNge1wU7TttfvyJYe/7fSadBQwQ6Mh2ks7CODtO2kh8Aj9oHO9Snz5R51Oj3d/M9c+O3qH
	0JLTRJYpNkhNczC/Xj1t+8QOIZ2mY2xqvtVml7xP04pniZbhL0w03uP7QGe+OycGoeTeET
	LBZu/89CRL3QjF24njDTEZ/RvWJVgNA=
Subject: Re: [PATCH v2 4/8] tools/ocaml/xenstored: only quit on SIGTERM when a
 reload is possible
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Pau Ruiz Safont <pau.safont@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
 <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <09b5ab23-2044-dc8c-cc61-14cd8055c21d@suse.com>
Date: Mon, 18 Jan 2021 08:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8kvK2AVHspN0lXrztUD03pdi4DebERX7O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8kvK2AVHspN0lXrztUD03pdi4DebERX7O
Content-Type: multipart/mixed; boundary="fvDYvoYXZSMeCwXapyEM8MkaBRfdNNDSL";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Pau Ruiz Safont <pau.safont@citrix.com>
Message-ID: <09b5ab23-2044-dc8c-cc61-14cd8055c21d@suse.com>
Subject: Re: [PATCH v2 4/8] tools/ocaml/xenstored: only quit on SIGTERM when a
 reload is possible
References: <cover.1610748224.git.edvin.torok@citrix.com>
 <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>
In-Reply-To: <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>

--fvDYvoYXZSMeCwXapyEM8MkaBRfdNNDSL
Content-Type: multipart/mixed;
 boundary="------------04AD38452A6F9E3C93A199F0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------04AD38452A6F9E3C93A199F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.01.21 23:28, Edwin T=C3=B6r=C3=B6k wrote:
> Currently when oxenstored receives SIGTERM it dumps its state and quits=
=2E
> It is possible to then restart it if --restart is given, however that i=
s
> not always safe:
>=20
> * domains could have active transactions, and after a restart they woul=
d
> either reuse transaction IDs of already open transactions, or get an
> error back that the transaction doesn't exist
>=20
> * there could be pending data to send to a VM still in oxenstored's
>    queue which would be lost
>=20
> * there could be pending input to be processed from a VM in oxenstored'=
s
>    queue which would be lost
>=20
> Prevent shutting down oxenstored via SIGTERM in the above situations.
> Also ignore domains marked as bad because oxenstored would never talk
> to them again.
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>
> Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
> Reviewed-by: Christian Lindig <christian.lindig@citrix.com>
>=20
> ---
> Changed since V1:
> * post publicly now that the XSA is out
> ---
>   tools/ocaml/xenstored/connection.ml  | 35 +++++++++++++++++++++++++++=
+
>   tools/ocaml/xenstored/connections.ml |  8 +++++++
>   tools/ocaml/xenstored/xenstored.ml   | 13 +++++++++--
>   tools/xenstore/xenstored_core.c      |  7 +++++-

I don't think you should modify tools/xenstore/xenstored_core.c in your
series.


Juergen

--------------04AD38452A6F9E3C93A199F0
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

--------------04AD38452A6F9E3C93A199F0--

--fvDYvoYXZSMeCwXapyEM8MkaBRfdNNDSL--

--8kvK2AVHspN0lXrztUD03pdi4DebERX7O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAFPhcFAwAAAAAACgkQsN6d1ii/Ey/g
3wf6Ahj2+o0rKqrbw7qZf3oDI+icuKQFoRNsifBRfArEbpmzg+O0ZyZvuyXOLF5cNrRtysuxRtkb
r6rK2dsZzTpe7YRfLJrVJ7hwHMdXVb+PdR4lH8nPbIGFh9dzvVbFH5bHrovv11ldxnXRylhvwgQE
x8icS+rfK+GI53WlbQqpArM84N5m46mmlGv2+K798+H1JJQMI+5V6c0qun24OdNEhxiAPxm6tamG
GSYeVyoe+YAoGltb2plakN6sr13UZ5xcaOkRbcpZsv4r0WDUsYytc60vbF8EuRXvh7a8ZGwKTnll
uc/S6bm9Fe4fzJ3AUB7tcU3ITT6p3VKHXf9SoV3kSQ==
=jj/F
-----END PGP SIGNATURE-----

--8kvK2AVHspN0lXrztUD03pdi4DebERX7O--

