Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39C2FD2F5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71467.128006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ElF-0007ya-5h; Wed, 20 Jan 2021 14:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71467.128006; Wed, 20 Jan 2021 14:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ElF-0007yA-1C; Wed, 20 Jan 2021 14:47:05 +0000
Received: by outflank-mailman (input) for mailman id 71467;
 Wed, 20 Jan 2021 14:47:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2ElD-0007y4-HW
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:47:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7303a48-61a7-41ee-9eb9-4e4d4af98e46;
 Wed, 20 Jan 2021 14:47:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA113AB7F;
 Wed, 20 Jan 2021 14:47:00 +0000 (UTC)
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
X-Inumbo-ID: a7303a48-61a7-41ee-9eb9-4e4d4af98e46
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611154020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ALm1rWUPHzxBKX9KvtDHxUruV62uT8MccjiIJfS1KXo=;
	b=jcgoHd1Ymt3SH3P9KlBF/5C065pKEijyCZJZr5JiAKBbrZQ3VUmIF60jBdTXH/dbEHbnbd
	e/7yPqNLo8w9FyiSrURgggcMD7dSm07LCcxJGkk61QBeq9pJmM+rbxrMTLTGzOXnIRNnCe
	52MsbCuoNbzZeolgAOyut01xQwRARsc=
Subject: Re: [PATCH] x86/xen: Fix compilation error due to missing nopvspin
 declaration
To: Leon Romanovsky <leon@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210120144303.501486-1-leon@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <255ed6ed-fad1-dbe1-6d82-73c6a78701cf@suse.com>
Date: Wed, 20 Jan 2021 15:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120144303.501486-1-leon@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="n6lyIbOohlFkXATwmIz9ZffyFuB1h1xET"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n6lyIbOohlFkXATwmIz9ZffyFuB1h1xET
Content-Type: multipart/mixed; boundary="fdkFy9Cq9u9SEOdJ9t8sML9EEA8mFWulU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Leon Romanovsky <leon@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Message-ID: <255ed6ed-fad1-dbe1-6d82-73c6a78701cf@suse.com>
Subject: Re: [PATCH] x86/xen: Fix compilation error due to missing nopvspin
 declaration
References: <20210120144303.501486-1-leon@kernel.org>
In-Reply-To: <20210120144303.501486-1-leon@kernel.org>

--fdkFy9Cq9u9SEOdJ9t8sML9EEA8mFWulU
Content-Type: multipart/mixed;
 boundary="------------FB25936C18153C9C13C17F8B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FB25936C18153C9C13C17F8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.01.21 15:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>=20
>   arch/x86/xen/smp_hvm.c: In function 'xen_hvm_smp_init':
>   arch/x86/xen/smp_hvm.c:77:3: error: 'nopvspin' undeclared (first use =
in this function)
>      nopvspin =3D true;
>      ^~~~~~~~
>   arch/x86/xen/smp_hvm.c:77:3: note: each undeclared identifier is repo=
rted only once for each function it appears in
>   make[4]: *** [scripts/Makefile.build:279: arch/x86/xen/smp_hvm.o] Err=
or 1
>   make[3]: *** [scripts/Makefile.build:496: arch/x86/xen] Error 2
>   make[3]: *** Waiting for unfinished jobs....
>   make[2]: *** [Makefile:1805: arch/x86] Error 2
>   make[2]: *** Waiting for unfinished jobs....
>=20
> Fixes: 3d7746bea925 ("x86/xen: Fix xen_hvm_smp_init() when vector callb=
ack not available")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

There is already a fix queued in the xen tree.


Juergen

--------------FB25936C18153C9C13C17F8B
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

--------------FB25936C18153C9C13C17F8B--

--fdkFy9Cq9u9SEOdJ9t8sML9EEA8mFWulU--

--n6lyIbOohlFkXATwmIz9ZffyFuB1h1xET
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAIQmQFAwAAAAAACgkQsN6d1ii/Ey85
cQf/YXSHZhHRzIPFSA96HJFkrE7BWZOJMgTtr5VUQvYGJibwH5NPBawZtZh8sdSvFp4I4/15kRBZ
ysOFmVbsZHhlmh6YEuN7uJvDjyTNxhXH7+mVVaGOcJYi3IRtxCdISyFruHL+cbCZ/Xr00sRc0IrW
zTb3hw9zt89cwAL6QshQww88Eg7GffRgdmo+yA88otmRfkk4WrcHvq/V5gvlWIb2bturhT+ndguz
sPvPRsQiFBQ0D68vRuY+KWjxvREPmdwGql9y4osyF/FZ/nfKbwRsivUPC9KHAakxfJEotgOBUyAt
1O0UgUFIwet4zrUceIQbwehjHq0YQ1poLfqGjmRYMA==
=q317
-----END PGP SIGNATURE-----

--n6lyIbOohlFkXATwmIz9ZffyFuB1h1xET--

