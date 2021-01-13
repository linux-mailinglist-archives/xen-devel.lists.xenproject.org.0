Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01C2F4E3A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66569.118292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhpu-0005K6-1x; Wed, 13 Jan 2021 15:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66569.118292; Wed, 13 Jan 2021 15:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhpt-0005Jh-V3; Wed, 13 Jan 2021 15:13:25 +0000
Received: by outflank-mailman (input) for mailman id 66569;
 Wed, 13 Jan 2021 15:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kzhps-0005Jc-93
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:13:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30da9f79-3132-4494-91aa-2b31a8c5b4c1;
 Wed, 13 Jan 2021 15:13:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19E3CAB9F;
 Wed, 13 Jan 2021 15:13:22 +0000 (UTC)
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
X-Inumbo-ID: 30da9f79-3132-4494-91aa-2b31a8c5b4c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610550802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9d+ZgySw35zRe+7yysOVX9qvoDcewGdPr2r1XljXEM=;
	b=qcRK8dYaHLmgAmN4R3PiRxRx613QvykiyvU9izB7J4YluNxnvdMUMU5r/0m4QS5368Llez
	4OEPnhsrgDYcJrZ7TSzFK7e6gfoPxm+KivLfOWVw9+L1WVQk44CJR/WWkjB/lEH6O8/cSa
	+Fyx5vaCcjTEKag2lgFIKVzYF58Om84=
Subject: Re: [PATCH v4 0/5] Xen INTX/GSI event channel delivery fixes
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4d334457-e173-fa21-40f0-65f800a00cec@suse.com>
Date: Wed, 13 Jan 2021 16:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mJlt6gpWoFCXVc2TiXNc1ZJgRjSolZVu1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mJlt6gpWoFCXVc2TiXNc1ZJgRjSolZVu1
Content-Type: multipart/mixed; boundary="qnw3fRrwefQDn7hcLzAz4lwgiko0CBJfU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <4d334457-e173-fa21-40f0-65f800a00cec@suse.com>
Subject: Re: [PATCH v4 0/5] Xen INTX/GSI event channel delivery fixes
References: <20210113132606.422794-1-dwmw2@infradead.org>
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>

--qnw3fRrwefQDn7hcLzAz4lwgiko0CBJfU
Content-Type: multipart/mixed;
 boundary="------------B2E9B85B78AB02AF4D137FAE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B2E9B85B78AB02AF4D137FAE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.01.21 14:26, David Woodhouse wrote:
> Fix various breakages with INTX/GSI event channel interrupt delivery,
> and add a command line option to test it so that it hopefully doesn't
> get so broken again.
>=20
> Karim attempted to rip this out in 2017 but put it back because it's st=
ill
> necessary with older versions of Xen. This fixes it properly, and makes=
 it
> easier to test. cf. https://lkml.org/lkml/2017/4/10/266
>=20
> v2:
>   =E2=80=A2 Add no_vector_callback to Documentation/admin-guide/kernel-=
parameters.txt
>   =E2=80=A2 Further fixes to conditional smp_ops initialisation in xen_=
hvm_smp_init()
>=20
> v3:
>   =E2=80=A2 Rename test option to xen_no_vector_callback
>=20
> v4:
>   =E2=80=A2 Fix unconditional references to xen_have_vector_callback in=
 Arm build
>=20
> David Woodhouse (5):
>        xen: Fix event channel callback via INTX/GSI
>        xen: Set platform PCI device INTX affinity to CPU0
>        x86/xen: Add xen_no_vector_callback option to test PCI INTX deli=
very
>        x86/xen: Don't register Xen IPIs when they aren't going to be us=
ed
>        x86/xen: Fix xen_hvm_smp_init() when vector callback not availab=
le
>=20
>   Documentation/admin-guide/kernel-parameters.txt |  4 ++
>   arch/arm/xen/enlighten.c                        |  2 +-
>   arch/x86/xen/enlighten_hvm.c                    | 15 ++++-
>   arch/x86/xen/smp_hvm.c                          | 27 ++++++---
>   drivers/xen/events/events_base.c                | 10 ---
>   drivers/xen/platform-pci.c                      |  8 ++-
>   drivers/xen/xenbus/xenbus.h                     |  1 +
>   drivers/xen/xenbus/xenbus_comms.c               |  8 ---
>   drivers/xen/xenbus/xenbus_probe.c               | 81 ++++++++++++++++=
++++-----
>   include/xen/xenbus.h                            |  2 +-
>   10 files changed, 110 insertions(+), 48 deletions(-)

Series pushed to xen/tip.git for-linus-5.11


Juergen

--------------B2E9B85B78AB02AF4D137FAE
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

--------------B2E9B85B78AB02AF4D137FAE--

--qnw3fRrwefQDn7hcLzAz4lwgiko0CBJfU--

--mJlt6gpWoFCXVc2TiXNc1ZJgRjSolZVu1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl//DhEFAwAAAAAACgkQsN6d1ii/Ey9p
WwgAlTMmct28eaFjV1m+vMnaoAQii0tUreQZjaqtHnjO4TYE3+i2G11QmXi5xRMayqwOujJx7Hql
Nfrc5TH8YKJ1ynWLFKh6ycNTYfxUpXJQ3QpPXiEB8xz/GKQ0ylm+mrokTDiiRvd4HiSUbTpr8RTN
8NkGTOSk3se4o4gk4RARXcEVGe02SOY6/ZPd28ea6LIX0yO0h02U0heLIeTpc/UtqB0Yy+4HwlU1
10oy8vBEjX6Y1UWYBdOrI2tqSAArHHQfCh3IztgyRgrPjA5+feDMExYWoWsriVsCzHclGFNfCJ/l
u0Qb3dLaGRPN/p1C99Sd+UXTeO5zinVUXu84pe+x5g==
=fuyg
-----END PGP SIGNATURE-----

--mJlt6gpWoFCXVc2TiXNc1ZJgRjSolZVu1--

