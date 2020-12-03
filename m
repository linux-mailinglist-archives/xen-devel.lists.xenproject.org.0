Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD082CD2DD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 10:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43285.77844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklGY-0005VL-FL; Thu, 03 Dec 2020 09:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43285.77844; Thu, 03 Dec 2020 09:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklGY-0005Uw-CB; Thu, 03 Dec 2020 09:51:10 +0000
Received: by outflank-mailman (input) for mailman id 43285;
 Thu, 03 Dec 2020 09:51:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kklGW-0005Ur-MY
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 09:51:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ff6a737-147b-45e7-94b6-8e5085aac97a;
 Thu, 03 Dec 2020 09:51:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6796AD41;
 Thu,  3 Dec 2020 09:51:03 +0000 (UTC)
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
X-Inumbo-ID: 6ff6a737-147b-45e7-94b6-8e5085aac97a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606989063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qbY9qgML224Q9oA2ZDLIgpLcJl5U9LYu8RN1jSojU6I=;
	b=cNsUJivVR1wmG+ZSQGLbL8JIyzij4+db4po29hRFxwl/7ze8jzzlhNInJD8BxHEJ70CP7B
	2eT+2lsRObdHSU8lBmv647DN8iit1L7f2IU1GPv+dru6VQ45lPxFZiF0g0chkJu/WhhnxZ
	wxH18W0m2RzH3WXN4+SZJN8CHdP3syI=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
 <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
 <4ddee6b8-36bb-63ae-2221-78c1768b3355@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
Message-ID: <5e0a7a74-1d00-7f9f-e595-27f441c5c200@suse.com>
Date: Thu, 3 Dec 2020 10:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4ddee6b8-36bb-63ae-2221-78c1768b3355@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iUmYVvk9AcNu7UpvuoAWd0MLEaieoAgsE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iUmYVvk9AcNu7UpvuoAWd0MLEaieoAgsE
Content-Type: multipart/mixed; boundary="wWa1WkU4HwNLL3kYQ6SaCgMectahfLiGa";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <5e0a7a74-1d00-7f9f-e595-27f441c5c200@suse.com>
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
 <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
 <4ddee6b8-36bb-63ae-2221-78c1768b3355@suse.com>
In-Reply-To: <4ddee6b8-36bb-63ae-2221-78c1768b3355@suse.com>

--wWa1WkU4HwNLL3kYQ6SaCgMectahfLiGa
Content-Type: multipart/mixed;
 boundary="------------E8F0A1D174FD905D8CBDB0A1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8F0A1D174FD905D8CBDB0A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 10:12, Jan Beulich wrote:
> On 03.12.2020 09:47, J=C3=BCrgen Gro=C3=9F wrote:
>> On 02.12.20 16:36, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>>    static int hypfs_write(struct hypfs_entry *entry,
>>>>                           XEN_GUEST_HANDLE_PARAM(void) uaddr, unsign=
ed long ulen)
>>>
>>> As a tangent, is there a reason these write functions don't take
>>> handles of "const void"? (I realize this likely is nothing that
>>> wants addressing right here.)
>>
>> Uh, this is harder than I thought.
>>
>> guest_handle_cast() doesn't handle const guest handle types currently:=

>>
>> hypfs.c:447:58: error: unknown type name =E2=80=98const_void=E2=80=99;=
 did you mean =E2=80=98const=E2=80=99?
>>            ret =3D hypfs_write(entry, guest_handle_cast(arg3, const_vo=
id),
>> arg4);
>>                                                             ^
>> /home/gross/xen/unstable/xen/include/xen/guest_access.h:26:5: note: in=

>> definition of macro =E2=80=98guest_handle_cast=E2=80=99
>>        type *_x =3D (hnd).p;                         \
>>        ^~~~
>>
>> Currently my ideas would be to either:
>>
>> - add a new macro for constifying a guest handle (type -> const_type)
>> - add a new macro for casting a guest handle to a const_type
>> - add typedefs for the const_* types (typedef const x const_x)
>> - open code the cast
>>
>> Or am I missing an existing variant?
>=20
> I don't think you are. Both of your first two suggestions look good
> to me - ultimately we may want to have both anyway, eventually. For
> its (presumed) type safety I may have a slight preference for
> option 1, albeit afaics guest_handle_cast() doesn't allow
> conversion between arbitrary types either (only to/from void).
>=20
> It's quite unfortunate that this requires an explicit cast in the
> first place, but what do you do.

Right.

I'm going with variant 2, as variant 1 is not really easy to achieve
without specifying the basic type as a macro parameter - which will
basically be variant 2.


Juergen

--------------E8F0A1D174FD905D8CBDB0A1
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

--------------E8F0A1D174FD905D8CBDB0A1--

--wWa1WkU4HwNLL3kYQ6SaCgMectahfLiGa--

--iUmYVvk9AcNu7UpvuoAWd0MLEaieoAgsE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/ItQYFAwAAAAAACgkQsN6d1ii/Ey9t
Rwf6A9tzXdXiLLON5l2hr3kE9X4E0RDfbk0NKxQX+ejvDYS65qCz+lmW5yZZXv3iF0uK/OsrPFJk
debW3HhdK8ungmbfqMkOA/fRs3b/R+JSF1i6ctDlPOUUS8ReqckY7dcR2+HtVLGcA2UJPhNFN8vY
K0Rigyw0tQf812MdX9zCTHIiN3mI0uNTjeJpdhu+lqLlYY5OC3WvrbL4lLH9DYsXkNkxz5izjHKI
C04nlqAcpa/vILBKqSpgGduQ42uNNEwffefH4cVjWYqTJNzNw2hizkGkCYOEhQ8Ijxqzcvfju96A
nGrWfFbL1d9ircGrTQzbkgnwh5ME2xxS6mQWcbwmXg==
=MuND
-----END PGP SIGNATURE-----

--iUmYVvk9AcNu7UpvuoAWd0MLEaieoAgsE--

