Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74335B296
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 11:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108462.207053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVWDy-0007xz-Qa; Sun, 11 Apr 2021 09:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108462.207053; Sun, 11 Apr 2021 09:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVWDy-0007xa-NM; Sun, 11 Apr 2021 09:17:46 +0000
Received: by outflank-mailman (input) for mailman id 108462;
 Sun, 11 Apr 2021 09:17:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cnp7=JI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lVWDx-0007xH-G6
 for xen-devel@lists.xenproject.org; Sun, 11 Apr 2021 09:17:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8e70298-4031-4f8a-8956-f564ea989275;
 Sun, 11 Apr 2021 09:17:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D9B9AFF2;
 Sun, 11 Apr 2021 09:17:39 +0000 (UTC)
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
X-Inumbo-ID: f8e70298-4031-4f8a-8956-f564ea989275
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618132659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6qKTX4U+P8eIBSCQ9/a38BaJ+KdtHlxjPKsP0Nitt0=;
	b=OfcsV+Li0qzcaUTHbRj/T+EjeE/vmPx9zGsdZ7m5VzwxXFSVEWuptwmCuUR93/OjGwlNUq
	TBZfdfFQ8OLTZSvJqWj9Q5npIrTD5V07fxEWAj3XK0MidxIPdcN0orHZgXDn/1l0Jfva0E
	E7VioFly0+cZQFPxiszUE00CWmSKrG4=
To: Henrik Riomar <rio@riomar.se>, xen-devel@lists.xenproject.org
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
 <215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
 <20210411091734.09ef653bf97aa954fecac079@riomar.se>
From: Juergen Gross <jgross@suse.com>
Subject: Re: xenstore utils dropped support for -s in 4.15
Message-ID: <6340da5e-a604-1ca3-4d89-0319e6ad12bc@suse.com>
Date: Sun, 11 Apr 2021 11:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210411091734.09ef653bf97aa954fecac079@riomar.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RBVSZ9FOou4IG8EHNk4ao9PbbOFcNALsr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RBVSZ9FOou4IG8EHNk4ao9PbbOFcNALsr
Content-Type: multipart/mixed; boundary="rt6Q2NZr27bAseCrqP4moGCyEt0xZwtwn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henrik Riomar <rio@riomar.se>, xen-devel@lists.xenproject.org
Message-ID: <6340da5e-a604-1ca3-4d89-0319e6ad12bc@suse.com>
Subject: Re: xenstore utils dropped support for -s in 4.15
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
 <215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
 <20210411091734.09ef653bf97aa954fecac079@riomar.se>
In-Reply-To: <20210411091734.09ef653bf97aa954fecac079@riomar.se>

--rt6Q2NZr27bAseCrqP4moGCyEt0xZwtwn
Content-Type: multipart/mixed;
 boundary="------------523A5D97509BF6EA1BFB34FE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------523A5D97509BF6EA1BFB34FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.04.21 09:17, Henrik Riomar wrote:
> On Sun, 11 Apr 2021 07:34:16 +0200
> Juergen Gross <jgross@suse.com> wrote:
>=20
>> On 11.04.21 00:02, Henrik Riomar wrote:
>>> Hi,
>>>
>>> In Alpine and Debian (probably elsewhere as well), the -s flag remove=
d in these two commits:
>>>    * https://github.com/xen-project/xen/commit/fa06cb8c38832aafe597d7=
19040ba1d216e367b8
>>>    * https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036=
ec2862a4b4bd34ea4f
>>> is actually used in the init scripts.
>=20
>>> Reverting the two commits mentioned above restores a booting system.
>>>
>>> The -s flag was introduced in 2005 or so, so I guess you can say that=
 dropping it should
>>> at least be mentioned in the release notices, and an alternative be d=
escribed, or
>>> -s functionally should be brought back.
>>
>> The -s served exactly no purpose.
>=20
> yes its used by dists to check that the socket is actually accessible (=
without falling back to
> direct access to /dev/xen/xenbus).

There are Xen configurations where the socket is never accessible,
as it is not existing.

>> It was meant to force socket usage. A socket will be used anyway in
>> case xenstored is running in dom0, so specifying -s won't change
>> anything in this case.
>=20
> yes reverting the to commits above and using -s, brings back the origin=
al behavior, returning
> with failure if the socket is not there.

And returning failure when Xenstore is running fine, but not in dom0.

> There are two issues here I think:
>   1. dists actually use -s to check if the daemon is up (and been doing=
 this for a long time)

This should be changed, as it is based on wrong assumptions.

>   2. Reads of /dev/xen/xenbus (via xenstore-read -s /), blocks for ever=
 in 4.15

So you are basically saying that you'd like to have a test "is Xenstore
running", and this test should work with the "-s" flag.

I can look into that, but reverting the "access via socket" removal flag
is not the way to go.


Juergen

--------------523A5D97509BF6EA1BFB34FE
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

--------------523A5D97509BF6EA1BFB34FE--

--rt6Q2NZr27bAseCrqP4moGCyEt0xZwtwn--

--RBVSZ9FOou4IG8EHNk4ao9PbbOFcNALsr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmByvrIFAwAAAAAACgkQsN6d1ii/Ey+7
fQf/bI9jbWeY6sR0K3iTTFZjUdwQje4z1bTr5N8Kxx0/pdCBPS1qPO6NAys4P3235AyQuJlP/MeK
x1qhcIqnfEBsa4Obb/TXjiA3RNU20Xdn29pwmNUmij4j7kPpxfLwo5nLMPUu3cUvUNonjK4cFPZ7
9WzPUbDSHEgoQAjO/4nNo///zo30pMwgW5Vn9vUCQIbdOoyz9YzGEEVvS05zzzm08DZ8qdpGkOEe
KcQKA2HMbDfJe5ZLTnuMuaxqK48l6ICmON5/8TRmdraH/wtk36h7u9dC6gVoLMDbCRig10EPmjKH
ZnR0/RukP4f/6SzbdiTgpqalbXJ3urM/SHuNKh7E7g==
=QkWE
-----END PGP SIGNATURE-----

--RBVSZ9FOou4IG8EHNk4ao9PbbOFcNALsr--

