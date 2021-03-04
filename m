Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E45B32CFFE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 10:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93077.175697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkaT-0000Yz-1O; Thu, 04 Mar 2021 09:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93077.175697; Thu, 04 Mar 2021 09:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkaS-0000YY-Ta; Thu, 04 Mar 2021 09:48:04 +0000
Received: by outflank-mailman (input) for mailman id 93077;
 Thu, 04 Mar 2021 09:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljEZ=IC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lHkaR-0000YT-H7
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 09:48:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09273a78-555a-4923-a1f1-a682da1f2acc;
 Thu, 04 Mar 2021 09:48:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A19CAEAC;
 Thu,  4 Mar 2021 09:48:01 +0000 (UTC)
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
X-Inumbo-ID: 09273a78-555a-4923-a1f1-a682da1f2acc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614851281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hNCliMiWjuNKLe9+7OmYrOs8H3BaU4HXm8Cy/g03jRU=;
	b=jlZ2vZzNQux1EsaezpTcAcZTem7LhovRaMRS+mbFaKgo2MVcbuS4wMCOpXuNyXYD11Gw16
	On7hTlwcHJ+Gu2bqhwUG6hubOI/vxExO5zq/gnlToky9g5benHXZxq5u3jaOJFkEszbrke
	1JyxGrtX0gTkKDWPPoCtJmVguNUMY7c=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <20210303170526.15903-1-julien@xen.org>
 <9f81d0c8-1ec8-7cd0-d943-fd31bc86de13@suse.com>
 <6c2f8459-b109-9a16-79c1-ab92969c4ece@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long
 transaction
Message-ID: <78a79740-925e-559c-f5ff-b365cc1c2732@suse.com>
Date: Thu, 4 Mar 2021 10:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6c2f8459-b109-9a16-79c1-ab92969c4ece@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4FJtJm7VioPd3KrKlZYUOoK1hlasfX5jH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4FJtJm7VioPd3KrKlZYUOoK1hlasfX5jH
Content-Type: multipart/mixed; boundary="UOnplTyCZImNu9TEhUGHVUFLN6LLbxJVb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
Message-ID: <78a79740-925e-559c-f5ff-b365cc1c2732@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long
 transaction
References: <20210303170526.15903-1-julien@xen.org>
 <9f81d0c8-1ec8-7cd0-d943-fd31bc86de13@suse.com>
 <6c2f8459-b109-9a16-79c1-ab92969c4ece@xen.org>
In-Reply-To: <6c2f8459-b109-9a16-79c1-ab92969c4ece@xen.org>

--UOnplTyCZImNu9TEhUGHVUFLN6LLbxJVb
Content-Type: multipart/mixed;
 boundary="------------308BB69F3F64F76DD9E12309"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------308BB69F3F64F76DD9E12309
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.03.21 10:39, Julien Grall wrote:
>=20
>=20
> On 04/03/2021 09:00, J=C3=BCrgen Gro=C3=9F wrote:
>> On 03.03.21 18:05, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> As XenStored is single-threaded, conn->ta_start_time will always be
>>> smaller than now. As we substract the latter from the former, it mean=
s
>>> a transaction will never be considered long running.
>>>
>>> Invert the two operands of the substraction in both lu_reject_reason(=
)
>>> and lu_check_allowed(). In addition to that, the former also needs to=

>>> check that conn->ta_start_time is not 0 (i.e the transaction is not
>>> active).
>>>
>>> Take the opportunity to document the return condition of
>>> lu_check_allowed().
>>>
>>> Fixes: e04e53a5be20 ("tools/xenstore: allow live update only with no =

>>> transaction active")
>>> Reported-by: Bjoern Doebel <doebel@amazon.de>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>>>
>>> ---
>>>
>>> I am a bit puzzled on how -F is implemented. From my understanding we=

>>> will force LiveUpdate when one of the following conditions is met:
>>> =C2=A0=C2=A0 1) All the active transactions are long running
>>> =C2=A0=C2=A0 2) If we didn't manage to LiveUpdate after N sec
>>>
>>> It is not quite clear why we need the both as 2) would indirectly cov=
er
>>> 1). However 2) is probably unsafe as we may reset transactions for
>>> "well-behaving" guest.
>>>
>>> So I am thinking to send a patch to drop 2). Any opinions?
>>
>> This will enable two guests working together to block LU by using
>> overlapping transactions:
>>
>> Guest 1: ----- ----- -----=C2=A0 ...
>> Guest 2: -- ----- ----- --- ... >
>> There is always a transaction active, but none is regarded to be
>> long running.
>=20
> Right, how do you know whether two guests are working together?

We can't know that. And this is the reason why you have to use the -F
option to force a LU.

> I understand that "-F" means that things could break... However, I am=20
> not entirely sure who can realistically use this option without risking=
=20
> breaking other guests. For instance, there might be a 3rd guest that ha=
s=20
> an active transaction and not cooperating with the first two.

Yes. OTOH the chances are rather low that multiple LU attempts are
failing due to transactions being active all the time.

> Rather than forcing in this case, how about we quiesce the connection i=
f=20
> it starts a transaction when LiveUpdate is pending?

Yes, this should work, too.


Juergen

--------------308BB69F3F64F76DD9E12309
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

--------------308BB69F3F64F76DD9E12309--

--UOnplTyCZImNu9TEhUGHVUFLN6LLbxJVb--

--4FJtJm7VioPd3KrKlZYUOoK1hlasfX5jH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBArNAFAwAAAAAACgkQsN6d1ii/Ey+j
3Af/UXMe6UpNATWuh0q02Cek7CUUtyc6h13JPdWQnrYAdhELLFXYQ0XgLsik72EPIrsahrfsfxtY
uF3beMBXuEE0bynxDY8fv5n7JyL4yMAyPdJ+ZZWXsc18HAqaO2JI4za6YqqhLogRQWc6FPcFGkDW
/yVxYsExwTxutViEbsQgRU0FbtMqEjdKQ8qTm1WzzilE+hmp+hCrAyKpZqzHJDoIFz7Abe+sxgKy
opxK70CF9ISVs/tHbUCkZUaCIXbbJGeEakEcmUoZCaVLLtkZQaptkky7o85ZPMI68VBa+siA+INn
toERcl5ehCZGyYdg7AaR6/VrIkU5MFib0EU6aZgBqA==
=GABA
-----END PGP SIGNATURE-----

--4FJtJm7VioPd3KrKlZYUOoK1hlasfX5jH--

