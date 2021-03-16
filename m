Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4D33D5DB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98316.186414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAny-0000Ab-5Y; Tue, 16 Mar 2021 14:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98316.186414; Tue, 16 Mar 2021 14:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAny-0000AE-2C; Tue, 16 Mar 2021 14:36:18 +0000
Received: by outflank-mailman (input) for mailman id 98316;
 Tue, 16 Mar 2021 14:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lMAnw-0000A2-SM
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:36:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 363a8f4c-e242-4bf1-ac16-9fa6a33d4545;
 Tue, 16 Mar 2021 14:36:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AA0DAC24;
 Tue, 16 Mar 2021 14:36:15 +0000 (UTC)
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
X-Inumbo-ID: 363a8f4c-e242-4bf1-ac16-9fa6a33d4545
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615905375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/q4K9e4H0Zu3cSkwfRmZdcTKIqOV0RtY9aTJQ2kmAw=;
	b=MN4UvV2y14Pgd62GNgoUQ6iTFmLXzlASADkRxIEBsP/Dsmh72MqFP6zf86UBswjWegZiwV
	dNDLKyxPLXJJhrcjyWURy7/mPWx1PxU3ybSTYp8322PPPXY7LjPOlUtzoN6JGU1/LJgqeo
	99EGkmVlHrJ+JWKpCOZGNZYR5fgHdjw=
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210313135500.27241-1-julien@xen.org>
 <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
 <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03787b98-9acd-f1a8-66d4-953d7c99ee0d@suse.com>
Date: Tue, 16 Mar 2021 15:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WJl28zx2WOijmssbcSvivsKFEuYYgKkAU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WJl28zx2WOijmssbcSvivsKFEuYYgKkAU
Content-Type: multipart/mixed; boundary="cnWzeKboVdvbeNdJVFkDV2gI3IBfIvU8W";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <03787b98-9acd-f1a8-66d4-953d7c99ee0d@suse.com>
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
References: <20210313135500.27241-1-julien@xen.org>
 <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
 <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
In-Reply-To: <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>

--cnWzeKboVdvbeNdJVFkDV2gI3IBfIvU8W
Content-Type: multipart/mixed;
 boundary="------------7B5EC05A112CD4B92482378F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7B5EC05A112CD4B92482378F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.03.21 15:35, Julien Grall wrote:
> Hi,
>=20
> On 15/03/2021 12:17, Andrew Cooper wrote:
>> On 13/03/2021 13:55, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Support to liveupdate C XenStored was adding during the 4.15
>>> development cycle. Add a section in SUPPORT.MD to explain what is the=

>>> support state.
>>>
>>> For now, it is a tech preview.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>
>>> CC: Juergen Gross <jgross@suse.com>
>>>
>>> It looks like the OCaml side was not merged in 4.15.
>>
>> Yes it was.
>>
>>> So I have only
>>> described the support state for C XenStored.
>>
>> What about stub-cxenstored?=C2=A0 I think it wants pointing out specif=
ically,
>> whatever its status, to avoid confusion.
>=20
> Is it even working? @Juergen?

LU of xenstore-stubdom isn't working yet.


Juergen


--------------7B5EC05A112CD4B92482378F
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

--------------7B5EC05A112CD4B92482378F--

--cnWzeKboVdvbeNdJVFkDV2gI3IBfIvU8W--

--WJl28zx2WOijmssbcSvivsKFEuYYgKkAU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBQwl4FAwAAAAAACgkQsN6d1ii/Ey/M
nwf9GaQwuaRlq+ZgvMcQEyf1+uTjgzBk1gH4K4Ft8gHBSXwj6jS3FaaDeyBoAyBmqs0MA4iN6ZtK
mJKXjTGwusVR6pkHZRsWkl63UFgg9t1QWD6ZqoaiTxhC2JW49O1+nvnsByudAN/Q/uW/NvAiByHQ
wiTaE2booXcMragR1MdGButgXsto09Aq7aoqt3a2F5nS5S6M/LcnCSqlo/uHnh1LXrA5kINrD8fK
St+qMFR5abZbK4jYHRcCcWrx1VAoFma5RIt4Y0xiVbKosfpaihQM3H+rIKZP2INB3HGfifX6gUiv
pil2FEH03/DEpjY5PnW774wRrjH6kMasWy1lqwZPoA==
=qQrn
-----END PGP SIGNATURE-----

--WJl28zx2WOijmssbcSvivsKFEuYYgKkAU--

