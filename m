Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DF34776E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100929.192611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1kj-0000On-My; Wed, 24 Mar 2021 11:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100929.192611; Wed, 24 Mar 2021 11:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1kj-0000OO-J0; Wed, 24 Mar 2021 11:32:45 +0000
Received: by outflank-mailman (input) for mailman id 100929;
 Wed, 24 Mar 2021 11:32:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyEQ=IW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lP1kh-0000OI-NO
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:32:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ba726a5-1290-42ca-a246-74719b2aaaa7;
 Wed, 24 Mar 2021 11:32:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DD92AD38;
 Wed, 24 Mar 2021 11:32:42 +0000 (UTC)
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
X-Inumbo-ID: 2ba726a5-1290-42ca-a246-74719b2aaaa7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616585562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPp9Q5DWrtC2aDxiHJOr40tP4y1H6Oj1MqHWCDZ3Ldk=;
	b=iGkI5RmgiKLbuRwEa0exi2ASgRwjP4CZ+YhvZWQaKP3C/gYEBU9bHQ6xZ7DZ/p178cJgoG
	Mq29FUPY/ior7FhEDN5QcXLR0FB4i7XDjnbV7IXVZHxGM5A1W4c02rjJQPepWLsCy4M9KA
	tDuWEzXjBo8mHmR9DfS5xzCfsTk/4AI=
Subject: Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210324072645.10596-1-jgross@suse.com>
 <24667.7211.431280.743192@mariner.uk.xensource.com>
 <b6e10cf8-5ea2-53c8-30ba-f617bdb96f81@suse.com>
 <24667.8900.993418.152255@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2ccb24a7-a927-cfe7-f102-b8ef02052522@suse.com>
Date: Wed, 24 Mar 2021 12:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24667.8900.993418.152255@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J7MMgfD5echwzdA6ES78JWiAyCKyvqs3u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J7MMgfD5echwzdA6ES78JWiAyCKyvqs3u
Content-Type: multipart/mixed; boundary="gjfW9Vut9XwlHaIsURM2sL7Ut1B8MV9Ag";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <2ccb24a7-a927-cfe7-f102-b8ef02052522@suse.com>
Subject: Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface
References: <20210324072645.10596-1-jgross@suse.com>
 <24667.7211.431280.743192@mariner.uk.xensource.com>
 <b6e10cf8-5ea2-53c8-30ba-f617bdb96f81@suse.com>
 <24667.8900.993418.152255@mariner.uk.xensource.com>
In-Reply-To: <24667.8900.993418.152255@mariner.uk.xensource.com>

--gjfW9Vut9XwlHaIsURM2sL7Ut1B8MV9Ag
Content-Type: multipart/mixed;
 boundary="------------BBE6C4F0BBA2788D920BABBE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BBE6C4F0BBA2788D920BABBE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.03.21 12:30, Ian Jackson wrote:
> J=C3=BCrgen Gro=C3=9F writes ("Re: [PATCH-for-4.15] tools/libs/store: c=
leanup libxenstore interface"):
>> On 24.03.21 12:02, Ian Jackson wrote:
>>> Is it possible to do sort this out in a more minimal way ?  Eg we
>>> could change the name to namespace it properly.  (I haven't looked at=

>>> the code in detail and am still rather under-caffeinated so maybe I a=
m
>>> talking nonsense here.)
>>
>> No nonsense. This would be the really minimum option (apart from doing=

>> nothing).
>>
>> I can setup the patch for that and keep the rest for 4.16 (which will
>> then probably need to bump the so version).
>=20
> Hmmm.  Maybe it would be less disruptive to punt the whole lot for
> xen-next.  That way we don't have a silent withdrawl in one release
> followed by a soname bump in the next.
>=20
> If you're keen to change this for 4.15, please feel free to show me
> what the patch looks like.  But I would be inclined to postpone this.

Minimal variant sent. I'm not keen to have that for 4.15, but the patch
was just ready. :-)

Juergen

--------------BBE6C4F0BBA2788D920BABBE
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

--------------BBE6C4F0BBA2788D920BABBE--

--gjfW9Vut9XwlHaIsURM2sL7Ut1B8MV9Ag--

--J7MMgfD5echwzdA6ES78JWiAyCKyvqs3u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBbI1kFAwAAAAAACgkQsN6d1ii/Ey8O
Hgf/RHTQWG3vjbwzG8uNNTUQIV0QO71ZGZ8Y8159WpCeawEDtOkzESISzeQiSmClrvAXVjWIo6Mr
/3EweTM+RwPVqYgoZSRZvjXgDUek91Q0T+dwOH3GhdggxTkb+5L3gnAVsHf4R+5HB6W1p6ZTPdQX
txe90ywhWgksQ06KqBmYMsqJoM2z5M1ToUtsltorvgtasFM2IVOH3av6R+2U8uBwJhPDddh/NnzD
e4IwZykTtn/XT2dUW2BQEIozjsyUX1DcQW7hbulzTH02xZRyW3r7aroFslT6thGxrEdqx4nxPjap
Js5O5E6sFxIHIzavVp2qyeQq7+UnVsKGu2EHJ+8ikQ==
=8gPu
-----END PGP SIGNATURE-----

--J7MMgfD5echwzdA6ES78JWiAyCKyvqs3u--

