Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189372F4F30
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66603.118364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziQM-0001IZ-Fi; Wed, 13 Jan 2021 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66603.118364; Wed, 13 Jan 2021 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziQM-0001IA-CA; Wed, 13 Jan 2021 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 66603;
 Wed, 13 Jan 2021 15:51:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kziQK-0001I5-71
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:51:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8054db8f-942b-4778-89ca-c0eae36c8b92;
 Wed, 13 Jan 2021 15:51:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 781B7B153;
 Wed, 13 Jan 2021 15:51:02 +0000 (UTC)
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
X-Inumbo-ID: 8054db8f-942b-4778-89ca-c0eae36c8b92
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610553062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DDnBUHYMqtQOM7dD6VoZy66/FtgI6h8K0W3irmtJDes=;
	b=Vne5iAFh3d7xuKJpe+RX33hSEvaXbriBM0Xr4Qmsf3FGNFpy1eijNPZs/KT9QGs3MtR+FK
	AN8L5fJSBsakGdAwcvzk5aINvjRNkuIHjXpz7riqFRQ90i2bjhL8ndwDVkRglqr/BtauQk
	nqhvw0P2PzvKAZAxeGPqyJVJ9/QBktQ=
Subject: Re: Proposal - lightweight auto test binaries
To: Andrew Cooper <amc96@cam.ac.uk>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
 <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8d0b0db4-a9ee-34b0-f82b-5c6167d2be16@suse.com>
Date: Wed, 13 Jan 2021 16:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zR5x679xy98th86MnQXFiABGukqDLQB9l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zR5x679xy98th86MnQXFiABGukqDLQB9l
Content-Type: multipart/mixed; boundary="xYUy3OPNSKiIpaMWVJD9zRCC8mC8y9rQF";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <amc96@cam.ac.uk>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <8d0b0db4-a9ee-34b0-f82b-5c6167d2be16@suse.com>
Subject: Re: Proposal - lightweight auto test binaries
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
 <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
In-Reply-To: <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>

--xYUy3OPNSKiIpaMWVJD9zRCC8mC8y9rQF
Content-Type: multipart/mixed;
 boundary="------------5ACC643A228D379EF01273D3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5ACC643A228D379EF01273D3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.01.21 16:45, Andrew Cooper wrote:
> I reckon for a first stab, trying to convert xenstore and cpu-policy to=

> the "simple" API would be a good start.=C2=A0 They both have trivial bu=
ild
> requirements, and would be trivial to convert to an exit code based
> protocol, which would get us content to run for both x86 and ARM in OSS=
Test.
>=20
> CC Juergen, who is the owner of the xenstore test.=C2=A0 Are you happy =
with
> this being tweaked in the hope that it gets run automatically by OSSTes=
t?

Sure!

I've written those tests for validating my rework of the C-xenstored
transaction handling, but including them in OSSTest is much appreciated.


Juergen

--------------5ACC643A228D379EF01273D3
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

--------------5ACC643A228D379EF01273D3--

--xYUy3OPNSKiIpaMWVJD9zRCC8mC8y9rQF--

--zR5x679xy98th86MnQXFiABGukqDLQB9l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl//FuUFAwAAAAAACgkQsN6d1ii/Ey8S
Fwf/V+TLcylLan+O5dw8I38/HHsOCSAxTlbOTfu1h0LHMMV5vHc3uFRijBNZ5J4NbTabsAv52F6J
YJyiJavLm6t7vyuMbl6f5BncCd8MrOdZ4Wg5hhB4AqqKypgIr1EBH7rhS5idIUW10N1eVMKdXiZv
2OxjT1adFsXP6tI+y3Cqe3AXHinjrFu5TjUioAiRrzt3NcAsxdrksXwNhWOibbotcoDFSEJ67Ob9
t9AlWQqn98dXsKybtHVZrkpzKNt9yitzmlrpzHaMRR3HZHMtw8DR/VQmMvwSZwCszTkEpanT+FI1
tEX10S6MTsVp1uPv35A5oWgQfzaRLtAJRGyOZ2G1Hg==
=D8y/
-----END PGP SIGNATURE-----

--zR5x679xy98th86MnQXFiABGukqDLQB9l--

