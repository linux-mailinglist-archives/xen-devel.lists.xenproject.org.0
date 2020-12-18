Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959062DE021
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56398.98752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBZX-0003Oe-73; Fri, 18 Dec 2020 08:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56398.98752; Fri, 18 Dec 2020 08:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBZX-0003OF-3u; Fri, 18 Dec 2020 08:57:11 +0000
Received: by outflank-mailman (input) for mailman id 56398;
 Fri, 18 Dec 2020 08:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4wv=FW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kqBZV-0003Nu-1C
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:57:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66ec1bd3-498d-4f03-9daa-fc6197f8d050;
 Fri, 18 Dec 2020 08:57:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE1B7ADF8;
 Fri, 18 Dec 2020 08:57:06 +0000 (UTC)
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
X-Inumbo-ID: 66ec1bd3-498d-4f03-9daa-fc6197f8d050
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608281827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xgFFFXewsSNqCc0ZDQFTjtiU6o+sJFsG/qyhDsT9zTg=;
	b=OR3hzyWsjdXPylj69AyaMyqqwRU7Sn4rS1Q7V3ZTLXjytQe8tywuiZ8VuIrkLxWVou/6B1
	ceFx5oG9U965VVG7FlKPuTayDdd+CD/O5mTKxTvXOoH1OqsLVVu0BMMTsLWYXpZZVxEeEb
	KC1r9ZieVAmMMVZtiMCNseF04vqELUw=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
 <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
 <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
Message-ID: <bde3d3b1-a512-e1fe-cfd4-287fa0ea95cd@suse.com>
Date: Fri, 18 Dec 2020 09:57:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yRdKkYUL7Ih8NQ3MvIKdVmat9TVlWngQp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yRdKkYUL7Ih8NQ3MvIKdVmat9TVlWngQp
Content-Type: multipart/mixed; boundary="GmQrM7aQfQKBrdSy6lEa0Wgy1FdQ4c5qI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <bde3d3b1-a512-e1fe-cfd4-287fa0ea95cd@suse.com>
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
 <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
 <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>
In-Reply-To: <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>

--GmQrM7aQfQKBrdSy6lEa0Wgy1FdQ4c5qI
Content-Type: multipart/mixed;
 boundary="------------B5BEB2992E139D7B84FEB59B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B5BEB2992E139D7B84FEB59B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.20 13:14, Jan Beulich wrote:
> On 17.12.2020 12:32, J=C3=BCrgen Gro=C3=9F wrote:
>> On 17.12.20 12:28, Jan Beulich wrote:
>>> On 09.12.2020 17:09, Juergen Gross wrote:
>>>> +static const struct hypfs_entry *hypfs_dyndir_enter(
>>>> +    const struct hypfs_entry *entry)
>>>> +{
>>>> +    const struct hypfs_dyndir_id *data;
>>>> +
>>>> +    data =3D hypfs_get_dyndata();
>>>> +
>>>> +    /* Use template with original enter function. */
>>>> +    return data->template->e.funcs->enter(&data->template->e);
>>>> +}
>>>
>>> At the example of this (applies to other uses as well): I realize
>>> hypfs_get_dyndata() asserts that the pointer is non-NULL, but
>>> according to the bottom of ./CODING_STYLE this may not be enough
>>> when considering the implications of a NULL deref in the context
>>> of a PV guest. Even this living behind a sysctl doesn't really
>>> help, both because via XSM not fully privileged domains can be
>>> granted access, and because speculation may still occur all the
>>> way into here. (I'll send a patch to address the latter aspect in
>>> a few minutes.) While likely we have numerous existing examples
>>> with similar problems, I guess in new code we'd better be as
>>> defensive as possible.
>>
>> What do you suggest? BUG_ON()?
>=20
> Well, BUG_ON() would be a step in the right direction, converting
> privilege escalation to DoS. The question is if we can't do better
> here, gracefully failing in such a case (the usual pair of
> ASSERT_UNREACHABLE() plus return/break/goto approach doesn't fit
> here, at least not directly).
>=20
>> You are aware that this is nothing a user can influence, so it would
>> be a clear coding error in the hypervisor?
>=20
> A user (or guest) can't arrange for there to be a NULL pointer,
> but if there is one that can be run into here, this would still
> require an XSA afaict.

I still don't see how this could happen without a major coding bug,
which IMO wouldn't go unnoticed during a really brief test (this is
the reason for ASSERT() in hypfs_get_dyndata() after all).

Its not as if the control flow would allow many different ways to reach
any of the hypfs_get_dyndata() calls.

I can add security checks at the appropriate places, but I think this
would be just dead code. OTOH if you are feeling strong here lets go
with it.


Juergen

--------------B5BEB2992E139D7B84FEB59B
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

--------------B5BEB2992E139D7B84FEB59B--

--GmQrM7aQfQKBrdSy6lEa0Wgy1FdQ4c5qI--

--yRdKkYUL7Ih8NQ3MvIKdVmat9TVlWngQp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/cbuEFAwAAAAAACgkQsN6d1ii/Ey+Q
Vwf9EdNlNQe10qLZAl8PZ7Paf+kegJsx2KF0PLFlp17oi2KtEQxFTSz4ZDOYe950BTgtVIwH1Al0
RPCa+bJi8MSeC526Ms1is5TS44HBBecZFauMZiqu+75YJZg9+1esbOfngV/hajKaElF4YW/VgzDr
BLb7pJjWl8bhpeJHT8AlOZ8oRAMWqdoZNNGVPys9MnVxqf6mmRKTn0KOfRIL0H5mSHmrs+7sfr8R
YJC/RBJFuhZn7K0LpZDeUxwHuoShIKdzRhbSCc0aUqSQomPyG8jiRJMw+kSR/BdpyMVB70xB+SNO
B5F4eS9GSMSdOKNItdWU2n5qUpQ+u0MjEh5PX4gXww==
=6q1j
-----END PGP SIGNATURE-----

--yRdKkYUL7Ih8NQ3MvIKdVmat9TVlWngQp--

