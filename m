Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228AA318572
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 07:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83768.156695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA5tD-0007XN-Nd; Thu, 11 Feb 2021 06:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83768.156695; Thu, 11 Feb 2021 06:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA5tD-0007Wy-KH; Thu, 11 Feb 2021 06:55:47 +0000
Received: by outflank-mailman (input) for mailman id 83768;
 Thu, 11 Feb 2021 06:55:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA5tC-0007Wp-EA
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 06:55:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8511911c-846d-495b-a1f6-fbdd7680f1f9;
 Thu, 11 Feb 2021 06:55:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3D28AC69;
 Thu, 11 Feb 2021 06:55:43 +0000 (UTC)
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
X-Inumbo-ID: 8511911c-846d-495b-a1f6-fbdd7680f1f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613026544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MG2qQKwGA2uwRNd91SQJ/4zh6icXa16Zvxps844WLyY=;
	b=o6p/9ZxnNkhqoyKI3pkOCczBjjBBKV7qZRZR95iTrfxykBKKhe2Qn4Yy1GgTJcDT3sdOmR
	n/5NkhGfdA23FkvLGB4SNaPYN6KIZS0soJtJdfrzjkEJ9DLeZtXAIO6aYMBmuu5fQADFfg
	T0r7TyvFXHK083w4dxDUU9f5ItH/6oI=
Subject: Re: [PATCH] arm/xen: Don't probe xenbus as part of an early initcall
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 dwmw@amazon.co.uk
References: <20210210170654.5377-1-julien@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <06a4feb3-a29e-221d-cdb6-68b9c453b2a4@suse.com>
Date: Thu, 11 Feb 2021 07:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210170654.5377-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nnFzFztgxzAPbRsxw8PBIWzXP1DcgeEzh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nnFzFztgxzAPbRsxw8PBIWzXP1DcgeEzh
Content-Type: multipart/mixed; boundary="A8lgVItKpCdvz0ARwxIlEoRtrBIMamMIS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 dwmw@amazon.co.uk
Message-ID: <06a4feb3-a29e-221d-cdb6-68b9c453b2a4@suse.com>
Subject: Re: [PATCH] arm/xen: Don't probe xenbus as part of an early initcall
References: <20210210170654.5377-1-julien@xen.org>
In-Reply-To: <20210210170654.5377-1-julien@xen.org>

--A8lgVItKpCdvz0ARwxIlEoRtrBIMamMIS
Content-Type: multipart/mixed;
 boundary="------------95F5BB8C01B298769DA42A6A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------95F5BB8C01B298769DA42A6A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.02.21 18:06, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> After Commit 3499ba8198cad ("xen: Fix event channel callback via
> INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
> recent to a guest hang during boot.
>=20
> If there hang wasn't there, we would have ended up to call
> xenbus_probe() twice (the second time is in xenbus_probe_initcall()).
>=20
> We don't need to initialize xenbus_probe() early for Arm guest.
> Therefore, the call in xen_guest_init() is now removed.
>=20
> After this change, there is no more external caller for xenbus_probe().=

> So the function is turned to a static one. Interestingly there were two=

> prototypes for it.
>=20
> Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
> Reported-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Pushed to xen/tip.git for-linus-5.11


Juergen

--------------95F5BB8C01B298769DA42A6A
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

--------------95F5BB8C01B298769DA42A6A--

--A8lgVItKpCdvz0ARwxIlEoRtrBIMamMIS--

--nnFzFztgxzAPbRsxw8PBIWzXP1DcgeEzh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAk1O4FAwAAAAAACgkQsN6d1ii/Ey8J
IQf+PSQEDt8aCr21sa7tvlRw1eioS5L/bTXlTHmERWCqh1+F3zTIc11A3mGG+TWLR2qjBzdH/qhw
z1uATDVZc3onJB8JiYfY1PWZXKyc/aUdWir687Aoxf9m2fyBM6+vm1s5+h6IhPwS8lSfYqpVzjYB
utWheEjj7FJdfqrHlnKsKfiAYpVuWZwwZZOtQ/3rRISXXQFtmoPr/rkPWFsc8BwraBG1kkrPcbOH
xKOIRkpPxG3f9GnYjuYDRU/n4sVraUJ8AznOT9rPwBWVF0lLxUrUIQOoKO1MN8Wh/KXSiU18Osk4
4xoX7BHd8KR093breswelP6lE30hWD1b1Kd2Dc1Wqg==
=7ZRQ
-----END PGP SIGNATURE-----

--nnFzFztgxzAPbRsxw8PBIWzXP1DcgeEzh--

