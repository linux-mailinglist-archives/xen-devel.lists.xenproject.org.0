Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73C341BCF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 12:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99185.188443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDi6-0006KM-R9; Fri, 19 Mar 2021 11:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99185.188443; Fri, 19 Mar 2021 11:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDi6-0006Jx-NY; Fri, 19 Mar 2021 11:54:34 +0000
Received: by outflank-mailman (input) for mailman id 99185;
 Fri, 19 Mar 2021 11:54:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v8Ug=IR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lNDi5-0006Js-Mb
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:54:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64431ed-7641-48b2-b9fb-08362a73c38c;
 Fri, 19 Mar 2021 11:54:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CA8FAE57;
 Fri, 19 Mar 2021 11:54:32 +0000 (UTC)
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
X-Inumbo-ID: c64431ed-7641-48b2-b9fb-08362a73c38c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616154872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qnd4Cx4qQlj+LFhUs5wkCqitPC9lJA+Npc4JlGDp96c=;
	b=uhr+Aw2Jcx/DalICXmHwXYnbP/I1L2BbkPjUsy9vmmObmLZAcNvo4E9pizOEsUTngBiZ0I
	WDesvwdR5YBrJ/cKbS7g+PF3LPn7Ejz667XX/uXWFOinZEeyeIksBEyxDbIQ2vHx2FdIPU
	ZnA3GkDd5I55bzUmkYK9YJ3/df9SoUU=
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
Date: Fri, 19 Mar 2021 12:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8dGMO0sRxtkG8JlWUotK7B9NCRR011xB9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8dGMO0sRxtkG8JlWUotK7B9NCRR011xB9
Content-Type: multipart/mixed; boundary="6BcT3tUMT26vE6UdZBlOmYuxzLggm1Aa3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>
Message-ID: <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
In-Reply-To: <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>

--6BcT3tUMT26vE6UdZBlOmYuxzLggm1Aa3
Content-Type: multipart/mixed;
 boundary="------------ED7F01860E129EA63C3CB1BE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ED7F01860E129EA63C3CB1BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.03.21 12:50, Luca Fancellu wrote:
> Hi Juergen,
>=20
> Could you confirm that back porting this two serie to the linux kernel =
5.10:
>=20
> https://patchwork.kernel.org/project/xen-devel/cover/20201210192536.118=
432146@linutronix.de/

I don't see why this one would be needed?

> https://patchwork.kernel.org/project/xen-devel/cover/20210306161833.455=
2-1-jgross@suse.com/

This is already part of 5.10.24.


Juergen

--------------ED7F01860E129EA63C3CB1BE
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

--------------ED7F01860E129EA63C3CB1BE--

--6BcT3tUMT26vE6UdZBlOmYuxzLggm1Aa3--

--8dGMO0sRxtkG8JlWUotK7B9NCRR011xB9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBUkPcFAwAAAAAACgkQsN6d1ii/Ey8O
bQf9Gm5xmbToc27qsLpCaX+gfrUkpmWxBfYrUymdZfuldhNImnHouT0kmR3qtSrul6QAVyjJJZuG
JawOnIkrGJ1tDeSHD77q1FfQT5AYZa6EVd08YlD5NHXmZRLM8ox/boiAa4IMGmiKg6lL4f+VvmW4
RIIaG0r4B2AMAEzcAqpZuaJZDdkm+NJYSCzA2H5WSyN0IJh1BCnJBZXG+T+Ax1AmeDd+K44k4aCN
DDoicbZmWREkJ/mwih4RqvTT25S7RqLx6Vf03wMhlfDD9evUyorCH/ioqLrRl2Ye3GvBjJxgN0f1
yYjvVbYe4TPTm7xyzCY3YgW/5h/5tjOyRjO3wWb6aw==
=rVQH
-----END PGP SIGNATURE-----

--8dGMO0sRxtkG8JlWUotK7B9NCRR011xB9--

