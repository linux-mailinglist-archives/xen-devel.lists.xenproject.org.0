Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9630F1E5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81257.149818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ceC-0002s1-Nq; Thu, 04 Feb 2021 11:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81257.149818; Thu, 04 Feb 2021 11:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ceC-0002rc-Kc; Thu, 04 Feb 2021 11:18:04 +0000
Received: by outflank-mailman (input) for mailman id 81257;
 Thu, 04 Feb 2021 11:18:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI3K=HG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7ceA-0002rW-Qr
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:18:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d655b99-1a1d-40af-bdf4-e1e24b990719;
 Thu, 04 Feb 2021 11:18:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1F0FAC97;
 Thu,  4 Feb 2021 11:18:00 +0000 (UTC)
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
X-Inumbo-ID: 5d655b99-1a1d-40af-bdf4-e1e24b990719
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612437481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BHEqPO6ZYTSxG2igtJXOMEyvxnwNqAF1STZ2Y7mc3SA=;
	b=Na59ncoruAnvY9EMPmaL3WESjGaLDLRitwosHQAHGVv0Yu2wfabdNFnF7xGkCf8yxsPLMz
	XwSpZU5FUVA/eFkMvpJjeTuAuQGyoLYtsxJVFfb5ktTCsvbLE4gcX/kA47/HgfWAYcbP7c
	cchmSje/3oW0Z3ivXTwG7yjbE1auoto=
Subject: Re: [PATCH] xenstored: close socket connections on error
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
 <20210203165421.1550-2-bouyer@netbsd.org>
 <55faec4f-71e3-71c3-e251-74238bb74c11@suse.com>
 <20210204111613.GA2316@antioche.eu.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cda25726-9942-c0ca-f60f-65681003a4fc@suse.com>
Date: Thu, 4 Feb 2021 12:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204111613.GA2316@antioche.eu.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q5g6R2O3CUHJDyU7n1zujOA8FN9FefEfl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q5g6R2O3CUHJDyU7n1zujOA8FN9FefEfl
Content-Type: multipart/mixed; boundary="ZVSgoY4FypoSX0G17qR17XHVoaAO8ydjw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <cda25726-9942-c0ca-f60f-65681003a4fc@suse.com>
Subject: Re: [PATCH] xenstored: close socket connections on error
References: <20210203165421.1550-1-bouyer@netbsd.org>
 <20210203165421.1550-2-bouyer@netbsd.org>
 <55faec4f-71e3-71c3-e251-74238bb74c11@suse.com>
 <20210204111613.GA2316@antioche.eu.org>
In-Reply-To: <20210204111613.GA2316@antioche.eu.org>

--ZVSgoY4FypoSX0G17qR17XHVoaAO8ydjw
Content-Type: multipart/mixed;
 boundary="------------E8E91AA4FA36ECA41F5927F3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8E91AA4FA36ECA41F5927F3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.02.21 12:16, Manuel Bouyer wrote:
> On Thu, Feb 04, 2021 at 12:11:02PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 03.02.21 17:54, Manuel Bouyer wrote:
>>> On error, don't keep socket connection in ignored state but close the=
m.
>>> When the remote end of a socket is closed, xenstored will flag it as =
an
>>> error and switch the connection to ignored. But on some OSes (e.g.
>>> NetBSD), poll(2) will return only POLLIN in this case, so sockets in =
ignored
>>> state will stay open forever in xenstored (and it will loop with CPU =
100%
>>> busy).
>>>
>>> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
>>> Fixes: d2fa370d3ef9cbe22d7256c608671cdcdf6e0083
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> thanks.
> I still don't know if I'm supposed to send a new version of the patch w=
ith
> these tags, even if the patch itself doesn't change, or if the commiter=

> will handle them ?
>=20

Will be done by the committer.


Juergen

--------------E8E91AA4FA36ECA41F5927F3
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

--------------E8E91AA4FA36ECA41F5927F3--

--ZVSgoY4FypoSX0G17qR17XHVoaAO8ydjw--

--Q5g6R2O3CUHJDyU7n1zujOA8FN9FefEfl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAb1+gFAwAAAAAACgkQsN6d1ii/Ey/k
Bwf/VcVYIIVN/EjD2lc0LTvtdJ202pz8ZXhPNHYNRAKKLkZfd/BPgsSISGuFKazsXublaplkPjGn
uqQEP73iYMuAVJocQkI80XQCEKHlFqOSQhgaG5J+BhHpcv54qqomm4aB9ahPf6sJcaP3nGO2H5h4
Cr6twE+wmXxaqaKj/VuBS0Y6yJN5+htZlQWHJZGVvOqs+3bfkgsm7hJ9W//3c2qL6/MKRe4D95+O
SV+PciXTfdcX73SEDovumVyiaVniwcp4gyyrKEC4qJV9s45ZiBr0WY+xREf3tV9bRROJvN/9IJ8n
1adWr0tPB+aFKXdAr92wgsAk1/sFxkElYyIF1oO9fw==
=uTiZ
-----END PGP SIGNATURE-----

--Q5g6R2O3CUHJDyU7n1zujOA8FN9FefEfl--

