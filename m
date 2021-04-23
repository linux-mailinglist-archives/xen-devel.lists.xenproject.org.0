Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A8368E66
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 10:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115949.221281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqol-0000f6-Ni; Fri, 23 Apr 2021 08:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115949.221281; Fri, 23 Apr 2021 08:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqol-0000ef-Il; Fri, 23 Apr 2021 08:05:39 +0000
Received: by outflank-mailman (input) for mailman id 115949;
 Fri, 23 Apr 2021 08:05:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwNy=JU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZqoj-0000e9-Pp
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 08:05:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8590789-caad-471b-9e61-efb3a5acab07;
 Fri, 23 Apr 2021 08:05:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F13AB080;
 Fri, 23 Apr 2021 08:05:35 +0000 (UTC)
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
X-Inumbo-ID: c8590789-caad-471b-9e61-efb3a5acab07
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619165135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EfBBQQctPna0dlqKuDq5uBTkMpfxT/mlGGC3KyebVT4=;
	b=TAIEFU5klJzwxgc3kY6CJAMLhbsFxeg/QD2VFyFfi6tS+zmupVxZJ1bxlfgP5Ccav5AOk8
	Ce87htVdXnE3CxS/rWxHxNrmGl7ayTnWDGk7XMv6OPGBM4aeGZeYCNuo1yntholBTWOSyC
	ReADnXbC/7+3DfKGHadifsYV6fapbfo=
Subject: Re: [PATCH] xen: Remove support for PV ACPI cpu/memory hotplug
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org
References: <1618336344-3162-1-git-send-email-boris.ostrovsky@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bc87249e-9ca7-8746-0acb-c74290a49910@suse.com>
Date: Fri, 23 Apr 2021 10:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1618336344-3162-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yG0mwjc9rgIW6S3MiUtiVtkkHx2HQ8IAr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yG0mwjc9rgIW6S3MiUtiVtkkHx2HQ8IAr
Content-Type: multipart/mixed; boundary="d4HwASjpKkwit4PlOUN3W8KDfy35cc1HZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <bc87249e-9ca7-8746-0acb-c74290a49910@suse.com>
Subject: Re: [PATCH] xen: Remove support for PV ACPI cpu/memory hotplug
References: <1618336344-3162-1-git-send-email-boris.ostrovsky@oracle.com>
In-Reply-To: <1618336344-3162-1-git-send-email-boris.ostrovsky@oracle.com>

--d4HwASjpKkwit4PlOUN3W8KDfy35cc1HZ
Content-Type: multipart/mixed;
 boundary="------------BD6622B2ED14218016AADC87"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BD6622B2ED14218016AADC87
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.04.21 19:52, Boris Ostrovsky wrote:
> Commit 76fc253723ad ("xen/acpi-stub: Disable it b/c the acpi_processor_=
add
> is no longer called.") declared as BROKEN support for Xen ACPI stub (wh=
ich
> is required for xen-acpi-{cpu|memory}-hotplug) and suggested that this
> is temporary and will be soon fixed. This was in March 2013.
>=20
> Further, commit cfafae940381 ("xen: rename dom0_op to platform_op")
> renamed an interface used by memory hotplug code without updating that
> code (as it was BROKEN and therefore not compiled). This was
> in November 2015 and has gone unnoticed for over 5 year.
>=20
> It is now clear that this code is of no interest to anyone and therefor=
e
> should be removed.
>=20
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Pushed to xen/tip.git for-linus-5.13


Juergen


--------------BD6622B2ED14218016AADC87
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

--------------BD6622B2ED14218016AADC87--

--d4HwASjpKkwit4PlOUN3W8KDfy35cc1HZ--

--yG0mwjc9rgIW6S3MiUtiVtkkHx2HQ8IAr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCCf84FAwAAAAAACgkQsN6d1ii/Ey/t
dQf+O3mDv5rAdo78PrFclGElyubJL6oAfCO5AnCluJCIg6MAa1QZa66gnRYfZwWPK5gah2oi07og
Q1RyWY9ZEY+NaK5q67cnpjuNbGwXEgRHzJL5XZ/Ap17UCTe0mYRY0zUIWXhJcntsw/QTIJk3TqoW
sKzpemMm62Ye+RpRYjDcBE7OA7a72En1jQZk2fGfiCK+PsARa02RvJ6N1joeLmQpaoapPUrXNWLG
bgkB+2OfF/gSDNJaquG4wQXRhxj/Hz3ex5MpDdyNGRGqAaEDsO5C0BI7pQ+0JcnsrlNwIupzCDzY
jSrDogDqLHOY69L2gLz641gfCqhL+/pR2jczaBjRHw==
=X13G
-----END PGP SIGNATURE-----

--yG0mwjc9rgIW6S3MiUtiVtkkHx2HQ8IAr--

