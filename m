Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB02D951B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52031.91042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok6D-0004r0-Ge; Mon, 14 Dec 2020 09:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52031.91042; Mon, 14 Dec 2020 09:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok6D-0004qb-Ca; Mon, 14 Dec 2020 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 52031;
 Mon, 14 Dec 2020 09:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kok6B-0004qT-Qm
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:24:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ac5c23c-1502-4ff5-b335-ede851a614d5;
 Mon, 14 Dec 2020 09:24:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10251AE87;
 Mon, 14 Dec 2020 09:24:54 +0000 (UTC)
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
X-Inumbo-ID: 7ac5c23c-1502-4ff5-b335-ede851a614d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607937894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ADO6RmQyG6N+pY5hxnecOdwh6Mv2lf30QT5YbGl/t0=;
	b=RuGVJ3vptgkxFmvtZqrpSty5c5CtYTLErmK6V+pVdiYdyrgFW2+8X5pAl3AkcY4i6Z/qzb
	jjIA8oH42SSlTxQ4GwEKtzZXQw488xK92ztuwwAai1xyuRUR7Rs2EUJsVueLQ9k5P3o78+
	Ap8R3BzKOJ4R+j41Xdrm5pq7KXpYePk=
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <74be05c2-375e-6b7e-ef87-31d4f7338a03@suse.com>
 <9a6a397d-2c4c-acdc-d3ff-b286e522c9bc@suse.com>
 <8c86ccf6-0384-f91f-1fd5-6a179158d91e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1935b802-e121-4678-4653-a5503def7f72@suse.com>
Date: Mon, 14 Dec 2020 10:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8c86ccf6-0384-f91f-1fd5-6a179158d91e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Dc9aT2nPf0PPwCxdP7D24kIN4iq2WLueu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Dc9aT2nPf0PPwCxdP7D24kIN4iq2WLueu
Content-Type: multipart/mixed; boundary="xmopCqjAWIlTx21Fxnnl8RDjI5Kw02Ea7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <1935b802-e121-4678-4653-a5503def7f72@suse.com>
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <74be05c2-375e-6b7e-ef87-31d4f7338a03@suse.com>
 <9a6a397d-2c4c-acdc-d3ff-b286e522c9bc@suse.com>
 <8c86ccf6-0384-f91f-1fd5-6a179158d91e@suse.com>
In-Reply-To: <8c86ccf6-0384-f91f-1fd5-6a179158d91e@suse.com>

--xmopCqjAWIlTx21Fxnnl8RDjI5Kw02Ea7
Content-Type: multipart/mixed;
 boundary="------------73D03E1E121A34B35F433949"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------73D03E1E121A34B35F433949
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.20 10:22, Jan Beulich wrote:
> On 14.12.2020 10:15, J=C3=BCrgen Gro=C3=9F wrote:
>> On 14.12.20 10:03, Jan Beulich wrote:
>>> On 14.12.2020 08:56, Juergen Gross wrote:
>>>> Add support to run a function in an exception handler for Arm. Do it=

>>>> the same way as on x86 via a bug_frame.
>>>>
>>>> Unfortunately inline assembly on Arm seems to be less capable than o=
n
>>>> x86, leading to functions called via run_in_exception_handler() havi=
ng
>>>> to be globally visible.
>>>
>>> Could you extend on this? I don't understand what the relevant
>>> difference is, from just looking at the changes.
>>
>> The problem seems to be that a static symbol referenced from the inlin=
e
>> asm seems not to silence the error that this static symbol isn't being=

>> used. On x86 the bug_frame is constructed using the %c modifier, which=

>> is not supported for Arm (at least gcc 7 used in my compile test
>> complained), but seems to be enough for gcc on x86 to not complain.
>=20
> But this isn't tied to %c not working on older gcc, is it? It looks
> instead to be tied to you not specifying the function pointer as an
> input in the asm(). The compiler would know the symbol is referenced
> even if the input wasn't used at all in any of the asm()'s operands
> (but of course it would be better to use the operand once you have
> it, if it can be used in some way despite %c not being possible to
> use).

Let me check that.


Juergen

--------------73D03E1E121A34B35F433949
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

--------------73D03E1E121A34B35F433949--

--xmopCqjAWIlTx21Fxnnl8RDjI5Kw02Ea7--

--Dc9aT2nPf0PPwCxdP7D24kIN4iq2WLueu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/XL2UFAwAAAAAACgkQsN6d1ii/Ey+d
vAgAh8gUaOf1hZRsAGxkRIQ9RC+p/NLWF1MFVSGc58GrLCBaCcAO3r79B8nZVSQEc/6chCEzqEAX
GQU4N0WyPbv0G/dAkaaKe24/2BJyHsBd9FAtu/UCrqWF/UZWbD2FjsRPwYHbqPqBg7ojiC7Ka91u
emauYOtiqJ8hOEfpZ9PBwWznpyqncIg91khG9z1rZsh01rwc5vKeC1el566iQo4/OSK3Nloldthe
wRaMOyiqySEKi5/KLiZymmt12aKvdCANiLmiulinaqRykOuNdgZnk/ztgjJk/UnDpCw5H0tPGSQh
LZaIyC/ORTHN+mT5TiahCRb0ASutadivZWHtlzaBmQ==
=lYV6
-----END PGP SIGNATURE-----

--Dc9aT2nPf0PPwCxdP7D24kIN4iq2WLueu--

