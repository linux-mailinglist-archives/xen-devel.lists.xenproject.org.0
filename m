Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A793B3477C4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100947.192671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP26t-0002t1-Pq; Wed, 24 Mar 2021 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100947.192671; Wed, 24 Mar 2021 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP26t-0002se-LS; Wed, 24 Mar 2021 11:55:39 +0000
Received: by outflank-mailman (input) for mailman id 100947;
 Wed, 24 Mar 2021 11:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyEQ=IW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lP26t-0002sZ-0W
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:55:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a521f19-259f-4848-8598-fdcd0b24db43;
 Wed, 24 Mar 2021 11:55:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF2B5AD38;
 Wed, 24 Mar 2021 11:55:36 +0000 (UTC)
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
X-Inumbo-ID: 7a521f19-259f-4848-8598-fdcd0b24db43
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616586937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XVCENo0/FbkKnamlZMpxMheXxCclzmuJ5I9EC54P5Dk=;
	b=rJMQxfvuwypdfTPzV5aYzMmS0Wrl5Of2R3s2KOfNv2I2AmtGTKSv0azO80MLFudpjraPyU
	As3zHx6bUX3FtJ5P6ukhB3a1eoCQ4bYp4/4tLMjSi+dcY8ZC/p1lUmQFOe/i1IIg1G5+W+
	Xq8mlkwMlDqJgL9+6/7TheNkDpRSHHs=
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210324113035.32691-1-jgross@suse.com>
 <5c051a69-44fb-f878-98da-9d6773cca72d@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6634facd-7113-687a-ee0b-06aa60b8ec7f@suse.com>
Date: Wed, 24 Mar 2021 12:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5c051a69-44fb-f878-98da-9d6773cca72d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ITpL1DH3ISsg9gChOV76SVsnWbZrTRuGF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ITpL1DH3ISsg9gChOV76SVsnWbZrTRuGF
Content-Type: multipart/mixed; boundary="0b31YfNyGZFnfSZOYhfVjccR9bPJycTDq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <6634facd-7113-687a-ee0b-06aa60b8ec7f@suse.com>
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
References: <20210324113035.32691-1-jgross@suse.com>
 <5c051a69-44fb-f878-98da-9d6773cca72d@citrix.com>
In-Reply-To: <5c051a69-44fb-f878-98da-9d6773cca72d@citrix.com>

--0b31YfNyGZFnfSZOYhfVjccR9bPJycTDq
Content-Type: multipart/mixed;
 boundary="------------BB42F39CCE0919B839A6E506"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BB42F39CCE0919B839A6E506
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.03.21 12:42, Andrew Cooper wrote:
> On 24/03/2021 11:30, Juergen Gross wrote:
>> xenstore_lib.h is in need to be tidied up a little bit:
>>
>> - the definition of struct xs_tdb_record_hdr shouldn't be here
>> - some symbols are not namespaced correctly
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2: minimal variant (Ian Jackson)
>> ---
>>   tools/include/xenstore_lib.h     | 17 ++++-------------
>>   tools/libs/store/libxenstore.map |  6 +++---
>>   tools/libs/store/xs.c            | 12 ++++++------
>>   tools/xenstore/utils.h           | 11 +++++++++++
>>   tools/xenstore/xenstore_client.c | 12 ++++++------
>>   5 files changed, 30 insertions(+), 28 deletions(-)
>>
>> diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib=
=2Eh
>> index 4c9b6d1685..f74ad7024b 100644
>> --- a/tools/include/xenstore_lib.h
>> +++ b/tools/include/xenstore_lib.h
>> @@ -43,15 +43,6 @@ struct xs_permissions
>>   	enum xs_perm_type perms;
>=20
> ^ This enum is still a ABI problem, as it has implementation defined
> size.=C2=A0 The containing struct is used by xs_perm_to_string().
>=20
> Substituting for int is probably the easiest option, because no amount
> of trickery with the enum values themselves can prevent the compiler
> deciding to use a long or larger for the object.

Switching to unsigned int and replacing the enum values with #defines
seems to be the way to go, as the enum values are basically bit mask
values.


Juergen

--------------BB42F39CCE0919B839A6E506
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

--------------BB42F39CCE0919B839A6E506--

--0b31YfNyGZFnfSZOYhfVjccR9bPJycTDq--

--ITpL1DH3ISsg9gChOV76SVsnWbZrTRuGF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBbKLgFAwAAAAAACgkQsN6d1ii/Ey9G
fAgAkyr5Q28ZPYlJxSgLjH9oicnPnWK4SPdSguT/fIfOHruS/pGp34KE95aaeywnBMeFoSsAac31
BNxcRooIo1dxGg/+OwfPRWWnOSYXwC8ksLbudOic3cPPuS986BkJVwHB6xd8ZHZMX1qgDqJMVEU0
Ec0VHls4axCT9BA3lSpbtSsWLe8Bip3QSAm08BTAZzElKmhwiz8ypof4+bKhdKzDI9Bw2cHa1qnp
SsorbQ15zxFt85M0M65wWgVuT7yq4mfKDSeo2S/pDJ6sWQOtI2GUbGTUUpYQt4gmYBQpDssYqa72
8IZhACLp66q869FNWJD/OUFCKE1WD/H2mj7I0QNJTw==
=snVm
-----END PGP SIGNATURE-----

--ITpL1DH3ISsg9gChOV76SVsnWbZrTRuGF--

