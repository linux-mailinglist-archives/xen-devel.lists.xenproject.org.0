Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E83053BD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 07:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75761.136483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4elU-0005j8-SX; Wed, 27 Jan 2021 06:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75761.136483; Wed, 27 Jan 2021 06:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4elU-0005im-P2; Wed, 27 Jan 2021 06:57:20 +0000
Received: by outflank-mailman (input) for mailman id 75761;
 Wed, 27 Jan 2021 06:57:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFzC=G6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l4elT-0005ih-6e
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 06:57:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45f417ff-3b46-4fa4-a55c-128bdee270e1;
 Wed, 27 Jan 2021 06:57:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE0E7AF17;
 Wed, 27 Jan 2021 06:57:16 +0000 (UTC)
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
X-Inumbo-ID: 45f417ff-3b46-4fa4-a55c-128bdee270e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611730637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/1aOmrmjM/Fqv4xB4DGTQXPfg6j5QneRJaL5P34gvLE=;
	b=dk37rmAL3AyfjdA7CVzwNFGFSsM5NPUEstz4BO5XOMdnM51N8lhBQzxzAO9dLP/OCqscGb
	vb/2cvpbBGGbwBkqM8rNP92lyWT5UOfks2ZawAIa5oKXJeombaR4e3saHLLu+WX1QTMFBm
	NeJq4SnjoP6o2fwsnrl36V3HoR9VxSI=
Subject: Re: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
 <4d334457-e173-fa21-40f0-65f800a00cec@suse.com>
 <4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org>
 <da79f47d-de72-1c27-71e4-394b17577682@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d8f54f2e-b486-24af-30eb-a947afab9e82@suse.com>
Date: Wed, 27 Jan 2021 07:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <da79f47d-de72-1c27-71e4-394b17577682@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HQRHqGouWykYATc0DFr0Hw2jvrOAIqh3Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HQRHqGouWykYATc0DFr0Hw2jvrOAIqh3Y
Content-Type: multipart/mixed; boundary="0LjC0j1IHrP0ujk0fMdn43VNmzYaSeeXo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <d8f54f2e-b486-24af-30eb-a947afab9e82@suse.com>
Subject: Re: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
References: <20210113132606.422794-1-dwmw2@infradead.org>
 <4d334457-e173-fa21-40f0-65f800a00cec@suse.com>
 <4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org>
 <da79f47d-de72-1c27-71e4-394b17577682@oracle.com>
In-Reply-To: <da79f47d-de72-1c27-71e4-394b17577682@oracle.com>

--0LjC0j1IHrP0ujk0fMdn43VNmzYaSeeXo
Content-Type: multipart/mixed;
 boundary="------------DA3AF1B083172D1D16A5FE5E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DA3AF1B083172D1D16A5FE5E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.01.21 22:36, Boris Ostrovsky wrote:
>=20
>=20
> On 1/26/21 12:01 PM, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI"=
)
>> I reworked the triggering of xenbus_probe().
>>
>> I tried to simplify things by taking out the workqueue based startup
>> triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
>> handler.
>>
>> I missed the fact that in the XS_LOCAL case (Dom0 starting its own
>> xenstored or xenstore-stubdom, which happens after the kernel is boote=
d
>> completely), that IRQ-based trigger is still actually needed.
>>
>> So... put it back, except more cleanly. By just spawning a xenbus_prob=
e
>> thread which waits on xb_waitq and runs the probe the first time it
>> gets woken, just as the workqueue-based hack did.
>>
>> This is actually a nicer approach for *all* the back ends with differe=
nt
>> interrupt methods, and we can switch them all over to that without the=

>> complex conditions for when to trigger it. But not in -rc6. This is
>> the minimal fix for the regression, although it's a step in the right
>> direction instead of doing a partial revert and actually putting the
>> workqueue back. It's also simpler than the workqueue.
>=20
>=20
> Wouldn't the minimal fix be to restore wake_waiting() to its previous
>=20
>          if (unlikely(xenstored_ready =3D=3D 0)) {
>                  xenstored_ready =3D 1;
>                  schedule_work(&probe_work);
>          }
>=20
> (And to avoid changing xenbus_probe()'s signature just create a wrapper=
)

David and I had a longer chat on IRC regarding this fix.

The long term idea is to have just his current thread based variant
for all cases calling xenbus_probe() (so no call of xenbus_probe() at
any other place).

We agreed that this approach would be too risky now, but we wanted to
go in the right direction with the current fix. This is the outcome.


Juergen

--------------DA3AF1B083172D1D16A5FE5E
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

--------------DA3AF1B083172D1D16A5FE5E--

--0LjC0j1IHrP0ujk0fMdn43VNmzYaSeeXo--

--HQRHqGouWykYATc0DFr0Hw2jvrOAIqh3Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmARDswFAwAAAAAACgkQsN6d1ii/Ey/8
fggAkX4btDEcHQzr/f/6t68lulbebIPDp8HLqf9MLZPfjrbZSrAQdN48iuMCXL/S5AjISOkqEZRE
L2izrgFQbkF9kjnJNHSa0iIcrNUzJapH84Ka7nnOWE5nEXzjI+q/iXI/hY4BhfL/sw5FuphzCK+T
ZXKavuhsqyIaaBwftRFUn0njyfLV2LFoVChv62/vv8qRKjKJu7fxe8icOXppyjU87O63k7DwCztg
P616yBArXYPyzSFK+npH1LxEBZJ6Da+lVx3uvExVTa70ZdwGSb12g98MxViDdxJ9Xy69zs3+NmZf
hpTQsJu42mUL6myVTwGRnkLpB/Kzh0/eUAKQe6WgRg==
=WQMB
-----END PGP SIGNATURE-----

--HQRHqGouWykYATc0DFr0Hw2jvrOAIqh3Y--

