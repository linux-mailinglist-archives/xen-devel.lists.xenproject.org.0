Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C303130D9B0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 13:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80908.148385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HAZ-0007x0-PO; Wed, 03 Feb 2021 12:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80908.148385; Wed, 03 Feb 2021 12:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HAZ-0007wa-LO; Wed, 03 Feb 2021 12:22:03 +0000
Received: by outflank-mailman (input) for mailman id 80908;
 Wed, 03 Feb 2021 12:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7HAY-0007wV-Dn
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 12:22:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ab38da2-717b-4953-a11d-b19c97af2a39;
 Wed, 03 Feb 2021 12:22:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DFD9AEE7;
 Wed,  3 Feb 2021 12:22:00 +0000 (UTC)
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
X-Inumbo-ID: 9ab38da2-717b-4953-a11d-b19c97af2a39
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612354920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VwIUpkNamluGG5cDWQAEaHPOjzv1rFKNI2wjcey9h/4=;
	b=goN3IectAS6uBJjsTObaqIwS0berpLSGKYI6jkftPvsC39suT7xmldUXIkEKkovBtQ0ZZs
	urXZBOMb3N+nlXLNG70HqcYiDDSdQv8ceCnOXzoUtNloLlRsu6ELUUh6l7ezwQmQcM/iTb
	FnPeZU2ILrVGLaHld/5+519Ievsja54=
Subject: Re: xenstored file descriptor leak
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
Date: Wed, 3 Feb 2021 13:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203121738.GA2610@antioche.eu.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dE2Xx7OnGdgonja0yAECc1fMZyYikr0r8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dE2Xx7OnGdgonja0yAECc1fMZyYikr0r8
Content-Type: multipart/mixed; boundary="3FmQZ2Z9Q9fITSrbGyWmd6N4uqn59D9A2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
Message-ID: <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
Subject: Re: xenstored file descriptor leak
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
In-Reply-To: <20210203121738.GA2610@antioche.eu.org>

--3FmQZ2Z9Q9fITSrbGyWmd6N4uqn59D9A2
Content-Type: multipart/mixed;
 boundary="------------701DF3D0F8A84529FA650EDC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------701DF3D0F8A84529FA650EDC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.02.21 13:17, Manuel Bouyer wrote:
> On Wed, Feb 03, 2021 at 01:13:53PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 03.02.21 13:03, Manuel Bouyer wrote:
>>> On Wed, Feb 03, 2021 at 12:54:23PM +0100, J=C3=BCrgen Gro=C3=9F wrote=
:
>>>> On 03.02.21 12:48, Manuel Bouyer wrote:
>>>>> On Wed, Feb 03, 2021 at 09:21:32AM +0100, J=C3=BCrgen Gro=C3=9F wro=
te:
>>>>>> [...]
>>>>>> This shouldn't happen in case we are closing the socket actively.
>>>>>>
>>>>>> In the end we should just do a talloc_free(conn) in
>>>>>> ignore_connection() if it is a socket based one. This should rever=
t
>>>>>> the critical modification of the XSA-115 fixes for sockets while
>>>>>> keeping the desired effect for domain connections.
>>>>>
>>>>> Hello
>>>>> here's an updated patch which works for me. Does anyone see a probl=
em
>>>>> with it ? If not I will submit it for commit.
>>>>>
>>>>
>>>> Do you really need the first hunk? I would have thought just freeing=

>>>> conn in ignore_connection() is enough.
>>>>
>>>> In case you are seeing problems without the first hunk, please say s=
o
>>>> in a comment added to this hunk in order to avoid it being removed
>>>> sometimes in the future.
>>>
>>> No I don't need it. From your previous comments I though it was a goo=
d idea
>>> to keep it, but I can remove it if you think it's better.
>>
>> Yes, please remove it.
>=20
> Will do
>=20
> In the patch I'm going to submit, may I add
>=20
> Reviewed-by: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> ?
>=20

Let me see the patch (including commit message) first, please.

So just send out as a regular patch, and I'll respond accordingly. :-)


Juergen

--------------701DF3D0F8A84529FA650EDC
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

--------------701DF3D0F8A84529FA650EDC--

--3FmQZ2Z9Q9fITSrbGyWmd6N4uqn59D9A2--

--dE2Xx7OnGdgonja0yAECc1fMZyYikr0r8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAalWcFAwAAAAAACgkQsN6d1ii/Ey9O
Jgf8DUjNoZmav0MJTHm3reJkRMcuCo1k56d1YZtI3sa0hXpVOsw5WXFATzg3RRWw1F1tLDHRZpqa
pF5JJ+BWrh+QpCxXMmPPJSk8iLAH7cNq9DJHl8tyFVzWvdIpzfbgsTWftD7Zdqk3KPtDyTpLf7Gq
kA5zYtyR+eQQepMm115x7WBVi/tEBOCOH7rb49kJg6upopvmKtq4C54ciU09ErIUEguycOAOpKKE
VZOkx3HiexD/y4byR8F0PPP4cmrQYIvc246Gn2hriTxuhR/uUh/fTVI5Tyzkuamq4bT9wBrpxP1w
V3Z7ckUImgirPin910D7WZ5gpfib18Ps4wRfKUnVTQ==
=J/0t
-----END PGP SIGNATURE-----

--dE2Xx7OnGdgonja0yAECc1fMZyYikr0r8--

